# Base de datos de desarrollo

Levanta PostgreSQL, aplica las migraciones existentes y ejecuta el seed idempotente:

```bash
docker compose up --build
```

PostgreSQL queda publicado en `localhost:5434` con base de datos, usuario y contraseña `sinapsis`, `postgres` y `postgres`, respectivamente.

Para aplicar migraciones desde el host:

```bash
npm ci
npx prisma migrate deploy
npx prisma db seed
```

Validar el esquema sin modificar la base:

```bash
npx prisma validate
```

## Administrador inicial de plataforma (`PLATFORM_ADMIN`)

Roles globales (`User.platformRole`) vs. roles por tenant (`Membership`/`Role`, p. ej. `OWNER`):

- `PLATFORM_USER` (default): usuario normal. Todo registro publico lo recibe.
- `PLATFORM_ADMIN`: puede crear tenants (`POST /api/tenants`). Solo se asigna por este seed.
- `OWNER` es de un tenant concreto y **no** concede permisos globales.

### Crear el primer administrador

```bash
npx prisma migrate deploy
# La contrasena se pide sin eco y no queda en el historial ni en archivos:
read -rs BOOTSTRAP_ADMIN_PASSWORD && export BOOTSTRAP_ADMIN_PASSWORD
BOOTSTRAP_ADMIN_EMAIL=admin@tudominio.cl npm run seed:admin
# equivalente (opt-in, tambien crea los roles del sistema):
BOOTSTRAP_ADMIN_EMAIL=admin@tudominio.cl npx prisma db seed
unset BOOTSTRAP_ADMIN_PASSWORD
```

- Sin `BOOTSTRAP_ADMIN_*`, `prisma db seed` omite este paso (el `docker compose up` actual sigue funcionando). `npm run seed:admin` falla si faltan.
- Contrasena: 8+ caracteres, maximo 72 bytes. Hash bcrypt coste 10 (igual que el login del backend).
- Idempotente. Si el usuario ya existe: se promueve a `PLATFORM_ADMIN` **sin tocar su contrasena**. Si existe sin contrasena local, falla; con `BOOTSTRAP_ADMIN_CREATE_CREDENTIAL=true` se le crea una. Usuarios no `ACTIVE` se rechazan.
- Nunca se imprimen contrasenas ni hashes. Para degradar un admin: `UPDATE "User" SET "platformRole"='PLATFORM_USER' WHERE email='...'`.

### JWT y roles

El backend valida el access token y **relee `platformRole` desde la base en cada peticion** (no va en los claims). Por eso los tokens existentes siguen valiendo y no hace falta volver a iniciar sesion tras la promocion; una degradacion tiene efecto inmediato.

### Pruebas del seed

```bash
TEST_DATABASE_URL=postgresql://postgres:postgres@127.0.0.1:5434/sinapsis_test npm test
```
