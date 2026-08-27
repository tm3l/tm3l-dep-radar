.PHONY: all build test lint run

all: build

build:
	go build -o bin/server ./cmd/server
	go build -o bin/cli ./cmd/cli

test:
	go test -v ./...

lint:
	golangci-lint run

run:
	go run ./cmd/server
