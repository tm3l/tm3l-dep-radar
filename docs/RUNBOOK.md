# TM3L Dependency Radar — Operational Runbook

## 1. Quick Start & Triage
```bash
just preflight
just up
just health
just logs
```

## 2. Port Architecture
- **Go API Server**: `http://localhost:8082`
- **React Graph Explorer**: `http://localhost:5174`
- **PostgreSQL Database**: `localhost:5433`

## 3. Incident Playbooks
- **Graph Ingestion Lag**: Check background sync workers in `docker compose logs dep-radar-server`.
- **Database Connection Reset**: Verify PostgreSQL container health with `just health`.
