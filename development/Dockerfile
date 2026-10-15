# Migration runner and seeder
FROM node:22-alpine AS migrator

WORKDIR /app

# Install OS deps for node-postgres SSL if needed
RUN apk add --no-cache bash openssl

# Copy minimal files first for caching
COPY package.json package-lock.json* ./
COPY prisma ./prisma
COPY prisma.config.ts ./

# Install dev dependencies because the Prisma CLI is required by this image.
# Resolve the config entry point here so a corrupt install cannot be cached.
RUN npm ci --include=dev && node -e "require.resolve('prisma/config')"

# Copy rest of the project (seed, etc.)
COPY . .

# Default command generates the client, then runs migrations and seed
CMD sh -c "npx prisma generate && npx prisma migrate deploy && npx prisma db seed"
