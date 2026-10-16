-- Separa las imagenes de variante en su propia tabla.
--   ProductImage        -> solo vinculada a Product (sin variante).
--   ProductVariantImage -> solo vinculada a ProductVariant.

-- 1) Nueva tabla.
CREATE TABLE "ProductVariantImage" (
    "id" UUID NOT NULL,
    "variantId" UUID NOT NULL,
    "url" TEXT NOT NULL,
    "position" INTEGER NOT NULL DEFAULT 0,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ProductVariantImage_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "ProductVariantImage_url_not_blank" CHECK (btrim("url") <> ''),
    CONSTRAINT "ProductVariantImage_position_nonnegative" CHECK ("position" >= 0)
);

CREATE INDEX "ProductVariantImage_variantId_position_idx" ON "ProductVariantImage"("variantId", "position");

-- A lo sumo una imagen principal por variante.
CREATE UNIQUE INDEX "ProductVariantImage_variantId_primary_key"
ON "ProductVariantImage"("variantId") WHERE "isPrimary";

ALTER TABLE "ProductVariantImage"
    ADD CONSTRAINT "ProductVariantImage_variantId_fkey"
    FOREIGN KEY ("variantId") REFERENCES "ProductVariant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- 2) Mover los datos existentes de imagenes de variante.
INSERT INTO "ProductVariantImage" ("id","variantId","url","position","isPrimary","createdAt")
SELECT "id","variantId","url","position","isPrimary","createdAt"
FROM "ProductImage"
WHERE "variantId" IS NOT NULL;

DELETE FROM "ProductImage" WHERE "variantId" IS NOT NULL;

-- 3) ProductImage queda solo con Product.
DROP INDEX "ProductImage_variantId_primary_key";
DROP INDEX "ProductImage_productId_primary_key";
DROP INDEX "ProductImage_variantId_idx";
ALTER TABLE "ProductImage" DROP CONSTRAINT "ProductImage_variantId_productId_fkey";
ALTER TABLE "ProductImage" DROP COLUMN "variantId";

-- La FK compuesta ya no se usa.
DROP INDEX "ProductVariant_id_productId_key";

-- A lo sumo una imagen principal por producto.
CREATE UNIQUE INDEX "ProductImage_productId_primary_key"
ON "ProductImage"("productId") WHERE "isPrimary";
