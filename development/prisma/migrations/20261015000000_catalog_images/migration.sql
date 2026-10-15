-- Imagenes de catalogo. Migracion no destructiva.

-- 1) Imagenes de categoria (misma forma que ProductImage).
CREATE TABLE "CategoryImage" (
    "id" UUID NOT NULL,
    "categoryId" UUID NOT NULL,
    "url" TEXT NOT NULL,
    "position" INTEGER NOT NULL DEFAULT 0,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CategoryImage_pkey" PRIMARY KEY ("id")
);

CREATE INDEX "CategoryImage_categoryId_position_idx" ON "CategoryImage"("categoryId", "position");

ALTER TABLE "CategoryImage"
    ADD CONSTRAINT "CategoryImage_categoryId_fkey"
    FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- 2) La imagen de una variante debe pertenecer al mismo producto que la variante.
--    Las filas existentes inconsistentes se convierten en imagenes generales del producto.
UPDATE "ProductImage" AS pi
SET "variantId" = NULL
WHERE pi."variantId" IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 FROM "ProductVariant" v
      WHERE v."id" = pi."variantId" AND v."productId" = pi."productId"
  );

CREATE UNIQUE INDEX "ProductVariant_id_productId_key" ON "ProductVariant"("id", "productId");

ALTER TABLE "ProductImage" DROP CONSTRAINT "ProductImage_variantId_fkey";

-- Con variantId NULL la FK compuesta no se evalua (imagen general). Al borrar la
-- variante se borran sus imagenes en lugar de quedar como imagenes generales.
ALTER TABLE "ProductImage"
    ADD CONSTRAINT "ProductImage_variantId_productId_fkey"
    FOREIGN KEY ("variantId", "productId") REFERENCES "ProductVariant"("id", "productId")
    ON DELETE CASCADE ON UPDATE CASCADE;

-- 3) Integridad de los datos de imagen (Prisma Schema no expresa CHECK ni indices parciales).
ALTER TABLE "ProductImage"
    ADD CONSTRAINT "ProductImage_url_not_blank" CHECK (btrim("url") <> ''),
    ADD CONSTRAINT "ProductImage_position_nonnegative" CHECK ("position" >= 0);

ALTER TABLE "CategoryImage"
    ADD CONSTRAINT "CategoryImage_url_not_blank" CHECK (btrim("url") <> ''),
    ADD CONSTRAINT "CategoryImage_position_nonnegative" CHECK ("position" >= 0);

-- A lo sumo una imagen principal por categoria, por producto (general) y por variante.
CREATE UNIQUE INDEX "CategoryImage_categoryId_primary_key"
ON "CategoryImage"("categoryId") WHERE "isPrimary";

CREATE UNIQUE INDEX "ProductImage_productId_primary_key"
ON "ProductImage"("productId") WHERE "isPrimary" AND "variantId" IS NULL;

CREATE UNIQUE INDEX "ProductImage_variantId_primary_key"
ON "ProductImage"("variantId") WHERE "isPrimary" AND "variantId" IS NOT NULL;
