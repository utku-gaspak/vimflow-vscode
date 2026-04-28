#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim_backup_$(date +%Y%m%d_%H%M%S)"

echo "Installing VSCode Neovim Productivity Kit..."

if [ -d "$CONFIG_DIR" ]; then
  echo "Existing Neovim config found. Creating backup:"
  echo "$BACKUP_DIR"
  mv "$CONFIG_DIR" "$BACKUP_DIR"
fi

mkdir -p "$CONFIG_DIR"
cp init.lua "$CONFIG_DIR/init.lua"

echo "Done."
echo ""
echo "Next steps:"
echo "1. Open Neovim once with: nvim"
echo "2. Run: :Lazy sync"
echo "3. Restart VSCode"
echo ""
echo "Make sure the VSCode Neovim extension is installed."
