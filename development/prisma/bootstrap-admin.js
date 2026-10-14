/*
  Bootstrap del primer PLATFORM_ADMIN. Se ejecuta SOLO desde terminal (seed o
  `npm run seed:admin`); no existe ningun endpoint HTTP que haga esto.

  Variables:
    BOOTSTRAP_ADMIN_EMAIL                requerida
    BOOTSTRAP_ADMIN_PASSWORD             requerida (min 8 caracteres, max 72 bytes)
    BOOTSTRAP_ADMIN_CREATE_CREDENTIAL    opcional ("true"): si el usuario existe SIN
                                         contrasena local, permite crearsela.

  Garantias: idempotente, nunca sobrescribe una contrasena existente, nunca
  imprime contrasenas ni hashes. El hash es bcrypt con el mismo coste (10) que
  usa el backend Go (bcrypt.DefaultCost) y es compatible con su login.
*/
const bcrypt = require('bcryptjs');

const BCRYPT_COST = 10; // = golang.org/x/crypto/bcrypt DefaultCost
const MIN_PASSWORD_LENGTH = 8;
const MAX_PASSWORD_BYTES = 72;
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

class BootstrapError extends Error {
  constructor(message) {
    super(message);
    this.name = 'BootstrapError';
  }
}

function readConfig(env) {
  const email = (env.BOOTSTRAP_ADMIN_EMAIL || '').trim().toLowerCase();
  const password = env.BOOTSTRAP_ADMIN_PASSWORD || '';
  const missing = [];
  if (!email) missing.push('BOOTSTRAP_ADMIN_EMAIL');
  if (!password) missing.push('BOOTSTRAP_ADMIN_PASSWORD');
  if (missing.length) {
    throw new BootstrapError(`Faltan variables de entorno obligatorias: ${missing.join(', ')}`);
  }
  if (email.length > 254 || !EMAIL_RE.test(email)) {
    throw new BootstrapError('BOOTSTRAP_ADMIN_EMAIL no es un email valido');
  }
  if ([...password].length < MIN_PASSWORD_LENGTH || Buffer.byteLength(password, 'utf8') > MAX_PASSWORD_BYTES) {
    throw new BootstrapError(
      `BOOTSTRAP_ADMIN_PASSWORD debe tener al menos ${MIN_PASSWORD_LENGTH} caracteres y como maximo ${MAX_PASSWORD_BYTES} bytes`
    );
  }
  return {
    email,
    password,
    createCredential: String(env.BOOTSTRAP_ADMIN_CREATE_CREDENTIAL || '').toLowerCase() === 'true',
  };
}

/** Devuelve { action: 'created' | 'promoted' | 'unchanged' | 'credential_added', email }. */
async function bootstrapAdmin(prisma, env = process.env) {
  const cfg = readConfig(env);

  return prisma.$transaction(async (tx) => {
    // Serializa ejecuciones concurrentes sobre el mismo email.
    await tx.$executeRaw`SELECT pg_advisory_xact_lock(hashtextextended(${cfg.email}, 0))`;

    const matches = await tx.user.findMany({
      where: { email: { equals: cfg.email, mode: 'insensitive' } },
      include: { credential: { select: { id: true } } },
    });
    if (matches.length > 1) {
      throw new BootstrapError('Existen varios usuarios con ese email (distinta capitalizacion); resuelvelo manualmente.');
    }

    if (matches.length === 0) {
      const passwordHash = await bcrypt.hash(cfg.password, BCRYPT_COST);
      await tx.user.create({
        data: {
          email: cfg.email,
          name: 'Platform Admin',
          status: 'ACTIVE',
          platformRole: 'PLATFORM_ADMIN',
          credential: { create: { passwordHash } },
        },
      });
      return { action: 'created', email: cfg.email };
    }

    const user = matches[0];
    if (user.status !== 'ACTIVE') {
      throw new BootstrapError('El usuario existe pero no esta ACTIVE; no se reactiva ni promueve automaticamente.');
    }

    let credentialAdded = false;
    if (!user.credential) {
      if (!cfg.createCredential) {
        throw new BootstrapError(
          'El usuario existe pero no tiene contrasena local, asi que no podria iniciar sesion. ' +
            'No se modifico nada. Si quieres crearle una con BOOTSTRAP_ADMIN_PASSWORD, define BOOTSTRAP_ADMIN_CREATE_CREDENTIAL=true.'
        );
      }
      const passwordHash = await bcrypt.hash(cfg.password, BCRYPT_COST);
      await tx.authCredential.create({ data: { userId: user.id, passwordHash } });
      credentialAdded = true;
    }

    if (user.platformRole !== 'PLATFORM_ADMIN') {
      await tx.user.update({ where: { id: user.id }, data: { platformRole: 'PLATFORM_ADMIN' } });
      return { action: 'promoted', email: user.email, credentialAdded };
    }
    return { action: credentialAdded ? 'credential_added' : 'unchanged', email: user.email, credentialAdded };
  });
}

function describe(result) {
  switch (result.action) {
    case 'created':
      return `Administrador de plataforma creado: ${result.email}`;
    case 'promoted':
      return `Usuario existente promovido a PLATFORM_ADMIN: ${result.email} (su contrasena no se modifico${result.credentialAdded ? '; se le creo una contrasena local' : ''})`;
    case 'credential_added':
      return `Contrasena local creada para el administrador existente: ${result.email}`;
    default:
      return `El administrador ya existe, sin cambios: ${result.email} (la contrasena no se modifica)`;
  }
}

module.exports = { bootstrapAdmin, readConfig, describe, BootstrapError, BCRYPT_COST };
