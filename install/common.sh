#!/usr/bin/env bash

set -euo pipefail

heading() {
    echo
    echo "========================================"
    echo "$1"
    echo "========================================"
}

installed() {
    command -v "$1" >/dev/null 2>&1
}
