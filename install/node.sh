#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing Node.js (LTS)"

# Install NVM if missing
if [ ! -d "$HOME/.nvm" ]; then
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck disable=SC1090
    . "$NVM_DIR/nvm.sh"
else
    echo "Failed to load NVM."
    exit 1
fi

echo "Installing latest LTS version..."

nvm install --lts
nvm use --lts

# Set latest LTS as default (avoids PROVIDED_VERSION error)
DEFAULT_NODE="$(nvm version 'lts/*')"
nvm alias default "$DEFAULT_NODE"

echo
echo "Installing global npm packages..."

npm install -g \
    pnpm \
    yarn \
    npm-check-updates \
    @openai/codex

echo
echo "Installed versions:"
echo "Node   : $(node -v)"
echo "npm    : $(npm -v)"
echo "pnpm   : $(pnpm -v)"
echo "Yarn   : $(yarn -v)"
echo "NCU    : $(ncu --version)"
echo "Codex  : $(codex --version 2>/dev/null || echo 'Installed')"
