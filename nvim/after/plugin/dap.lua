local dap = require('dap')
local dapui = require('dapui')

-- Set up Python
-- Automatically use the active venv's python
local function get_python_path()
    local venv = os.getenv('VIRTUAL_ENV')
    if venv then
        return venv .. '/bin/python'
    else
        return 'python3'
    end
end

require('dap-python').setup(get_python_path())

-- Set up UI
dapui.setup()

-- Open/close UI automatically
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end

-- Keymaps
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>dn', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>dh', require('dap.ui.widgets').hover)  -- hover during debug (shows value under cursor)
