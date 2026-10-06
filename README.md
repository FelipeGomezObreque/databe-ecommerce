# Database

## Development

Para desarrollo se ocupa la herramienta `prisma` para NodeJS. El esquema se escribe en el archivo [`schema.prisma`](/development/prisma/schema.prisma). En este archivo van todos los esquemas que son de prueba o que son transitorios.

Lea la documentación en el README.md de la carpeta development para entender cómo aplicar las migraciones.

## Atlas

Atlas es una herramienta CI/CD que permite aplicar las migraciones necesarias a la base de datos de producción, al igual que `prisma`, también es una herramienta declarativa, es decir, se escribe el esquema de base de datos deseado y aplica las migraciones necesarias en la base de datos para que esta esté sincronizada con el módelo declarado.

Para no tener que reescribir los esquemas múltiples veces, atlas cli permite escanear una base de datos y exportar dicho esquema en un formato que atlas entiende, en este caso, hcl.

### Escanear esquema y exportar

Primero, asegurese de que el esquema de `schema.prisma` es el que realmente quiere desplegar a producción, una vez hecho esto, levante el `docker-compose.yaml` que se encuentra en la carpeta development, esto levanta una base de datos temporal con postgresql como servicio.

Aplique el esquema de prisma dentro de esta base de datos, una vez aplicados los cambios, entra en juego atlas cli:

Ejecute el siguiente comando el la raiz del repositorio:

```bash
atlas schema inspect -u "postgresql://root:root@localhost:5432/neohomes?sslmode=disable" --schema public > schema.hcl
```

Una vez ejecutado el comando, actualizará el documento `schema.hcl` con el nuevo esquema.

Hecho esto, el siguiente paso es empujar dicho esquema al repositorio de esquemas de Atlas, para esto debe estar loggeado dentro de Atlas Cloud:

```bash
atlas schema push neohomes-production --env "local"
```

Con esto se habrá empujado el esquema y podrá visualizarle en el dashboard.

![](/assets/neohomes-production-atlas.png)

### Desplegar a producción el esquema

En el repositorio de neohomes-production en Atlas Cloud una vez registrado es esquema, se le asignará una etiqueta (versión) automáticamente, ej: `20250113202131`, para aplicar el esquema debe actualizar el manifiesto de `manifests/database.yaml`, allí, si por ejemplo la versión creado es `tag123`, debe reemplazar el manifiesto así:

```yaml
spec:
  schema:
    url: atlas://neohomes-production?version=tag123 # Aquí se modifica el tag
```

Una vez hecho esto haga commit y push.
