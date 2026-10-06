# Migration runner and seeder
FROM node:20-alpine AS migrator

WORKDIR /app

# Install OS deps for node-postgres SSL if needed
RUN apk add --no-cache bash openssl

# Copy minimal files first for caching
COPY package.json package-lock.json* ./
COPY prisma ./prisma
COPY prisma.config.ts ./

# Install deps (include dev to have prisma CLI available inside)
RUN npm ci

# Copy rest of the project (seed, etc.)
COPY . .

# Default command runs migrations and seed
CMD sh -c "npx prisma migrate deploy && npx prisma db seed"
