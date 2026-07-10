#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing VS Code"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
| gpg --dearmor > packages.microsoft.gpg

sudo install \
-o root \
-g root \
-m 644 \
packages.microsoft.gpg \
/etc/apt/keyrings/

echo \
"deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
| sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update

sudo apt install -y code

code --version
