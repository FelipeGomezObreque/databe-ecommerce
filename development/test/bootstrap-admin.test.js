// Requiere TEST_DATABASE_URL (base con migraciones aplicadas). Ejecutar: npm test
const test = require('node:test');
const assert = require('node:assert/strict');
const bcrypt = require('bcryptjs');
const { PrismaClient } = require('@prisma/client');
const { Pool } = require('pg');
const { PrismaPg } = require('@prisma/adapter-pg');
const { bootstrapAdmin, readConfig } = require('../prisma/bootstrap-admin');

const url = process.env.TEST_DATABASE_URL;
const skip = url ? false : 'TEST_DATABASE_URL no definido';
const PASSWORD = 'S3cret-pass-Test!';
const uniq = () => Math.random().toString(36).slice(2, 10);

test('readConfig falla claro si faltan variables o son invalidas', () => {
  assert.throws(() => readConfig({}), /BOOTSTRAP_ADMIN_EMAIL, BOOTSTRAP_ADMIN_PASSWORD/);
  assert.throws(() => readConfig({ BOOTSTRAP_ADMIN_EMAIL: 'a@b.cl' }), /BOOTSTRAP_ADMIN_PASSWORD/);
  assert.throws(() => readConfig({ BOOTSTRAP_ADMIN_EMAIL: 'nope', BOOTSTRAP_ADMIN_PASSWORD: PASSWORD }), /email valido/);
  assert.throws(() => readConfig({ BOOTSTRAP_ADMIN_EMAIL: 'a@b.cl', BOOTSTRAP_ADMIN_PASSWORD: 'short' }), /al menos 8/);
  assert.throws(() => readConfig({ BOOTSTRAP_ADMIN_EMAIL: 'a@b.cl', BOOTSTRAP_ADMIN_PASSWORD: 'x'.repeat(73) }), /72 bytes/);
});

test('seed de administrador', { skip }, async (t) => {
  const pool = new Pool({ connectionString: url });
  const prisma = new PrismaClient({ adapter: new PrismaPg(pool) });
  t.after(async () => { await prisma.$disconnect(); await pool.end(); });
  const env = (email, extra = {}) => ({ BOOTSTRAP_ADMIN_EMAIL: email, BOOTSTRAP_ADMIN_PASSWORD: PASSWORD, ...extra });

  await t.test('crea el admin, con rol global y credencial valida para el login', async () => {
    const email = `Admin-${uniq()}@Test.Local`;
    const r = await bootstrapAdmin(prisma, env(email));
    assert.equal(r.action, 'created');
    const u = await prisma.user.findUnique({ where: { email: email.toLowerCase() }, include: { credential: true, memberships: true } });
    assert.equal(u.platformRole, 'PLATFORM_ADMIN');
    assert.equal(u.status, 'ACTIVE');
    assert.equal(u.memberships.length, 0, 'el rol global no crea memberships de tenant');
    assert.ok(u.credential.passwordHash.startsWith('$2'));
    assert.ok(await bcrypt.compare(PASSWORD, u.credential.passwordHash));
  });

  await t.test('es idempotente: sin duplicados ni cambios de credencial', async () => {
    const email = `admin-${uniq()}@test.local`;
    await bootstrapAdmin(prisma, env(email));
    const before = await prisma.authCredential.findFirst({ where: { user: { email } } });
    const r = await bootstrapAdmin(prisma, env(email, { BOOTSTRAP_ADMIN_PASSWORD: 'Otra-clave-distinta-1' }));
    assert.equal(r.action, 'unchanged');
    assert.equal(await prisma.user.count({ where: { email } }), 1);
    assert.equal(await prisma.authCredential.count({ where: { user: { email } } }), 1);
    const after = await prisma.authCredential.findFirst({ where: { user: { email } } });
    assert.equal(after.passwordHash, before.passwordHash);
  });

  await t.test('promueve a un usuario existente sin sobrescribir su contrasena', async () => {
    const email = `user-${uniq()}@test.local`;
    const hash = await bcrypt.hash('clave-original-1', 10);
    const created = await prisma.user.create({ data: { email, name: 'U', status: 'ACTIVE', credential: { create: { passwordHash: hash } } } });
    assert.equal(created.platformRole, 'PLATFORM_USER');
    const r = await bootstrapAdmin(prisma, env(email));
    assert.equal(r.action, 'promoted');
    const u = await prisma.user.findUnique({ where: { email }, include: { credential: true } });
    assert.equal(u.platformRole, 'PLATFORM_ADMIN');
    assert.equal(u.credential.passwordHash, hash);
  });

  await t.test('usuario existente sin credencial: falla salvo opt-in explicito', async () => {
    const email = `nocred-${uniq()}@test.local`;
    await prisma.user.create({ data: { email, name: 'N', status: 'ACTIVE' } });
    await assert.rejects(bootstrapAdmin(prisma, env(email)), /no tiene contrasena local/);
    const u = await prisma.user.findUnique({ where: { email }, include: { credential: true } });
    assert.equal(u.platformRole, 'PLATFORM_USER');
    assert.equal(u.credential, null);
    const r = await bootstrapAdmin(prisma, env(email, { BOOTSTRAP_ADMIN_CREATE_CREDENTIAL: 'true' }));
    assert.equal(r.action, 'promoted');
    assert.equal(await prisma.authCredential.count({ where: { user: { email } } }), 1);
  });

  await t.test('rechaza usuarios inactivos', async () => {
    const email = `off-${uniq()}@test.local`;
    await prisma.user.create({ data: { email, name: 'O', status: 'INACTIVE' } });
    await assert.rejects(bootstrapAdmin(prisma, env(email)), /no esta ACTIVE/);
  });
});
