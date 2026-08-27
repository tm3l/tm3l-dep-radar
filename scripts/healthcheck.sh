#!/usr/bin/env bash
set -euo pipefail

echo "=== Checking TM3L Dependency Radar Service Health ==="

SERVER_HTTP=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8082/api/health || echo "000")
if [ "$SERVER_HTTP" != "000" ]; then
    echo "[OK] Dependency Radar API is responding on http://localhost:8082 (HTTP $SERVER_HTTP)."
else
    echo "[WARN] Dependency Radar API is not responding on port 8082."
fi

EXPLORER_HTTP=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5174/ || echo "000")
if [ "$EXPLORER_HTTP" = "200" ]; then
    echo "[OK] Explorer UI is responding on http://localhost:5174."
else
    echo "[WARN] Explorer UI returned HTTP $EXPLORER_HTTP on port 5174."
fi

echo "=== Health check finished ==="
