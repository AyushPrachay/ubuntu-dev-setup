#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

heading "Installing DBeaver Community"

if command -v dbeaver >/dev/null 2>&1; then
    echo "DBeaver is already installed."
    exit 0
fi

wget -O - https://dbeaver.io/debs/dbeaver.gpg.key \
| sudo gpg --dearmor \
-o /usr/share/keyrings/dbeaver.gpg

echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg] https://dbeaver.io/debs/dbeaver-ce /" \
| sudo tee /etc/apt/sources.list.d/dbeaver.list >/dev/null

sudo apt update

sudo apt install -y dbeaver-ce

echo "DBeaver installed successfully."
