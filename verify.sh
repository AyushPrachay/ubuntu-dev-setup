#!/usr/bin/env bash

echo
echo "Verification"
echo "------------"

commands=(
git
brew
node
npm
pnpm
yarn
ncu
codex
docker
code
dbeaver
)

for cmd in "${commands[@]}"
do
    if command -v "$cmd" >/dev/null 2>&1
    then
        echo "✔ $cmd"
    else
        echo "✘ $cmd"
    fi
done

echo
echo "Versions"

git --version || true
brew --version || true
node --version || true
npm --version || true
pnpm --version || true
docker --version || true
code --version || true
codex --version || true

