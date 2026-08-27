#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

if [ -f .env ]; then
    echo "[INFO] .env file already exists. Preserving existing secrets."
    exit 0
fi

DB_PASS=$(openssl rand -hex 16 2>/dev/null || echo "tm3l_radar_password")
JWT_SECRET=$(openssl rand -hex 32 2>/dev/null || date +%s | shasum -a 256 | head -c 64)

cat <<ENVEOF > .env
PORT=8082
DATABASE_URL=postgres://tm3l_radar:${DB_PASS}@dep-radar-db:5432/tm3l_dep_radar?sslmode=disable
POSTGRES_USER=tm3l_radar
POSTGRES_PASSWORD=${DB_PASS}
POSTGRES_DB=tm3l_dep_radar
TM3L_JWT_SECRET=${JWT_SECRET}
ENVEOF

echo "[OK] Generated .env for Dependency Radar."
