# TM3L Dependency Radar — Implementation Status

**Status:** ACTIVE / OPERATIONAL  
**Release Tier:** 1.0.0-rc1

## System Tiers
| Layer | Technology | Status |
| :--- | :--- | :--- |
| **API & Ingestion** | Go 1.23 (`chi`, `pgx`) | **Complete** |
| **Graph Explorer** | React 19, TypeScript, Tailwind, Vite | **Complete** |
| **Graph Store** | PostgreSQL 17 / PocketBase | **Complete** |

## CI & Governance
- **GitHub Actions CI**: Enabled (Go verify, build, test, vet + Explorer build on Node 22).
- **CodeQL**: Active on `go` and `javascript-typescript`.
- **Dependabot**: Monitored on `gomod`, `npm`, `github-actions`, and `docker`.
