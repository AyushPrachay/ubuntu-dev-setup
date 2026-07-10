#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing DBeaver"

# Load Homebrew environment
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -d "$HOME/.linuxbrew" ]; then
    eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
fi

if brew list --cask dbeaver-community >/dev/null 2>&1; then
    echo "DBeaver is already installed."
    exit 0
fi

brew install --cask dbeaver-community

echo "DBeaver installation completed."
