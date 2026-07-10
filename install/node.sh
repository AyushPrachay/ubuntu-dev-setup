#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing Node.js (LTS)"

if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"

# shellcheck disable=SC1090
source "$NVM_DIR/nvm.sh"

nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

echo "Installing global npm packages..."

npm install -g \
    pnpm \
    @openai/codex \
    npm-check-updates \
    yarn

echo
echo "Installed versions:"
node -v
npm -v
pnpm -v
yarn -v
codex --version || true
ncu --version
