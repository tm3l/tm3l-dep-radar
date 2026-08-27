#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
echo "==> Stopping TM3L Dependency Radar stack..."
docker compose down
