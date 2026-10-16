#!/usr/bin/env bash
# Importa prisma/data/seed-data.sql en una BD con migraciones ya aplicadas.
# Uso: ./scripts/import-seed.sh   (requiere contenedor db corriendo; usa DB_CONTAINER para cambiarlo)
set -euo pipefail
cd "$(dirname "$0")/.."
CONTAINER="${DB_CONTAINER:-$(docker compose ps -q db 2>/dev/null | head -1)}"
: "${CONTAINER:?No se encontró el contenedor db; define DB_CONTAINER=<nombre>}"
DB="${DB_NAME:-sinapsis}"

# Vacía las tablas (excepto _prisma_migrations) para evitar conflictos con roles/admin
# creados por `prisma db seed`, y luego carga los datos, todo en una transacción.
{
  echo "DO \$\$ DECLARE t text; BEGIN"
  echo "  FOR t IN SELECT quote_ident(tablename) FROM pg_tables WHERE schemaname='public' AND tablename <> '_prisma_migrations' LOOP"
  echo "    EXECUTE 'TRUNCATE TABLE public.' || t || ' CASCADE'; END LOOP; END \$\$;"
  cat prisma/data/seed-data.sql
} | docker exec -i -e PGOPTIONS="-c client_min_messages=warning" "$CONTAINER" psql -U postgres -d "$DB" -v ON_ERROR_STOP=1 --single-transaction -q
echo "Datos importados."
