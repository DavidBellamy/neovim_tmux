# Minimal Tmux + Neovim Setup

Modern development environment with seamless Tmux+Neovim integration, LSP support, and Python debugging.

## Features

In this setup, the `<leader>` key in neovim is the spacebar and the prefix key in tmux is `Ctrl-a`. You can change this if you like. I also use the Caps Lock key for Ctrl, which needs configuring at the OS level. That way, a tmux prefix of `Ctrl-a` is quite good.

which-key is included, so you can press `<leader>` (i.e. spacebar) and see a menu of shortcuts.

* Seamless navigation between tmux panes and neovim splits (Ctrl + h/j/k/l)
* Copy text to system clipboard (tmux-yank)
    * Copy current command line: `prefix + y`
    * Copy current working directory: `prefix + Y`
    * In copy mode (`prefix + [`):
        * `y` to copy selection
        * `Y` to copy selection and paste
* File explorer sidebar (see nvim-tree shortcuts; `<leader>e` to open)
* Fuzzy finding (see Telescope shortcuts; `<leader>ff` to search files)
* Git integration (`]c` next change; `[c` previous change)
* LSP:
    * Code completion (force with `Ctrl + Space`)
    * Go-to-definition (`gd`)
    * Find references (`gr`)
    * Hover docs (`K`)
    * Rename symbols (`<leader>rn`)
    * Code actions (`<leader>ca`)
* Python debugging
	* Set breakpoint: `<leader>db`
	* Start/continue: `<leader>dc`
	* Step over: `<leader>dn` 
	* Step into: `<leader>di` 
    * Hover (see value under cursor): `<leader>dh`
* Markdown preview; live on localhost! `<leader>mp` start preview; `<leader>ms` stop preview.
* Other: auto-pairing of brackets & quotes, indent dropline guides, syntax highlighting (Treesitter). 

## Prerequisites
```bash
# Install these first
brew install neovim tmux ripgrep node  # macOS 
# OR
sudo apt install neovim tmux ripgrep nodejs  # Ubuntu/Debian`
```

## Installation
```bash
# 1. Clone this repo
git clone https://github.com/DavidBellamy/neovim_tmux.git
cd neovim_tmux

# 2. Run install script
chmod +x install.sh
./install.sh

# 3. Install debugpy in your Python environment
pip install debugpy
```

## First Run
After installation:

1. Open a tmux session
2. Install plugins: `prefix I` (capital I)
1. Open nvim
2. Run `:PackerSync`
3. Restart nvim

Press `Space` to see available commands via which-key.

Let me know if you'd like me to add more details to any section!
