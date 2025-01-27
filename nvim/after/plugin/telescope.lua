local builtin = require('telescope.builtin')

-- Basic file and grep finder keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Additional useful ones
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})  -- search for word under cursor
vim.keymap.set('n', '<C-p>', builtin.git_files, {})        -- search git files
