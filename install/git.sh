#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing Git"

sudo apt install -y git

git --version
