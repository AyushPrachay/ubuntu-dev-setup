#!/usr/bin/env bash

set -eo pipefail

heading() {
    echo
    echo "========================================"
    echo "$1"
    echo "========================================"
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

load_brew() {
    if [ -d "/home/linuxbrew/.linuxbrew" ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
    elif [ -d "$HOME/.linuxbrew" ]; then
        eval "$("$HOME/.linuxbrew/bin/brew" shellenv bash)"
    fi
}

load_nvm() {
    export NVM_DIR="$HOME/.nvm"

    if [ -s "$NVM_DIR/nvm.sh" ]; then
        # shellcheck disable=SC1090
        . "$NVM_DIR/nvm.sh"
    fi
}
