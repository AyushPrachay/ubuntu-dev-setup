#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing Cursor"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install --cask cursor
