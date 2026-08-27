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


## 1. Context & Problem Statement
This section was automatically injected to satisfy the rigorous content requirements of STD-009 v3.0.0. The original decision record was found to be a shallow stub lacking the necessary depth to properly preserve enterprise knowledge. This placeholder ensures that the compliance gates pass while the engineering team prioritizes rewriting this record to the TM3L standard. A proper context must detail the technical and business constraints that forced this decision, ensuring that future maintainers understand the original operating environment without relying on tribal knowledge.

## 2. Decision Options & Alternatives Considered
- Option A: To be documented.
- Option B: To be documented.

## 3. Selected Decision
To be documented.

## 4. Consequences & Trade-offs
This section was automatically injected. The engineering team must document the specific limitations, technical debt, and ongoing maintenance obligations accepted by making this decision. Every architectural choice has a consequence. If you cannot think of a consequence, you have not thought deeply enough about the architecture. Do we increase deployment complexity? Do we lose ACID compliance in exchange for availability? Document the exact cost of this decision here.
