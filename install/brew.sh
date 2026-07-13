#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing Homebrew"

if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed."
    exit 0
fi

sudo apt update

sudo apt install -y \
    build-essential \
    bubblewrap \
    curl \
    file \
    git \
    procps

NONINTERACTIVE=1 \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Load Homebrew for current shell
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

    grep -qxF 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' ~/.bashrc || \
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> ~/.bashrc
fi

brew --version
