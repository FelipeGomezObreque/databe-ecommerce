--
-- PostgreSQL database dump
--

\restrict 9mghpLkoJQ4e6TkXlKPk6QfSpCbf8jzfarTVJwxFG9pAptQTRgDINQCa7ZMcSXG

-- Dumped from database version 16.15
-- Dumped by pg_dump version 16.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: Tenant; Type: TABLE DATA; Schema: public; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public."Tenant" DISABLE TRIGGER ALL;

INSERT INTO public."Tenant" (id, name, slug, status, "createdAt", "updatedAt") VALUES ('65b2d003-06ab-4248-92c9-96525c71297e', 'Lushh Club', 'lushh-club', 'ACTIVE', '2026-10-14 17:01:55.071', '2026-10-14 17:01:55.075');


ALTER TABLE public."Tenant" ENABLE TRIGGER ALL;

--
-- Data for Name: Store; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Store" DISABLE TRIGGER ALL;

INSERT INTO public."Store" (id, "tenantId", name, slug, domain, currency, timezone, status, "createdAt", "updatedAt") VALUES ('8da6c466-f433-413f-8411-a9549dfe987b', '65b2d003-06ab-4248-92c9-96525c71297e', 'Ecommerce', 'ecommerce', 'lushhclub.cl', 'CLP', 'America/Santiago', 'ACTIVE', '2026-10-15 12:15:48.456', '2026-10-15 12:15:48.456');


ALTER TABLE public."Store" ENABLE TRIGGER ALL;

--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."User" DISABLE TRIGGER ALL;

INSERT INTO public."User" (id, email, name, "lastName", phone, status, "createdAt", "updatedAt", "platformRole") VALUES ('0250ff18-3950-434b-be28-1cea70a65e89', 'admin@tudominio.cl', 'Platform Admin', NULL, NULL, 'ACTIVE', '2026-10-14 16:39:09.222', '2026-10-14 16:39:09.222', 'PLATFORM_ADMIN');
INSERT INTO public."User" (id, email, name, "lastName", phone, status, "createdAt", "updatedAt", "platformRole") VALUES ('d8df046a-eaff-4e9c-baf3-a4d2170d42dc', 'obreque1305@gmail.com', 'Felipe', 'Gómez', '999435286', 'ACTIVE', '2026-10-14 13:25:12.481', '2026-10-14 16:39:44.737', 'PLATFORM_ADMIN');
INSERT INTO public."User" (id, email, name, "lastName", phone, status, "createdAt", "updatedAt", "platformRole") VALUES ('a9f5b685-491f-4197-bd22-09d22ed3a2b8', 'felipeg.obreque@gmail.com', 'Platform Admin', NULL, NULL, 'ACTIVE', '2026-10-14 16:55:44.414', '2026-10-14 16:55:44.414', 'PLATFORM_ADMIN');


ALTER TABLE public."User" ENABLE TRIGGER ALL;

--
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Customer" DISABLE TRIGGER ALL;



ALTER TABLE public."Customer" ENABLE TRIGGER ALL;

--
-- Data for Name: Address; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Address" DISABLE TRIGGER ALL;



ALTER TABLE public."Address" ENABLE TRIGGER ALL;

--
-- Data for Name: AuthCredential; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."AuthCredential" DISABLE TRIGGER ALL;

INSERT INTO public."AuthCredential" (id, "userId", "passwordHash", "passwordUpdatedAt", "createdAt") VALUES ('3a893473-1695-4b4b-aac0-eac10c32a83d', 'd8df046a-eaff-4e9c-baf3-a4d2170d42dc', '$2a$10$pCy4H0dW0pG1FKJEgaQsvuTjYD.QXS.6TzHQc6PdS97Ev2lLcG65a', '2026-10-14 13:25:12.481', '2026-10-14 13:25:12.481');
INSERT INTO public."AuthCredential" (id, "userId", "passwordHash", "passwordUpdatedAt", "createdAt") VALUES ('b6dc1df0-fea4-4135-97f2-b08cb97432bc', '0250ff18-3950-434b-be28-1cea70a65e89', '$2a$10$LhG/E3SS0w7tnLunhfbP2.laZvYVx1VZbwsxZioAVxH0F7WlVNyR2', '2026-10-14 16:39:09.222', '2026-10-14 16:39:09.222');
INSERT INTO public."AuthCredential" (id, "userId", "passwordHash", "passwordUpdatedAt", "createdAt") VALUES ('e89d0424-b605-4b88-85f9-beb61571433c', 'a9f5b685-491f-4197-bd22-09d22ed3a2b8', '$2a$10$38dpLoNBHytCOWW28DOPGuem1Zws3DEuKUw6wGJTetk1ER9A0ZmWa', '2026-10-14 16:55:44.414', '2026-10-14 16:55:44.414');


ALTER TABLE public."AuthCredential" ENABLE TRIGGER ALL;

--
-- Data for Name: AuthIdentity; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."AuthIdentity" DISABLE TRIGGER ALL;



ALTER TABLE public."AuthIdentity" ENABLE TRIGGER ALL;

--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Order" DISABLE TRIGGER ALL;



ALTER TABLE public."Order" ENABLE TRIGGER ALL;

--
-- Data for Name: BillingDocument; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."BillingDocument" DISABLE TRIGGER ALL;



ALTER TABLE public."BillingDocument" ENABLE TRIGGER ALL;

--
-- Data for Name: BillingDocumentItem; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."BillingDocumentItem" DISABLE TRIGGER ALL;



ALTER TABLE public."BillingDocumentItem" ENABLE TRIGGER ALL;

--
-- Data for Name: BillingProfile; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."BillingProfile" DISABLE TRIGGER ALL;



ALTER TABLE public."BillingProfile" ENABLE TRIGGER ALL;

--
-- Data for Name: Cart; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Cart" DISABLE TRIGGER ALL;



ALTER TABLE public."Cart" ENABLE TRIGGER ALL;

--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Product" DISABLE TRIGGER ALL;

INSERT INTO public."Product" (id, "storeId", name, slug, description, brand, status, "createdAt", "updatedAt") VALUES ('d8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'Polera deportiva', 'polera-deportiva', 'Un básico que no puede faltar en tu clóset. Cómodo y perfecto para entrenar o para tus outfits del día a día. Con sujetador para el busto para mayor seguridad.', 'Lushh Club', 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969');
INSERT INTO public."Product" (id, "storeId", name, slug, description, brand, status, "createdAt", "updatedAt") VALUES ('0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'Palazzo', 'calza-palazzo', 'Un básico que no puede faltar en tu clóset. Cómodo y perfecto para entrenar o para tus outfits del día a día. Con sujetador para el busto para mayor seguridad.', 'Lushh Club', 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343');


