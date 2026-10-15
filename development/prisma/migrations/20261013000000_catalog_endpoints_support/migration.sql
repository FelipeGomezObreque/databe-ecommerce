-- Soporte para los endpoints de tenants, tiendas, catalogo e inventario.
-- Migracion no destructiva: los datos existentes se conservan o se trasladan.

-- 1) Valores predeterminados de estado, moneda y zona horaria.
ALTER TABLE "Tenant" ALTER COLUMN "status" SET DEFAULT 'ACTIVE';

ALTER TABLE "Store"
    ALTER COLUMN "status" SET DEFAULT 'ACTIVE',
    ALTER COLUMN "currency" SET DEFAULT 'CLP',
    ALTER COLUMN "timezone" SET DEFAULT 'America/Santiago';

ALTER TABLE "Category" ALTER COLUMN "status" SET DEFAULT 'ACTIVE';
ALTER TABLE "Product" ALTER COLUMN "status" SET DEFAULT 'ACTIVE';
ALTER TABLE "ProductVariant" ALTER COLUMN "status" SET DEFAULT 'ACTIVE';
ALTER TABLE "PriceList" ALTER COLUMN "status" SET DEFAULT 'ACTIVE';

-- 2) trackInventory pasa de Product a ProductVariant (cada variante decide).
--    Se copia el valor actual de cada producto a todas sus variantes antes de
--    eliminar la columna antigua.
ALTER TABLE "ProductVariant" ADD COLUMN "trackInventory" BOOLEAN NOT NULL DEFAULT true;

UPDATE "ProductVariant" AS v
SET "trackInventory" = p."trackInventory"
FROM "Product" AS p
WHERE p."id" = v."productId";

ALTER TABLE "Product" DROP COLUMN "trackInventory";

-- 3) Lista de precios predeterminada: una unica por tienda.
ALTER TABLE "PriceList" ADD COLUMN "isDefault" BOOLEAN NOT NULL DEFAULT false;

-- Las tiendas existentes adoptan como predeterminada su lista activa en CLP mas antigua.
UPDATE "PriceList"
SET "isDefault" = true
WHERE "id" IN (
    SELECT DISTINCT ON ("storeId") "id"
    FROM "PriceList"
    WHERE "status" = 'ACTIVE' AND "currency" = 'CLP'
    ORDER BY "storeId", "createdAt", "id"
);

-- Prisma Schema no puede expresar indices unicos parciales.
CREATE UNIQUE INDEX "PriceList_storeId_default_key"
ON "PriceList"("storeId")
WHERE "isDefault";

-- 4) Invariantes de inventario y precios.
ALTER TABLE "Inventory"
    ADD CONSTRAINT "Inventory_quantity_nonnegative" CHECK ("quantity" >= 0),
    ADD CONSTRAINT "Inventory_reservedQuantity_nonnegative" CHECK ("reservedQuantity" >= 0),
    ADD CONSTRAINT "Inventory_reservedQuantity_lte_quantity" CHECK ("reservedQuantity" <= "quantity");

ALTER TABLE "Price"
    ADD CONSTRAINT "Price_amount_nonnegative" CHECK ("amount" >= 0);
