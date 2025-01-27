#!/bin/bash

# Exit on any error
set -e

NVIM_CONFIG_DIR="$HOME/.config/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Tmux + Neovim configuration..."

# Install Packer (Neovim package manager)
echo "Installing Packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Create Neovim config directory
echo "Creating Neovim config directories..."
mkdir -p "$NVIM_CONFIG_DIR/after/plugin"

# Copy Neovim configs
echo "Copying Neovim configurations..."
cp -r "$SCRIPT_DIR/nvim/init.lua" "$NVIM_CONFIG_DIR/"
cp -r "$SCRIPT_DIR/nvim/after/plugin/"* "$NVIM_CONFIG_DIR/after/plugin/"

# Copy Tmux config
echo "Copying Tmux configuration..."
cp "$SCRIPT_DIR/tmux.conf" "$HOME/.tmux.conf"

echo "Installation complete!"
