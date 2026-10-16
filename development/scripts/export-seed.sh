#!/usr/bin/env bash
# Exporta los datos actuales de la BD a prisma/data/seed-data.sql (solo datos, sin esquema).
# Uso: ./scripts/export-seed.sh   (requiere el contenedor ecommerce-db-1 corriendo)
set -euo pipefail
cd "$(dirname "$0")/.."
CONTAINER="${DB_CONTAINER:-ecommerce-db-1}"
DB="${DB_NAME:-sinapsis}"
OUT="prisma/data/seed-data.sql"

docker exec "$CONTAINER" pg_dump -U postgres -d "$DB" \
  --data-only --column-inserts --no-owner --disable-triggers \
  --exclude-table='_prisma_migrations' \
  --exclude-table='"Session"' \
  --exclude-table='"AccessToken"' \
  --exclude-table='"PasswordResetToken"' \
  --exclude-table='"AuditLog"' \
  > "$OUT"
echo "Seed generado: $OUT ($(wc -l < "$OUT") líneas)"
