-- Rol global de plataforma. No destructivo: los usuarios existentes reciben PLATFORM_USER.
CREATE TYPE "PlatformRole" AS ENUM ('PLATFORM_USER', 'PLATFORM_ADMIN');

ALTER TABLE "User" ADD COLUMN "platformRole" "PlatformRole" NOT NULL DEFAULT 'PLATFORM_USER';
