#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================"
echo "Ubuntu Developer Setup"
echo "========================================"

chmod +x "$ROOT_DIR"/install/*.sh
chmod +x "$ROOT_DIR"/verify.sh

"$ROOT_DIR/install/brew.sh"
"$ROOT_DIR/install/git.sh"
"$ROOT_DIR/install/node.sh"
"$ROOT_DIR/install/docker.sh"
"$ROOT_DIR/install/vscode.sh"
"$ROOT_DIR/install/cursor.sh"
"$ROOT_DIR/install/postman.sh"

echo
echo "Running verification..."
"$ROOT_DIR/verify.sh"

echo
echo "Setup completed successfully."
echo "Logout/Login once to enable Docker permissions."
