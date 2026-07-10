#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing OpenAI Codex CLI"

# Load NVM
export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
else
    echo "NVM is not installed. Please run node.sh first."
    exit 1
fi

if npm list -g @openai/codex >/dev/null 2>&1; then
    echo "Codex CLI is already installed."
    exit 0
fi

npm install -g @openai/codex

echo "Codex CLI installed successfully."

codex --version || true
