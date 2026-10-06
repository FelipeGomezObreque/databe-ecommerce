/*
  Seed inicial para roles del sistema y reubicación básica de datos legados si existen.
  - Crea roles con tenantId = null para cada SystemRole.
  - Si existe la tabla legacy `roles_users`, importa los nombres de rol como Roles (tenantId = null, code = null).
    Nota: No migra asignaciones usuario↔rol porque el nuevo modelo requiere tenantId y los IDs legados no son UUID.
*/

const { PrismaClient } = require('@prisma/client');
const { Pool } = require('pg');
const { PrismaPg } = require('@prisma/adapter-pg');

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
}

main()
  .then(async () => {
    await prisma.$disconnect();
    await pool.end();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    await pool.end();
    process.exit(1);
  });