ALTER TABLE public."Product" ENABLE TRIGGER ALL;

--
-- Data for Name: ProductVariant; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."ProductVariant" DISABLE TRIGGER ALL;

INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('8bf605a1-ce00-4c7f-b835-448ca9d78cdf', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-BURDEO-C-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('36e29a9f-c5fe-4865-8b86-608fdd25e07a', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-BURDEO-C-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('aecceeda-19ba-4e17-97e1-0d8ebbdd7bc2', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-BURDEO-C-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('15a33672-421a-4c18-9a1e-050023114e67', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-BURDEO-C-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('76150ca1-38c5-4c36-9d40-064f67b7a593', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-NEGRO-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('c5193355-951a-438d-b5fa-71bbf38844d3', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-NEGRO-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('13ed86c1-dea1-4494-8d33-0a8731653ecf', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-NEGRO-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('d04c9ad3-2372-4eac-b364-3593305af436', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-NEGRO-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('da8871d3-2047-42ca-8b09-9ea3f5342a7d', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-MARENGO-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('b46cf89b-5e90-4016-86de-3784cbebfcaa', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-MARENGO-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('fb393da1-9447-426c-8cb7-aee063d6c6b1', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-MARENGO-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('feac985d-0881-4cc3-9a58-6aa057cdce10', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-MARENGO-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('417f62c1-500c-4db6-a0e4-f9536e2e1958', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-VERDE-PI-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('5426a9db-7dfc-4cf7-9cb0-08b624fa6a56', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-VERDE-PI-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('7d9d8da1-a892-4c53-af24-3d6f2dc3f8d4', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-VERDE-PI-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('ba9bb612-0c83-4059-97b6-f34febcb56b2', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-VERDE-PI-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('fe4a75a9-472c-4f9b-8448-4c6e124a6bcf', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-CELESTE-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('8fb9a0da-87da-4d42-a143-cba0f365a7cf', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-CELESTE-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', true);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('5e421734-be71-446e-ba02-f41f5fa9fd13', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-CELESTE-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('cc11fb51-4b9b-497c-98f4-b3c1d975799f', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-CELESTE-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('f27ed8d6-91f6-48ff-8bf6-d7a1dabd2db7', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-LILA-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('be364bd3-08aa-4c04-b9a9-22f98f510d62', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-LILA-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('b20d299d-803e-4ca2-9cce-dff23867da16', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-LILA-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('f0c575ff-34aa-41eb-876a-f17436bb5d3d', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-LILA-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('71feeb10-3439-4725-9103-080e5768d1b3', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-AZUL-ACE-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('de8fd598-715f-4996-9be2-58cecd623838', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-AZUL-ACE-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('ebdda66c-6e30-4e4d-bae3-772b70a7c91a', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-AZUL-ACE-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('29ac927e-f44a-46d3-96dc-d196686348a5', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', '8da6c466-f433-413f-8411-a9549dfe987b', 'POLERA-DEPORTIVA-AZUL-ACE-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-15 16:58:11.965', '2026-10-15 16:58:11.969', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('55a12ce8-deeb-4099-90d3-8da1a6b972d5', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-BURDEO-C-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('cd89eb72-3865-4caf-be92-ccd61fe425be', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-BURDEO-C-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('eb7835b8-da27-4139-9ac2-8082e469583d', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-BURDEO-C-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('b8704ca3-73af-4b00-a5ae-0ab969a538b4', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-BURDEO-C-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('36ea85ea-31e4-49a0-bbb4-47e6289cd3ce', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-NEGRO-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('07fd7c73-b0bb-4e6f-8610-129529eac203', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-NEGRO-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('3a6dd3d7-d517-43d5-99ac-9d9b9bf61f50', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-NEGRO-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('ce9c674b-2b7c-4251-a9db-680e5d6c9848', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-NEGRO-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('113f15f6-75b6-4618-95db-f7fe45045d53', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-MARENGO-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('119a6889-9a54-491c-be79-a6a5945fb730', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-MARENGO-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('839f17c5-361a-49a5-b6b0-5613888c378b', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-MARENGO-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('bd7b09a4-8a88-4b05-a423-2106c8b366fa', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-MARENGO-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('fcd187d1-ceb7-4e68-bd93-a3d985176b58', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-VERDE-PI-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('3751b754-38bb-47d4-9401-1fe715c2e365', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-VERDE-PI-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('3442c769-60f0-49a7-bf1c-b0e903e0cf26', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-VERDE-PI-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('2a0cf7fa-e8c2-443c-99a7-c1e432509d2e', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-VERDE-PI-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('e910a411-e939-4538-9448-f0faa5ed1dcd', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-CELESTE-S', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('6f7d72bc-6936-4875-87d8-fc3c770959a2', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-CELESTE-M', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('f8191e83-90e3-43c0-81c9-9867c4f9725c', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-CELESTE-L', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);
INSERT INTO public."ProductVariant" (id, "productId", "storeId", sku, barcode, weight, height, width, length, status, "createdAt", "updatedAt", "trackInventory") VALUES ('4dc83052-8f14-42f0-a251-031603de0ca1', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '8da6c466-f433-413f-8411-a9549dfe987b', 'CALZA-PALAZZO-CELESTE-XL', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', '2026-10-16 16:49:49.324', '2026-10-16 16:49:49.343', false);


ALTER TABLE public."ProductVariant" ENABLE TRIGGER ALL;

--
-- Data for Name: CartItem; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."CartItem" DISABLE TRIGGER ALL;



ALTER TABLE public."CartItem" ENABLE TRIGGER ALL;

--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Category" DISABLE TRIGGER ALL;

INSERT INTO public."Category" (id, "storeId", "parentId", name, slug, description, status, "createdAt", "updatedAt") VALUES ('2ad7ebd1-460f-40a8-ab03-81a08b2d07d9', '8da6c466-f433-413f-8411-a9549dfe987b', NULL, 'Calzas', 'calzas', 'Calzas', 'ACTIVE', '2026-10-15 13:37:22.015', '2026-10-15 13:37:22.015');
INSERT INTO public."Category" (id, "storeId", "parentId", name, slug, description, status, "createdAt", "updatedAt") VALUES ('86e03ee8-972f-4349-b715-0dbf6ccd87be', '8da6c466-f433-413f-8411-a9549dfe987b', NULL, 'Conjunto Deportivo', 'conjunto-deportivo', 'Conjunto Deportivo', 'ACTIVE', '2026-10-15 13:42:03.984', '2026-10-15 13:42:03.985');
INSERT INTO public."Category" (id, "storeId", "parentId", name, slug, description, status, "createdAt", "updatedAt") VALUES ('edb44fc1-85ee-455a-89fb-0ee76629c08c', '8da6c466-f433-413f-8411-a9549dfe987b', NULL, 'Petos Deportivos', 'petos-deportivos', 'Peto Deportivo', 'ACTIVE', '2026-10-15 13:42:45.409', '2026-10-15 13:42:45.409');


ALTER TABLE public."Category" ENABLE TRIGGER ALL;

--
-- Data for Name: CategoryImage; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."CategoryImage" DISABLE TRIGGER ALL;

INSERT INTO public."CategoryImage" (id, "categoryId", url, "position", "isPrimary", "createdAt") VALUES ('c75c0ae3-a232-449a-8c03-f201392b9b37', 'edb44fc1-85ee-455a-89fb-0ee76629c08c', '/category/PETOS/WhatsApp Image 2026-10-15 at 11.13.33 AM (1).jpeg', 1, false, '2026-10-16 10:29:20.988');
INSERT INTO public."CategoryImage" (id, "categoryId", url, "position", "isPrimary", "createdAt") VALUES ('f42f7d09-0163-40e5-a0b0-c7576c6121d0', 'edb44fc1-85ee-455a-89fb-0ee76629c08c', '/category/PETOS/WhatsApp Image 2026-10-15 at 11.13.33 AM.jpeg', 2, false, '2026-10-16 10:33:43.867');
INSERT INTO public."CategoryImage" (id, "categoryId", url, "position", "isPrimary", "createdAt") VALUES ('4ceb9d2d-ebda-45c2-94fe-afdf0548d17c', '2ad7ebd1-460f-40a8-ab03-81a08b2d07d9', '/category/PALAZO/WhatsApp Image 2026-10-10 at 6.07.29 PM (2).jpeg', 1, false, '2026-10-16 13:52:41.388');
INSERT INTO public."CategoryImage" (id, "categoryId", url, "position", "isPrimary", "createdAt") VALUES ('2b3578ef-02df-41d3-9f47-b6e7eb002616', '2ad7ebd1-460f-40a8-ab03-81a08b2d07d9', '/category/PALAZO/WhatsApp Image 2026-10-10 at 6.07.29 PM.jpeg', 2, false, '2026-10-16 13:53:14.976');


ALTER TABLE public."CategoryImage" ENABLE TRIGGER ALL;

--
-- Data for Name: Promotion; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Promotion" DISABLE TRIGGER ALL;



ALTER TABLE public."Promotion" ENABLE TRIGGER ALL;

--
-- Data for Name: Coupon; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Coupon" DISABLE TRIGGER ALL;



ALTER TABLE public."Coupon" ENABLE TRIGGER ALL;

--
-- Data for Name: Inventory; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Inventory" DISABLE TRIGGER ALL;



ALTER TABLE public."Inventory" ENABLE TRIGGER ALL;

--
-- Data for Name: InventoryMovement; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."InventoryMovement" DISABLE TRIGGER ALL;



ALTER TABLE public."InventoryMovement" ENABLE TRIGGER ALL;

--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."OrderItem" DISABLE TRIGGER ALL;



ALTER TABLE public."OrderItem" ENABLE TRIGGER ALL;

--
-- Data for Name: InventoryReservation; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."InventoryReservation" DISABLE TRIGGER ALL;



ALTER TABLE public."InventoryReservation" ENABLE TRIGGER ALL;

--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Role" DISABLE TRIGGER ALL;

INSERT INTO public."Role" (id, "tenantId", name, description, code) VALUES ('2f9593ed-12b0-407a-ab43-bb43c0314f29', NULL, 'OWNER', 'Tenant owner', 'OWNER');
INSERT INTO public."Role" (id, "tenantId", name, description, code) VALUES ('bc60ca24-910b-415d-9bc3-33cfda3d6a66', NULL, 'ADMIN', 'Administrator', 'ADMIN');
INSERT INTO public."Role" (id, "tenantId", name, description, code) VALUES ('3c28d2a6-e4c1-4a97-98c5-0b233763dff6', NULL, 'MANAGER', 'Store manager', 'MANAGER');
INSERT INTO public."Role" (id, "tenantId", name, description, code) VALUES ('a53c88bb-57be-4274-854f-9533a5b807ed', NULL, 'OPERATOR', 'Operations operator', 'OPERATOR');
INSERT INTO public."Role" (id, "tenantId", name, description, code) VALUES ('a7cd9c9e-2355-4adf-a717-852894c08522', NULL, 'SUPPORT', 'Support agent', 'SUPPORT');
INSERT INTO public."Role" (id, "tenantId", name, description, code) VALUES ('49a39a01-fbc4-4bb2-8ba1-53e3dcaefab7', NULL, 'ANALYST', 'Analyst', 'ANALYST');


ALTER TABLE public."Role" ENABLE TRIGGER ALL;

--
-- Data for Name: Membership; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Membership" DISABLE TRIGGER ALL;

INSERT INTO public."Membership" (id, "tenantId", "userId", "roleId", "createdAt") VALUES ('cf0edbbc-97bc-4cf4-a6ff-333155b00010', '65b2d003-06ab-4248-92c9-96525c71297e', 'a9f5b685-491f-4197-bd22-09d22ed3a2b8', '2f9593ed-12b0-407a-ab43-bb43c0314f29', '2026-10-14 17:01:55.071');


ALTER TABLE public."Membership" ENABLE TRIGGER ALL;

--
-- Data for Name: ProductOption; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."ProductOption" DISABLE TRIGGER ALL;

INSERT INTO public."ProductOption" (id, "productId", name, "position") VALUES ('341243c5-1e2a-44aa-aec3-4a61ad2ed27c', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', 'Color', 0);
INSERT INTO public."ProductOption" (id, "productId", name, "position") VALUES ('e09e2c59-4a98-465c-9603-312e775896f1', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', 'Talla', 1);
INSERT INTO public."ProductOption" (id, "productId", name, "position") VALUES ('79864d17-9e01-4206-9b55-03010e00f717', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', 'Color', 0);
INSERT INTO public."ProductOption" (id, "productId", name, "position") VALUES ('66160039-7654-4ec0-bbcb-9d4a05351ed8', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', 'Talla', 1);


ALTER TABLE public."ProductOption" ENABLE TRIGGER ALL;

--
-- Data for Name: OptionValue; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."OptionValue" DISABLE TRIGGER ALL;

INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('9038bdb5-9e8f-4573-9379-3d5a58799f18', '341243c5-1e2a-44aa-aec3-4a61ad2ed27c', 'Burdeo Claro', 0);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('9a202a0e-8868-4d45-ade3-a62f415af508', '341243c5-1e2a-44aa-aec3-4a61ad2ed27c', 'Negro', 1);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('26224f9e-01f1-450a-bf3a-6e2267e1a6f5', '341243c5-1e2a-44aa-aec3-4a61ad2ed27c', 'Marengo', 2);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('0c9cf1c4-e70b-4ac9-b57b-b0b7483e50c0', '341243c5-1e2a-44aa-aec3-4a61ad2ed27c', 'Verde Pistacho', 3);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('45199819-0245-4a57-8e38-34b9ca8ac9fc', '341243c5-1e2a-44aa-aec3-4a61ad2ed27c', 'Celeste', 4);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('abdca946-cabc-4576-94a4-f20e0f18dfa9', '341243c5-1e2a-44aa-aec3-4a61ad2ed27c', 'Lila', 5);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('63f424bc-63bd-4440-8313-d26c8468ce07', '341243c5-1e2a-44aa-aec3-4a61ad2ed27c', 'Azul acero', 6);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('d6924f15-c724-4dbe-b61c-128ac32446ab', 'e09e2c59-4a98-465c-9603-312e775896f1', 'S', 0);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('aa282201-ad21-4949-b2f6-7ea7b43f6ebd', 'e09e2c59-4a98-465c-9603-312e775896f1', 'M', 1);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('a9420d67-b1ef-462e-b396-4e10e31c1eec', 'e09e2c59-4a98-465c-9603-312e775896f1', 'L', 2);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('a8905468-0296-4d5d-9596-877fa9912ef2', 'e09e2c59-4a98-465c-9603-312e775896f1', 'XL', 3);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('9e27bafe-9f86-4ef1-a8df-a64c6293eba3', '79864d17-9e01-4206-9b55-03010e00f717', 'Burdeo Claro', 0);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('5724bc10-f6e1-4387-a301-6976d54baa6c', '79864d17-9e01-4206-9b55-03010e00f717', 'Negro', 1);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('358ce5aa-8374-4afa-9d3e-d24c40b5d335', '79864d17-9e01-4206-9b55-03010e00f717', 'Marengo', 2);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('86b1f2c1-19a7-4018-9b68-2b2da7da2698', '79864d17-9e01-4206-9b55-03010e00f717', 'Verde Pistacho', 3);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('00d9d93e-6726-4913-a354-7b56aa303238', '79864d17-9e01-4206-9b55-03010e00f717', 'Celeste', 4);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('6e3d00a7-a732-43ad-9ae1-7f06ae4e2bfb', '66160039-7654-4ec0-bbcb-9d4a05351ed8', 'S', 0);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('4c3cc76d-1ac2-4da2-a7a2-86f0291fc5dc', '66160039-7654-4ec0-bbcb-9d4a05351ed8', 'M', 1);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('e04d8518-4f01-4919-92ec-9695cfbd3d2e', '66160039-7654-4ec0-bbcb-9d4a05351ed8', 'L', 2);
INSERT INTO public."OptionValue" (id, "productOptionId", value, "position") VALUES ('5b23d7a5-a695-4d50-b5bf-ff84ba0a73c5', '66160039-7654-4ec0-bbcb-9d4a05351ed8', 'XL', 3);


ALTER TABLE public."OptionValue" ENABLE TRIGGER ALL;

--
-- Data for Name: OrderAddress; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."OrderAddress" DISABLE TRIGGER ALL;



ALTER TABLE public."OrderAddress" ENABLE TRIGGER ALL;

--
-- Data for Name: OrderPromotion; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."OrderPromotion" DISABLE TRIGGER ALL;



ALTER TABLE public."OrderPromotion" ENABLE TRIGGER ALL;

--
-- Data for Name: OutboxEvent; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."OutboxEvent" DISABLE TRIGGER ALL;



ALTER TABLE public."OutboxEvent" ENABLE TRIGGER ALL;

--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Payment" DISABLE TRIGGER ALL;



ALTER TABLE public."Payment" ENABLE TRIGGER ALL;

--
-- Data for Name: PaymentEvent; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."PaymentEvent" DISABLE TRIGGER ALL;



ALTER TABLE public."PaymentEvent" ENABLE TRIGGER ALL;

--
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Permission" DISABLE TRIGGER ALL;



ALTER TABLE public."Permission" ENABLE TRIGGER ALL;

--
-- Data for Name: PriceList; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."PriceList" DISABLE TRIGGER ALL;

INSERT INTO public."PriceList" (id, "storeId", name, currency, status, "createdAt", "updatedAt", "isDefault") VALUES ('3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '8da6c466-f433-413f-8411-a9549dfe987b', 'Precio general', 'CLP', 'ACTIVE', '2026-10-15 12:15:48.456', '2026-10-15 12:15:48.456', true);


ALTER TABLE public."PriceList" ENABLE TRIGGER ALL;

--
-- Data for Name: Price; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Price" DISABLE TRIGGER ALL;

INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('4627d081-507e-4bd0-9199-49d5782af36a', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '8bf605a1-ce00-4c7f-b835-448ca9d78cdf', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('54a38704-b343-443b-91ee-d00a5ca6a342', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '36e29a9f-c5fe-4865-8b86-608fdd25e07a', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('af6c1a1b-6119-4c67-861e-e54e9ca8e151', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'aecceeda-19ba-4e17-97e1-0d8ebbdd7bc2', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('0281e9e7-983c-4cbe-9dcd-7ab9464a6ac3', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '15a33672-421a-4c18-9a1e-050023114e67', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('48feda9c-16bf-480d-b3a6-d06c8c6572cc', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '76150ca1-38c5-4c36-9d40-064f67b7a593', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('0a012e24-db81-42b4-a893-96cb90a6495c', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'c5193355-951a-438d-b5fa-71bbf38844d3', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('ab0c8f71-9db8-4337-8ed4-841a354ce5c0', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '13ed86c1-dea1-4494-8d33-0a8731653ecf', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('9175bb3d-a3f5-40d4-8898-35bcdf1a8c62', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'd04c9ad3-2372-4eac-b364-3593305af436', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('6f44e4b5-fdad-444e-9945-dfff3c19a5ec', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'da8871d3-2047-42ca-8b09-9ea3f5342a7d', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('3ddebd93-4f40-4030-9ac0-ed348829a9d7', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'b46cf89b-5e90-4016-86de-3784cbebfcaa', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('5cc265f6-af73-42c7-b940-e7e0f002ccdf', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'fb393da1-9447-426c-8cb7-aee063d6c6b1', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('9f14f596-6f9c-4a00-b3dc-eb829810c276', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'feac985d-0881-4cc3-9a58-6aa057cdce10', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('540bfc57-adb7-4d3e-a6a6-b090a831373e', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '417f62c1-500c-4db6-a0e4-f9536e2e1958', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('90b214d6-2fa7-4115-9355-909d82932ed5', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '5426a9db-7dfc-4cf7-9cb0-08b624fa6a56', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('32727211-6871-4280-9fb5-85c3f126f4cd', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '7d9d8da1-a892-4c53-af24-3d6f2dc3f8d4', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('b2259481-8795-49b9-9141-c3c406242243', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'ba9bb612-0c83-4059-97b6-f34febcb56b2', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('e93206b4-9b4b-4825-833e-0538fd8c9542', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'fe4a75a9-472c-4f9b-8448-4c6e124a6bcf', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('2be9402b-dec4-44b2-8c36-aeb656e26c77', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '8fb9a0da-87da-4d42-a143-cba0f365a7cf', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('6618e593-1b8c-425d-afe2-48bfb08bef75', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '5e421734-be71-446e-ba02-f41f5fa9fd13', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('9f307c5b-3447-439a-bb4a-b51164e4cd8a', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'cc11fb51-4b9b-497c-98f4-b3c1d975799f', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('1f7d9297-80b2-404c-be2a-21aed036dfe5', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'f27ed8d6-91f6-48ff-8bf6-d7a1dabd2db7', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('63aa5975-3486-4214-9600-b9511ce0dca9', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'be364bd3-08aa-4c04-b9a9-22f98f510d62', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('cf989917-a95e-43ed-b79c-f8b1b545c79a', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'b20d299d-803e-4ca2-9cce-dff23867da16', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('d1b74107-848c-47ca-bd7c-8ed048fc116c', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'f0c575ff-34aa-41eb-876a-f17436bb5d3d', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('ba79cf97-8548-4a7a-a367-14574f5a8dd2', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '71feeb10-3439-4725-9103-080e5768d1b3', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('61aedb77-bdb3-4c3d-bf8c-693484efce78', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'de8fd598-715f-4996-9be2-58cecd623838', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('418478c9-9ef7-4fb7-8cd6-b729c34741c2', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'ebdda66c-6e30-4e4d-bae3-772b70a7c91a', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('98a4eab5-d400-4adb-b6fb-5e0b2e516f89', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '29ac927e-f44a-46d3-96dc-d196686348a5', 8000.00, '2026-10-15 16:58:11.969', NULL, '2026-10-15 16:58:11.965');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('9f85e758-1c36-4fa6-b7d9-9f67217773bb', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '55a12ce8-deeb-4099-90d3-8da1a6b972d5', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('32e2cbad-366d-46cf-a68f-a3a9a36a10f1', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'cd89eb72-3865-4caf-be92-ccd61fe425be', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('8fae2cc3-9849-4e9e-9a2e-16ec0335e147', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'eb7835b8-da27-4139-9ac2-8082e469583d', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('2ec93e5e-7149-4d27-9265-3c530c567a24', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'b8704ca3-73af-4b00-a5ae-0ab969a538b4', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('1ed5a8ed-e0d7-4f6e-9e03-a7d7357e9880', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '36ea85ea-31e4-49a0-bbb4-47e6289cd3ce', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('dc61ad2d-37b1-4014-a0c8-ea59d285bd55', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '07fd7c73-b0bb-4e6f-8610-129529eac203', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('8aa2eb84-0a89-4f90-abca-e3f4ab7756e9', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '3a6dd3d7-d517-43d5-99ac-9d9b9bf61f50', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('6d8ce1ee-8360-4f29-bef9-8ab85c1e8f67', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'ce9c674b-2b7c-4251-a9db-680e5d6c9848', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('051cb1dd-c413-4250-875c-91f3ca3188a2', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '113f15f6-75b6-4618-95db-f7fe45045d53', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('9137325f-c31b-4785-9981-fd01fdadc254', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '119a6889-9a54-491c-be79-a6a5945fb730', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('640e01e2-d4dc-4e6d-b391-2ace04f066ad', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '839f17c5-361a-49a5-b6b0-5613888c378b', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('3f43cef7-be5d-4fd9-82ba-2a35544eb728', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'bd7b09a4-8a88-4b05-a423-2106c8b366fa', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('0575f5f2-1c8b-4005-9e03-7cb5f6fd6279', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'fcd187d1-ceb7-4e68-bd93-a3d985176b58', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('906e5f0b-8ff5-4042-bf0e-abe11627d2fd', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '3751b754-38bb-47d4-9401-1fe715c2e365', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('783bf9bd-df94-4b89-833d-55eab532831e', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '3442c769-60f0-49a7-bf1c-b0e903e0cf26', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('363fe48f-a765-41d2-b69e-4a5ebd8939ca', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '2a0cf7fa-e8c2-443c-99a7-c1e432509d2e', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('ebcdbccf-cd58-48e0-9bf7-b0ac9d7861be', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'e910a411-e939-4538-9448-f0faa5ed1dcd', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('2da0cdc7-f507-4f35-b0c1-2b078c0fe6eb', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '6f7d72bc-6936-4875-87d8-fc3c770959a2', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('79c6de66-dd52-4a06-a631-274134165cff', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', 'f8191e83-90e3-43c0-81c9-9867c4f9725c', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');
INSERT INTO public."Price" (id, "priceListId", "productVariantId", amount, "validFrom", "validTo", "createdAt") VALUES ('51e64844-1e24-4ad0-8081-19083d246740', '3f8a5ce2-875c-4b24-b3e9-ef4ac583e905', '4dc83052-8f14-42f0-a251-031603de0ca1', 8000.00, '2026-10-16 16:49:49.343', NULL, '2026-10-16 16:49:49.324');


ALTER TABLE public."Price" ENABLE TRIGGER ALL;

--
-- Data for Name: ProductCategory; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."ProductCategory" DISABLE TRIGGER ALL;

INSERT INTO public."ProductCategory" ("productId", "categoryId") VALUES ('d8960cdb-fecf-4e14-aeab-38c0a91c710e', 'edb44fc1-85ee-455a-89fb-0ee76629c08c');
INSERT INTO public."ProductCategory" ("productId", "categoryId") VALUES ('0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '2ad7ebd1-460f-40a8-ab03-81a08b2d07d9');


ALTER TABLE public."ProductCategory" ENABLE TRIGGER ALL;

--
-- Data for Name: ProductImage; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."ProductImage" DISABLE TRIGGER ALL;

INSERT INTO public."ProductImage" (id, "productId", url, "position", "isPrimary", "createdAt") VALUES ('2c281ae1-8dde-4574-9d24-ee9cedbec025', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', 'products/PETOS/WhatsApp Image 2026-10-15 at 11.13.33 AM (1).jpeg', 1, false, '2026-10-16 13:19:06.27');
INSERT INTO public."ProductImage" (id, "productId", url, "position", "isPrimary", "createdAt") VALUES ('935a3463-0a8d-49f7-a90b-47b6b3315aa5', 'd8960cdb-fecf-4e14-aeab-38c0a91c710e', 'products/PETOS/WhatsApp Image 2026-10-15 at 11.13.33 AM.jpeg', 2, false, '2026-10-16 13:20:06.182');
INSERT INTO public."ProductImage" (id, "productId", url, "position", "isPrimary", "createdAt") VALUES ('31d93641-4504-4180-aa82-4e17766f37b9', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '/category/PALAZO/WhatsApp Image 2026-10-10 at 6.07.29 PM (2).jpeg', 1, false, '2026-10-16 13:54:47.963');
INSERT INTO public."ProductImage" (id, "productId", url, "position", "isPrimary", "createdAt") VALUES ('0cbd32cc-3198-4c69-8cfa-e523e5296ee1', '0b47f9fe-0e29-4f6e-8303-2d52e3db3b13', '/category/PALAZO/WhatsApp Image 2026-10-10 at 6.07.29 PM.jpeg', 2, false, '2026-10-16 13:55:10.013');


ALTER TABLE public."ProductImage" ENABLE TRIGGER ALL;

--
-- Data for Name: ProductVariantImage; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."ProductVariantImage" DISABLE TRIGGER ALL;

INSERT INTO public."ProductVariantImage" (id, "variantId", url, "position", "isPrimary", "createdAt") VALUES ('16de61a3-d0a3-4268-9531-5fc3e132baa4', '8bf605a1-ce00-4c7f-b835-448ca9d78cdf', '/products/PETOS/WhatsApp Image 2026-10-15 at 11.13.33 AM (1).jpeg', 1, false, '2026-10-16 13:25:58.239');
INSERT INTO public."ProductVariantImage" (id, "variantId", url, "position", "isPrimary", "createdAt") VALUES ('24a0a43d-1d41-48bd-bc19-9ed333b1f1bf', '55a12ce8-deeb-4099-90d3-8da1a6b972d5', '/products/PALAZO/WhatsApp Image 2026-10-10 at 6.07.27 PM.jpeg', 1, false, '2026-10-16 14:09:51.1');
INSERT INTO public."ProductVariantImage" (id, "variantId", url, "position", "isPrimary", "createdAt") VALUES ('f48fc78d-8586-418d-bf32-ed7ddbcd56d4', '36ea85ea-31e4-49a0-bbb4-47e6289cd3ce', '/products/PALAZO/WhatsApp Image 2026-10-10 at 6.07.28 PM (1).jpeg', 2, false, '2026-10-16 15:15:22.397');
INSERT INTO public."ProductVariantImage" (id, "variantId", url, "position", "isPrimary", "createdAt") VALUES ('5eef965d-aa90-47c8-a95c-e4fce42bad6c', '113f15f6-75b6-4618-95db-f7fe45045d53', '/products/PALAZO/WhatsApp Image 2026-10-10 at 6.07.28 PM (2).jpeg', 3, false, '2026-10-16 15:17:29.765');
INSERT INTO public."ProductVariantImage" (id, "variantId", url, "position", "isPrimary", "createdAt") VALUES ('4fd4ad24-9d8f-40d1-95af-384580204935', 'fcd187d1-ceb7-4e68-bd93-a3d985176b58', '/products/PALAZO/WhatsApp Image 2026-10-10 at 6.07.28 PM (3).jpeg', 0, false, '2026-10-16 15:18:48.634');
INSERT INTO public."ProductVariantImage" (id, "variantId", url, "position", "isPrimary", "createdAt") VALUES ('2568e3cf-21b9-4588-a567-68854a67a60c', 'e910a411-e939-4538-9448-f0faa5ed1dcd', '/products/PALAZO/WhatsApp Image 2026-10-10 at 6.07.28 PM.jpeg', 0, false, '2026-10-16 15:19:32.533');


ALTER TABLE public."ProductVariantImage" ENABLE TRIGGER ALL;

--
-- Data for Name: PromotionCategory; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."PromotionCategory" DISABLE TRIGGER ALL;



ALTER TABLE public."PromotionCategory" ENABLE TRIGGER ALL;

--
-- Data for Name: PromotionProduct; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."PromotionProduct" DISABLE TRIGGER ALL;



ALTER TABLE public."PromotionProduct" ENABLE TRIGGER ALL;

--
-- Data for Name: PromotionRedemption; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."PromotionRedemption" DISABLE TRIGGER ALL;



ALTER TABLE public."PromotionRedemption" ENABLE TRIGGER ALL;

--
-- Data for Name: RolePermission; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."RolePermission" DISABLE TRIGGER ALL;



ALTER TABLE public."RolePermission" ENABLE TRIGGER ALL;

--
-- Data for Name: Shipment; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."Shipment" DISABLE TRIGGER ALL;



ALTER TABLE public."Shipment" ENABLE TRIGGER ALL;

--
-- Data for Name: ShipmentEvent; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."ShipmentEvent" DISABLE TRIGGER ALL;



ALTER TABLE public."ShipmentEvent" ENABLE TRIGGER ALL;

--
-- Data for Name: TaxRate; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."TaxRate" DISABLE TRIGGER ALL;



ALTER TABLE public."TaxRate" ENABLE TRIGGER ALL;

--
-- Data for Name: VariantOptionValue; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public."VariantOptionValue" DISABLE TRIGGER ALL;

INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('8bf605a1-ce00-4c7f-b835-448ca9d78cdf', '9038bdb5-9e8f-4573-9379-3d5a58799f18');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('8bf605a1-ce00-4c7f-b835-448ca9d78cdf', 'd6924f15-c724-4dbe-b61c-128ac32446ab');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('36e29a9f-c5fe-4865-8b86-608fdd25e07a', '9038bdb5-9e8f-4573-9379-3d5a58799f18');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('36e29a9f-c5fe-4865-8b86-608fdd25e07a', 'aa282201-ad21-4949-b2f6-7ea7b43f6ebd');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('aecceeda-19ba-4e17-97e1-0d8ebbdd7bc2', '9038bdb5-9e8f-4573-9379-3d5a58799f18');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('aecceeda-19ba-4e17-97e1-0d8ebbdd7bc2', 'a9420d67-b1ef-462e-b396-4e10e31c1eec');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('15a33672-421a-4c18-9a1e-050023114e67', '9038bdb5-9e8f-4573-9379-3d5a58799f18');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('15a33672-421a-4c18-9a1e-050023114e67', 'a8905468-0296-4d5d-9596-877fa9912ef2');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('76150ca1-38c5-4c36-9d40-064f67b7a593', '9a202a0e-8868-4d45-ade3-a62f415af508');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('76150ca1-38c5-4c36-9d40-064f67b7a593', 'd6924f15-c724-4dbe-b61c-128ac32446ab');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('c5193355-951a-438d-b5fa-71bbf38844d3', '9a202a0e-8868-4d45-ade3-a62f415af508');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('c5193355-951a-438d-b5fa-71bbf38844d3', 'aa282201-ad21-4949-b2f6-7ea7b43f6ebd');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('13ed86c1-dea1-4494-8d33-0a8731653ecf', '9a202a0e-8868-4d45-ade3-a62f415af508');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('13ed86c1-dea1-4494-8d33-0a8731653ecf', 'a9420d67-b1ef-462e-b396-4e10e31c1eec');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('d04c9ad3-2372-4eac-b364-3593305af436', '9a202a0e-8868-4d45-ade3-a62f415af508');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('d04c9ad3-2372-4eac-b364-3593305af436', 'a8905468-0296-4d5d-9596-877fa9912ef2');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('da8871d3-2047-42ca-8b09-9ea3f5342a7d', '26224f9e-01f1-450a-bf3a-6e2267e1a6f5');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('da8871d3-2047-42ca-8b09-9ea3f5342a7d', 'd6924f15-c724-4dbe-b61c-128ac32446ab');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('b46cf89b-5e90-4016-86de-3784cbebfcaa', '26224f9e-01f1-450a-bf3a-6e2267e1a6f5');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('b46cf89b-5e90-4016-86de-3784cbebfcaa', 'aa282201-ad21-4949-b2f6-7ea7b43f6ebd');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('fb393da1-9447-426c-8cb7-aee063d6c6b1', '26224f9e-01f1-450a-bf3a-6e2267e1a6f5');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('fb393da1-9447-426c-8cb7-aee063d6c6b1', 'a9420d67-b1ef-462e-b396-4e10e31c1eec');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('feac985d-0881-4cc3-9a58-6aa057cdce10', '26224f9e-01f1-450a-bf3a-6e2267e1a6f5');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('feac985d-0881-4cc3-9a58-6aa057cdce10', 'a8905468-0296-4d5d-9596-877fa9912ef2');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('417f62c1-500c-4db6-a0e4-f9536e2e1958', '0c9cf1c4-e70b-4ac9-b57b-b0b7483e50c0');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('417f62c1-500c-4db6-a0e4-f9536e2e1958', 'd6924f15-c724-4dbe-b61c-128ac32446ab');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('5426a9db-7dfc-4cf7-9cb0-08b624fa6a56', '0c9cf1c4-e70b-4ac9-b57b-b0b7483e50c0');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('5426a9db-7dfc-4cf7-9cb0-08b624fa6a56', 'aa282201-ad21-4949-b2f6-7ea7b43f6ebd');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('7d9d8da1-a892-4c53-af24-3d6f2dc3f8d4', '0c9cf1c4-e70b-4ac9-b57b-b0b7483e50c0');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('7d9d8da1-a892-4c53-af24-3d6f2dc3f8d4', 'a9420d67-b1ef-462e-b396-4e10e31c1eec');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('ba9bb612-0c83-4059-97b6-f34febcb56b2', '0c9cf1c4-e70b-4ac9-b57b-b0b7483e50c0');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('ba9bb612-0c83-4059-97b6-f34febcb56b2', 'a8905468-0296-4d5d-9596-877fa9912ef2');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('fe4a75a9-472c-4f9b-8448-4c6e124a6bcf', '45199819-0245-4a57-8e38-34b9ca8ac9fc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('fe4a75a9-472c-4f9b-8448-4c6e124a6bcf', 'd6924f15-c724-4dbe-b61c-128ac32446ab');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('8fb9a0da-87da-4d42-a143-cba0f365a7cf', '45199819-0245-4a57-8e38-34b9ca8ac9fc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('8fb9a0da-87da-4d42-a143-cba0f365a7cf', 'aa282201-ad21-4949-b2f6-7ea7b43f6ebd');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('5e421734-be71-446e-ba02-f41f5fa9fd13', '45199819-0245-4a57-8e38-34b9ca8ac9fc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('5e421734-be71-446e-ba02-f41f5fa9fd13', 'a9420d67-b1ef-462e-b396-4e10e31c1eec');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('cc11fb51-4b9b-497c-98f4-b3c1d975799f', '45199819-0245-4a57-8e38-34b9ca8ac9fc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('cc11fb51-4b9b-497c-98f4-b3c1d975799f', 'a8905468-0296-4d5d-9596-877fa9912ef2');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('f27ed8d6-91f6-48ff-8bf6-d7a1dabd2db7', 'abdca946-cabc-4576-94a4-f20e0f18dfa9');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('f27ed8d6-91f6-48ff-8bf6-d7a1dabd2db7', 'd6924f15-c724-4dbe-b61c-128ac32446ab');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('be364bd3-08aa-4c04-b9a9-22f98f510d62', 'abdca946-cabc-4576-94a4-f20e0f18dfa9');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('be364bd3-08aa-4c04-b9a9-22f98f510d62', 'aa282201-ad21-4949-b2f6-7ea7b43f6ebd');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('b20d299d-803e-4ca2-9cce-dff23867da16', 'abdca946-cabc-4576-94a4-f20e0f18dfa9');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('b20d299d-803e-4ca2-9cce-dff23867da16', 'a9420d67-b1ef-462e-b396-4e10e31c1eec');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('f0c575ff-34aa-41eb-876a-f17436bb5d3d', 'abdca946-cabc-4576-94a4-f20e0f18dfa9');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('f0c575ff-34aa-41eb-876a-f17436bb5d3d', 'a8905468-0296-4d5d-9596-877fa9912ef2');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('71feeb10-3439-4725-9103-080e5768d1b3', '63f424bc-63bd-4440-8313-d26c8468ce07');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('71feeb10-3439-4725-9103-080e5768d1b3', 'd6924f15-c724-4dbe-b61c-128ac32446ab');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('de8fd598-715f-4996-9be2-58cecd623838', '63f424bc-63bd-4440-8313-d26c8468ce07');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('de8fd598-715f-4996-9be2-58cecd623838', 'aa282201-ad21-4949-b2f6-7ea7b43f6ebd');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('ebdda66c-6e30-4e4d-bae3-772b70a7c91a', '63f424bc-63bd-4440-8313-d26c8468ce07');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('ebdda66c-6e30-4e4d-bae3-772b70a7c91a', 'a9420d67-b1ef-462e-b396-4e10e31c1eec');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('29ac927e-f44a-46d3-96dc-d196686348a5', '63f424bc-63bd-4440-8313-d26c8468ce07');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('29ac927e-f44a-46d3-96dc-d196686348a5', 'a8905468-0296-4d5d-9596-877fa9912ef2');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('55a12ce8-deeb-4099-90d3-8da1a6b972d5', '9e27bafe-9f86-4ef1-a8df-a64c6293eba3');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('55a12ce8-deeb-4099-90d3-8da1a6b972d5', '6e3d00a7-a732-43ad-9ae1-7f06ae4e2bfb');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('cd89eb72-3865-4caf-be92-ccd61fe425be', '9e27bafe-9f86-4ef1-a8df-a64c6293eba3');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('cd89eb72-3865-4caf-be92-ccd61fe425be', '4c3cc76d-1ac2-4da2-a7a2-86f0291fc5dc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('eb7835b8-da27-4139-9ac2-8082e469583d', '9e27bafe-9f86-4ef1-a8df-a64c6293eba3');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('eb7835b8-da27-4139-9ac2-8082e469583d', 'e04d8518-4f01-4919-92ec-9695cfbd3d2e');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('b8704ca3-73af-4b00-a5ae-0ab969a538b4', '9e27bafe-9f86-4ef1-a8df-a64c6293eba3');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('b8704ca3-73af-4b00-a5ae-0ab969a538b4', '5b23d7a5-a695-4d50-b5bf-ff84ba0a73c5');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('36ea85ea-31e4-49a0-bbb4-47e6289cd3ce', '5724bc10-f6e1-4387-a301-6976d54baa6c');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('36ea85ea-31e4-49a0-bbb4-47e6289cd3ce', '6e3d00a7-a732-43ad-9ae1-7f06ae4e2bfb');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('07fd7c73-b0bb-4e6f-8610-129529eac203', '5724bc10-f6e1-4387-a301-6976d54baa6c');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('07fd7c73-b0bb-4e6f-8610-129529eac203', '4c3cc76d-1ac2-4da2-a7a2-86f0291fc5dc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('3a6dd3d7-d517-43d5-99ac-9d9b9bf61f50', '5724bc10-f6e1-4387-a301-6976d54baa6c');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('3a6dd3d7-d517-43d5-99ac-9d9b9bf61f50', 'e04d8518-4f01-4919-92ec-9695cfbd3d2e');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('ce9c674b-2b7c-4251-a9db-680e5d6c9848', '5724bc10-f6e1-4387-a301-6976d54baa6c');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('ce9c674b-2b7c-4251-a9db-680e5d6c9848', '5b23d7a5-a695-4d50-b5bf-ff84ba0a73c5');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('113f15f6-75b6-4618-95db-f7fe45045d53', '358ce5aa-8374-4afa-9d3e-d24c40b5d335');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('113f15f6-75b6-4618-95db-f7fe45045d53', '6e3d00a7-a732-43ad-9ae1-7f06ae4e2bfb');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('119a6889-9a54-491c-be79-a6a5945fb730', '358ce5aa-8374-4afa-9d3e-d24c40b5d335');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('119a6889-9a54-491c-be79-a6a5945fb730', '4c3cc76d-1ac2-4da2-a7a2-86f0291fc5dc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('839f17c5-361a-49a5-b6b0-5613888c378b', '358ce5aa-8374-4afa-9d3e-d24c40b5d335');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('839f17c5-361a-49a5-b6b0-5613888c378b', 'e04d8518-4f01-4919-92ec-9695cfbd3d2e');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('bd7b09a4-8a88-4b05-a423-2106c8b366fa', '358ce5aa-8374-4afa-9d3e-d24c40b5d335');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('bd7b09a4-8a88-4b05-a423-2106c8b366fa', '5b23d7a5-a695-4d50-b5bf-ff84ba0a73c5');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('fcd187d1-ceb7-4e68-bd93-a3d985176b58', '86b1f2c1-19a7-4018-9b68-2b2da7da2698');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('fcd187d1-ceb7-4e68-bd93-a3d985176b58', '6e3d00a7-a732-43ad-9ae1-7f06ae4e2bfb');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('3751b754-38bb-47d4-9401-1fe715c2e365', '86b1f2c1-19a7-4018-9b68-2b2da7da2698');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('3751b754-38bb-47d4-9401-1fe715c2e365', '4c3cc76d-1ac2-4da2-a7a2-86f0291fc5dc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('3442c769-60f0-49a7-bf1c-b0e903e0cf26', '86b1f2c1-19a7-4018-9b68-2b2da7da2698');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('3442c769-60f0-49a7-bf1c-b0e903e0cf26', 'e04d8518-4f01-4919-92ec-9695cfbd3d2e');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('2a0cf7fa-e8c2-443c-99a7-c1e432509d2e', '86b1f2c1-19a7-4018-9b68-2b2da7da2698');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('2a0cf7fa-e8c2-443c-99a7-c1e432509d2e', '5b23d7a5-a695-4d50-b5bf-ff84ba0a73c5');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('e910a411-e939-4538-9448-f0faa5ed1dcd', '00d9d93e-6726-4913-a354-7b56aa303238');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('e910a411-e939-4538-9448-f0faa5ed1dcd', '6e3d00a7-a732-43ad-9ae1-7f06ae4e2bfb');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('6f7d72bc-6936-4875-87d8-fc3c770959a2', '00d9d93e-6726-4913-a354-7b56aa303238');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('6f7d72bc-6936-4875-87d8-fc3c770959a2', '4c3cc76d-1ac2-4da2-a7a2-86f0291fc5dc');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('f8191e83-90e3-43c0-81c9-9867c4f9725c', '00d9d93e-6726-4913-a354-7b56aa303238');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('f8191e83-90e3-43c0-81c9-9867c4f9725c', 'e04d8518-4f01-4919-92ec-9695cfbd3d2e');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('4dc83052-8f14-42f0-a251-031603de0ca1', '00d9d93e-6726-4913-a354-7b56aa303238');
INSERT INTO public."VariantOptionValue" ("productVariantId", "optionValueId") VALUES ('4dc83052-8f14-42f0-a251-031603de0ca1', '5b23d7a5-a695-4d50-b5bf-ff84ba0a73c5');


ALTER TABLE public."VariantOptionValue" ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

\unrestrict 9mghpLkoJQ4e6TkXlKPk6QfSpCbf8jzfarTVJwxFG9pAptQTRgDINQCa7ZMcSXG

