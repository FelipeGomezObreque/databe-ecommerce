/*
  Seed inicial para roles del sistema y reubicación básica de datos legados si existen.
  - Crea roles con tenantId = null para cada SystemRole.
  - Si existe la tabla legacy `roles_users`, importa los nombres de rol como Roles (tenantId = null, code = null).
    Nota: No migra asignaciones usuario↔rol porque el nuevo modelo requiere tenantId y los IDs legados no son UUID.
*/

const { PrismaClient } = require('@prisma/client');
const { Pool } = require('pg');
const { PrismaPg } = require('@prisma/adapter-pg');
const { bootstrapAdmin, describe } = require('./bootstrap-admin');

const pool = new Pool({ connectionString: process.env.DATABASE_URL });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function ensureSystemRoles() {
  const roles = [
    { name: 'OWNER', description: 'Tenant owner', code: 'OWNER' },
    { name: 'ADMIN', description: 'Administrator', code: 'ADMIN' },
    { name: 'MANAGER', description: 'Store manager', code: 'MANAGER' },
    { name: 'OPERATOR', description: 'Operations operator', code: 'OPERATOR' },
    { name: 'SUPPORT', description: 'Support agent', code: 'SUPPORT' },
    { name: 'ANALYST', description: 'Analyst', code: 'ANALYST' },
  ];

  for (const r of roles) {
    const existing = await prisma.role.findFirst({
      where: { tenantId: null, name: r.name },
    });
    if (existing) {
      await prisma.role.update({
        where: { id: existing.id },
        data: { description: r.description, code: r.code },
      });
    } else {
      await prisma.role.create({
        data: { tenantId: null, name: r.name, description: r.description, code: r.code },
      });
    }
  }
  console.info('System roles ensured.');
}

async function importLegacyRolesIfAny() {
  // Detectar si existe la tabla legacy roles_users (esquema public)
  const existsRows = await prisma.$queryRawUnsafe(
    "SELECT to_regclass('public.roles_users') IS NOT NULL AS exists"
  );
  const exists = Array.isArray(existsRows) && existsRows[0] && (existsRows[0].exists === true || existsRows[0].exists === 't');
  if (!exists) {
    return;
  }

  const rows = await prisma.$queryRawUnsafe('SELECT DISTINCT role FROM public.roles_users');
  const legacy = Array.isArray(rows)
    ? rows
        .map(r => (typeof r.role === 'string' ? r.role.trim().toUpperCase() : ''))
        .filter(Boolean)
    : [];
  if (legacy.length === 0) return;

  for (const name of legacy) {
    const existing = await prisma.role.findFirst({
      where: { tenantId: null, name },
    });
    if (!existing) {
      await prisma.role.create({
        data: { tenantId: null, name, description: 'Imported legacy role', code: null },
      });
    }
  }
  console.info(`Imported ${legacy.length} legacy role names into Role (tenantId = null).`);
  console.warn('User↔role assignments from legacy roles_users were NOT migrated because Membership requires tenantId and UUID users.');
}

async function main() {
  await ensureSystemRoles();
  await importLegacyRolesIfAny();

  // El administrador inicial es opt-in: sin ninguna variable BOOTSTRAP_ADMIN_* se omite.
  // Si se define solo una de ellas, bootstrapAdmin falla con un mensaje claro.
  if (process.env.BOOTSTRAP_ADMIN_EMAIL || process.env.BOOTSTRAP_ADMIN_PASSWORD) {
    console.info(describe(await bootstrapAdmin(prisma)));
  } else {
    console.info('BOOTSTRAP_ADMIN_* no definidas: se omite la creacion del administrador de plataforma.');
  }
}

main()
  .then(async () => {
    await prisma.$disconnect();
    await pool.end();
  })
  .catch(async (e) => {
    // Nunca volcamos el error completo de bootstrap (podria incluir datos sensibles).
    console.error(e && e.name === 'BootstrapError' ? `Error: ${e.message}` : e);
    await prisma.$disconnect();
    await pool.end();
    process.exit(1);
  });
