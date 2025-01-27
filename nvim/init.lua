-- Basic vim options setup
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8  -- keep 8 lines above/below cursor when scrolling
vim.opt.ignorecase = true  -- ignore case when searching
vim.opt.smartcase = true  -- but don't ignore it when search string contains uppercase
vim.opt.updatetime = 250  -- faster completion
vim.opt.timeoutlen = 300 -- faster which-key

-- Packer bootstrap from before
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Plugin definitions
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'christoomey/vim-tmux-navigator'
    
    -- Telescope and dependencies
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP and completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Code coloring
    use { "catppuccin/nvim", as = "catppuccin" }
    
    -- Git signs in gutter
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    -- autopair parentheses & brackets
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }
    -- comment out lines with gcc or gc 
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    -- file tree    
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require("nvim-tree").setup({
                view = {
                    width = 30,
                },
                filters = {
                    dotfiles = false,
                },
            })
        end
    }
    -- droplines for indents
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup()
        end
    } 
    -- which-key: shows you available keybindings as you type
    use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup()
    end
    }
    
    -- undotree: visualize the undo history
    use 'mbbill/undotree'

    -- trouble: better error/warning/reference list
    use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
        require("trouble").setup()
        vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
    end
}
    -- (Python) debugger
    use 'nvim-neotest/nvim-nio'
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'  -- Adds a nice UI

    if packer_bootstrap then
        require('packer').sync()
    end
end)


-- Code color (should match the plugin)
vim.cmd.colorscheme "catppuccin-mocha"  -- or -latte, -frappe, -macchiato

-- Toggle file tree with leader + e
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Trouble
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
