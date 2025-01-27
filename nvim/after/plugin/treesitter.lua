require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "python",
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "html",
        "json",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
})

-- Set folding based on treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false  -- Disable folding by default
