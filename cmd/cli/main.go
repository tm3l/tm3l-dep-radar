// Package main is the entrypoint for the Dep Radar standalone CLI scanner (`depradar`).
//
// The CLI provides capabilities to:
// - Inspect local source trees and package lockfiles (go.mod, package-lock.json, Cargo.lock, etc.).
// - Ingest and parse pre-generated CycloneDX and SPDX SBOM files.
// - Resolve the transitive dependency graph and compute blast radius.
// - Perform direct vulnerability enrichment via remote OSV/NVD APIs or a central Dep Radar server.
// - Output machine-readable JSON/SARIF/CycloneDX reports or human-friendly CLI terminal tables.
package main

import (
	"flag"
	"fmt"
	"os"
)

func main() {
	if len(os.Args) < 2 {
		printUsage()
		os.Exit(1)
	}

	command := os.Args[1]
	switch command {
	case "scan":
		scanCmd := flag.NewFlagSet("scan", flag.ExitOnError)
		format := scanCmd.String("format", "table", "Output format: table, json, sarif, cyclonedx-json")
		serverURL := scanCmd.String("server", "", "Remote Dep Radar server URL (optional)")
		_ = scanCmd.Parse(os.Args[2:])

		targetPath := "."
		if scanCmd.NArg() > 0 {
			targetPath = scanCmd.Arg(0)
		}

		fmt.Printf("📡 Scanning target directory: %s (format: %s, server: %s)\n", targetPath, *format, *serverURL)
		fmt.Println("Dep Radar CLI scanner stub initialized.")
	case "version":
		fmt.Println("depradar v0.1.0-dev")
	case "help":
		printUsage()
	default:
		fmt.Fprintf(os.Stderr, "Unknown command: %s\n", command)
		printUsage()
		os.Exit(1)
	}
}

func printUsage() {
	fmt.Println(`Usage: depradar <command> [arguments]

Commands:
  scan [path]    Scan a repository or SBOM for vulnerable dependencies
  version        Print CLI version information
  help           Show this help text`)
}
