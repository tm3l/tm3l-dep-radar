#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
echo "==> Starting TM3L Dependency Radar stack..."
docker compose up -d
sleep 2
./scripts/healthcheck.sh || true
