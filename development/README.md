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
