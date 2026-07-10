#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing Homebrew"

if installed brew; then
    echo "Homebrew already installed."
    exit 0
fi

sudo apt update

sudo apt install -y \
curl \
git \
build-essential \
procps \
file

NONINTERACTIVE=1 \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ -d "/home/linuxbrew/.linuxbrew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
fi
