# Build stage for Go binaries
FROM golang:1.23-alpine AS builder

WORKDIR /app

# Install build dependencies
RUN apk add --no-cache git make ca-certificates

# Cache dependencies
COPY go.mod ./
RUN go mod download || true

# Copy source tree and build server binary
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /app/bin/depradar-server ./cmd/server

# Final lightweight production image
FROM alpine:3.24

WORKDIR /app

RUN apk add --no-cache ca-certificates tzdata

COPY --from=builder /app/bin/depradar-server /usr/local/bin/depradar-server
COPY --from=builder /app/migrations /app/migrations

EXPOSE 8080

USER 65534:65534

ENTRYPOINT ["/usr/local/bin/depradar-server"]
