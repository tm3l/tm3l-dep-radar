.PHONY: all build test lint tidy clean docker-up docker-down run-server run-cli help

# Binary output directory
BIN_DIR ?= ./bin
SERVER_BIN ?= $(BIN_DIR)/depradar-server
CLI_BIN ?= $(BIN_DIR)/depradar

# Go build parameters
GO ?= go
GOFLAGS ?= -v

all: build

help: ## Display available make targets
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build both the API server and CLI scanner binaries
	@echo "==> Building API Server binary..."
	@mkdir -p $(BIN_DIR)
	$(GO) build $(GOFLAGS) -o $(SERVER_BIN) ./cmd/server
	@echo "==> Building CLI Scanner binary..."
	$(GO) build $(GOFLAGS) -o $(CLI_BIN) ./cmd/cli
	@echo "==> Build complete: $(SERVER_BIN), $(CLI_BIN)"

test: ## Run unit tests with race detector and coverage
	@echo "==> Running tests..."
	$(GO) test -race -v -cover ./...

lint: ## Run linter checks across codebase
	@echo "==> Running linters..."
	@if command -v golangci-lint >/dev/null 2>&1; then \
		golangci-lint run ./...; \
	else \
		echo "golangci-lint not installed. Running go vet..."; \
		$(GO) vet ./...; \
	fi

tidy: ## Tidy and verify Go module dependencies
	@echo "==> Tidying Go modules..."
	$(GO) mod tidy
	$(GO) mod verify

clean: ## Clean built binaries and test artifacts
	@echo "==> Cleaning artifacts..."
	@rm -rf $(BIN_DIR) coverage.txt *.out dist

docker-up: ## Start PostgreSQL and API server with docker-compose
	@echo "==> Starting containers..."
	docker compose up -d

docker-down: ## Stop all docker-compose containers and networks
	@echo "==> Stopping containers..."
	docker compose down

run-server: ## Run the API server directly with Go
	$(GO) run ./cmd/server/main.go

run-cli: ## Run the CLI scanner on current directory
	$(GO) run ./cmd/cli/main.go scan ./
