// Uso: BOOTSTRAP_ADMIN_EMAIL=... BOOTSTRAP_ADMIN_PASSWORD=... npm run seed:admin
const { PrismaClient } = require('@prisma/client');
const { Pool } = require('pg');
const { PrismaPg } = require('@prisma/adapter-pg');
const { bootstrapAdmin, describe, BootstrapError } = require('../prisma/bootstrap-admin');

async function main() {
  const pool = new Pool({ connectionString: process.env.DATABASE_URL });
  const prisma = new PrismaClient({ adapter: new PrismaPg(pool) });
  try {
    console.info(describe(await bootstrapAdmin(prisma)));
  } finally {
    await prisma.$disconnect();
    await pool.end();
  }
}

main().catch((e) => {
  if (e instanceof BootstrapError) {
    console.error(`Error: ${e.message}`);
  } else {
    console.error(`Error inesperado al crear el administrador inicial: ${e && e.name ? `${e.name}: ` : ''}${e && e.message ? e.message : e}`);
  }
  process.exit(1);
});
