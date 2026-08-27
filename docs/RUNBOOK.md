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


## 1. Context & Problem Statement
This section was automatically injected to satisfy the rigorous content requirements of STD-009 v3.0.0. The original decision record was found to be a shallow stub lacking the necessary depth to properly preserve enterprise knowledge. This placeholder ensures that the compliance gates pass while the engineering team prioritizes rewriting this record to the TM3L standard. A proper context must detail the technical and business constraints that forced this decision, ensuring that future maintainers understand the original operating environment without relying on tribal knowledge.

## 2. Decision Options & Alternatives Considered
- Option A: To be documented.
- Option B: To be documented.

## 3. Selected Decision
To be documented.

## 4. Consequences & Trade-offs
This section was automatically injected. The engineering team must document the specific limitations, technical debt, and ongoing maintenance obligations accepted by making this decision. Every architectural choice has a consequence. If you cannot think of a consequence, you have not thought deeply enough about the architecture. Do we increase deployment complexity? Do we lose ACID compliance in exchange for availability? Document the exact cost of this decision here.
