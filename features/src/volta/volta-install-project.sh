#!/bin/bash

set -e

PACKAGE_JSON="${1:-package.json}"

if [ ! -f "$PACKAGE_JSON" ]; then
    echo "No package.json found at $PACKAGE_JSON"
    exit 0
fi

PROJECT_DIR="$(dirname "$PACKAGE_JSON")"

cd "$PROJECT_DIR"

volta install