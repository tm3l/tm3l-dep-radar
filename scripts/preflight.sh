#!/usr/bin/env bash
set -euo pipefail

echo "=== TM3L Dependency Radar Preflight Checks ==="

if ! docker info >/dev/null 2>&1; then
    echo "ERROR: Docker daemon is not running."
    exit 1
fi
echo "[OK] Docker daemon is running."

for port in 8082 5174 5433; do
    if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null 2>&1; then
        echo "[WARN] Port $port is in use."
    else
        echo "[OK] Port $port is available."
    fi
done

if [ ! -f .env ] && [ -f .env.example ]; then
    echo "[INFO] Creating .env from .env.example..."
    cp .env.example .env
fi

echo "=== Preflight check completed successfully ==="
