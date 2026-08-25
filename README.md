# 📡 Dep Radar

**Point it at any repo. It tells you which dependencies are ticking time bombs.**

> **Project Status**: 🚧 Under Construction

---

## 🔍 Overview

**Dep Radar** is a modern, lightweight supply chain security scanner designed for engineering teams and platform operators. By pointing Dep Radar at a repository, directory, or Software Bill of Materials (SBOM), it analyzes the full transitive dependency graph and correlates every component against multiple vulnerability databases to surface known vulnerabilities (CVEs), malicious packages, and license compliance risks in real-time.

```
       +-------------------------------------------------------+
       |                  Target Source / SBOM                 |
       |             (CycloneDX / SPDX / Lockfiles)            |
       +-------------------------------------------------------+
                                  |
                                  v
       +-------------------------------------------------------+
       |                   Go Scanner Engine                   |
       |      - SBOM Parser & Transitive Resolver              |
       |      - Multi-source Vuln Client (OSV / NVD / GitHub)  |
       |      - Graph Constructor & Blast-Radius Engine        |
       +-------------------------------------------------------+
                                  |
                   +--------------+--------------+
                   |                             |
                   v                             v
       +-----------------------+     +-----------------------+
       |   PostgreSQL Storage  |     |   Alert Dispatcher    |
       | (Scans, Graphs, CVEs) |     |  (Webhooks / Slack)   |
       +-----------------------+     +-----------------------+
                   |
        +----------+----------+
        |                     |
        v                     v
+----------------+   +-------------------+
|  templ + HTMX  |   |   React Explorer  |
|  Admin Portal  |   | (Graph Visualizer)|
+----------------+   +-------------------+
```

---

## ✨ Features

- **Multi-Format SBOM Ingestion**: Seamless parsing of CycloneDX (JSON/XML) and SPDX formats alongside native package lockfile inspection (npm, Go modules, Cargo, PyPI, Maven).
- **Federated Vulnerability Lookups**: Fast, aggregated vulnerability intelligence querying OSV (Open Source Vulnerabilities), NIST NVD 2.0, and GitHub Security Advisory Database.
- **Deep Dependency Graph & Blast Radius Analysis**: Reconstructs complete multi-tier dependency trees to show exact vulnerability propagation paths and impacted consumers.
- **Interactive Visual Explorer**: Rich React-based dependency graph visualization for interactive inspection of dependency trees and vulnerability clusters.
- **Lightweight HTMX Admin Interface**: Server-side rendered dashboard built with Go `templ` and HTMX for scan management, trend analysis, and configuration.
- **Automated Alerts & Webhooks**: Instant notification dispatch via webhooks, Slack, and email when critical CVEs or revoked packages are detected.
- **Dual-Mode Execution**: Run as a stand-alone fast CLI in local CI/CD pipelines (`depradar scan`) or as a persistent API & scan orchestration daemon.

---

## ⚡ Quick Start

### 1. Run with Docker Compose

Spin up the PostgreSQL database, API server, and admin portal:

```bash
# Clone repository
git clone https://github.com/tm3l/dep-radar.git
cd dep-radar

# Launch all services
docker compose up -d
```

Access services:
- **Admin Dashboard**: `http://localhost:8080`
- **Interactive Graph Explorer**: `http://localhost:3000`
- **REST API & OpenAPI Docs**: `http://localhost:8080/api/v1`

### 2. Run the CLI Scanner

Scan a local directory or repository on the fly:

```bash
# Build the CLI tool
make build

# Scan the current working directory
./bin/depradar scan ./

# Scan and export CycloneDX report
./bin/depradar scan --format cyclonedx-json --output sbom.json ./

# Scan with direct vulnerability enrichment against remote server
./bin/depradar scan --server http://localhost:8080 --fail-on critical ./
```

---

## 🛠️ Tech Stack & Design Decisions

| Layer | Technology | Rationale |
| :--- | :--- | :--- |
| **Backend & CLI** | **Go 1.23** | Single static binary deployment, exceptional concurrency primitives for parallel vulnerability queries and graph traversal, minimal memory footprint, and rich native ecosystem for lockfile/SBOM manipulation. |
| **Why Go-only?** | *No Python / Rust* | Avoids Python runtime/dependency management overhead in containerized scanners; avoids Rust's compilation time complexity while delivering near-native performance for I/O-bound security feed aggregators and concurrent graph operations. |
| **Primary Database** | **PostgreSQL 16** | Robust relational model for scan history, normalized vulnerability catalogs, JSONB storage for dynamic SBOM metadata, and recursive CTE support for dependency graph queries. |
| **Admin Web UI** | **templ + HTMX** | Type-safe Go component rendering with zero JS bundle overhead for internal dashboards, operational settings, and real-time scan logs. |
| **Graph Explorer** | **React 19 + Vite + TypeScript** | Client-side reactive canvas rendering for high-performance interactive dependency graph exploration and node filtering. |
| **API Specification** | **OpenAPI 3.1** | Declarative contract-first API design enabling automated client generation and Bruno API test suites. |

---

## 📂 Project Structure

```
dep-radar/
├── cmd/
│   ├── server/             # API server daemon entrypoint
│   └── cli/                # Standalone CLI scanner entrypoint
├── internal/
│   ├── api/                # HTTP routing, middleware, REST handlers
│   ├── scanner/            # SBOM parser and dependency resolver
│   ├── vuln/               # OSV, NVD, and GitHub Advisory integration
│   ├── graph/              # Dependency graph construction and traversal
│   ├── store/              # PostgreSQL database persistence and queries
│   ├── alert/              # Webhook and notification dispatcher
│   └── web/                # templ + HTMX admin UI components
├── explorer/               # React 19 interactive graph explorer
├── api/                    # OpenAPI 3.1 specifications
├── migrations/             # SQL schema migrations
├── deploy/                 # Dockerfile and Kubernetes manifests
├── docs/                   # Architecture documentation and ADRs
└── bruno/                  # Bruno API collections for testing
```

---

## 📄 License

Distributed under the MIT License. See [LICENSE](file:///Users/hpcorex-m5air/.gemini/antigravity/scratch/dep-radar/LICENSE) for more information.
