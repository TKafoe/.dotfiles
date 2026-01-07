local dap = require('dap')
local dap_python = require('dap-python')
local dap_ui = require('dapui')
local dap_ui_widgets = require('dap.ui.widgets')

-- Setup dap-python
dap_python.setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
dap_python.resolve_python = function()
    return "poetry"
end

dap_ui.setup()

-- Automatically open/close dap-ui
dap.listeners.after.event_initialized['dapui_config'] = function() dap_ui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dap_ui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dap_ui.close() end

-- Keymap options
local opts = { noremap = true, silent = true }

-- Stepping
vim.keymap.set('n', '<Leader>dc', dap.continue, opts)  -- Continue / start
vim.keymap.set('n', '<Leader>dn', dap.step_over, opts) -- Step over
vim.keymap.set('n', '<Leader>di', dap.step_into, opts) -- Step into
vim.keymap.set('n', '<Leader>do', dap.step_out, opts)  -- Step out

-- Breakpoints
vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, opts) -- Toggle breakpoint
vim.keymap.set('n', '<Leader>dB', function()                   -- Conditional breakpoint
    dap.set_breakpoint(nil, nil, vim.fn.input('Condition: '))
end, opts)
vim.keymap.set('n', '<Leader>dl', function() -- Log point
    dap.set_breakpoint(nil, nil, vim.fn.input('Log message: '))
end, opts)

-- REPL / run
vim.keymap.set('n', '<Leader>dr', dap.repl.open, opts) -- Open REPL
vim.keymap.set('n', '<Leader>dlr', dap.run_last, opts) -- Run last

-- Variable inspection
-- -- Show all scopes
vim.keymap.set('n', '<Leader>dv', function()
    dap_ui_widgets.centered_float(dap_ui_widgets.scopes)
end, opts)

-- Hover over variable
vim.keymap.set('n', '<Leader>dh', function()
    dap_ui_widgets.hover()
end, opts)

-- Evaluate visual selection
vim.keymap.set('v', '<Leader>dh', function()
    dap_ui_widgets.visual_hover()
end, opts)

-- dap-python specific: run tests
vim.keymap.set('n', '<Leader>dtm', dap_python.test_method, opts) -- Test current method
vim.keymap.set('n', '<Leader>dtc', dap_python.test_class, opts)  -- Test current class

-- DAP UI toggle
vim.keymap.set('n', '<Leader>du', dap_ui.toggle, opts)
