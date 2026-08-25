# 📡 tm3l-dep-radar

> **Point it at any repo. It tells you which dependencies are ticking time bombs.**

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Go Version](https://img.shields.io/badge/Go-1.23-00ADD8.svg)](go.mod)
[![React](https://img.shields.io/badge/React-19-61DAFB.svg)](explorer/package.json)

---

## 📖 Table of Contents
1. [Overview](#-overview)
2. [Architecture](#-architecture)
3. [Tech Stack](#-tech-stack)
4. [Getting Started](#-getting-started)
5. [Documentation](#-documentation)

---

## 🌟 Overview
Supply chain security scanner that ingests SBOMs (CycloneDX/SPDX), resolves dependency graphs, correlates against OSV/NVD vulnerabilities, and visualizes the exact transitive blast radius of any exploit.

## 📊 Architecture

```mermaid
graph TD
    subgraph "External Sources"
        SBOM[Lockfiles / SBOMs]
        CVE[OSV / NVD Feeds]
    end

    subgraph "Ingestion & Graph API"
        Go[Go 1.23 Scanner & API]
        Admin[templ + HTMX Dashboard]
    end

    subgraph "Client Visualization"
        React[React 19 DAG Explorer]
    end

    subgraph "Data Storage"
        PG[(PostgreSQL 17)]
        PB[(PocketBase 0.25)]
    end

    SBOM -->|Parse| Go
    CVE -->|Sync| Go
    Go -->|HTML| Admin
    Go -->|Recursive CTEs| PG
    Go -->|Publish Reports| PB
    React -->|REST| Go
    React -->|SSE Sync| PB
```

## 🛠 Tech Stack
- **API & Ingestion**: Go 1.23
- **Admin UI**: `templ` + `HTMX`
- **Graph UI**: React 19 + TypeScript + Vite 6 + Canvas/SVG
- **Databases**: PostgreSQL 17 (Primary DAG Store) + PocketBase 0.25 (Edge/Real-time)

## 🚀 Getting Started
```bash
git clone https://github.com/tm3l/tm3l-dep-radar.git
cd tm3l-dep-radar
make docker-up
```
Visit `http://localhost:5174` to explore the dependency graphs.

## 📚 Documentation
See [`docs/architecture.md`](docs/architecture.md) for detailed internals.
