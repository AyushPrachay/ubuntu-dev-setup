#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing Node"

if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"

source "$NVM_DIR/nvm.sh"

nvm install --lts
nvm use --lts
nvm alias default lts/*

npm install -g pnpm

node -v
npm -v
pnpm -v
