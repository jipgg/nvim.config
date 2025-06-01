local util = require "util"
local telescope_builtin = require('telescope.builtin')
local set = vim.keymap.set

local function wrap(command)
    return function() vim.cmd(command) end
end

set('n', "<leader>dr", vim.lsp.buf.rename)
set("n", "<leader>gn", vim.cmd.Neogit)
set('n', "<leader>gt", util.toggle_gitsigns)
set('n', "<leader>gc", telescope_builtin.git_status)
set('n', "<leader>gf", telescope_builtin.git_files)
set('n', "<leader>aj", telescope_builtin.find_files)
set('n', "<leader>ai", telescope_builtin.live_grep)
set('n', "<leader>ak", telescope_builtin.buffers)
set('n', "<leader>ao", telescope_builtin.current_buffer_fuzzy_find)
set('n', "<leader>ad", telescope_builtin.diagnostics)
set('n', "<leader>ah", telescope_builtin.help_tags)
set("n", "<leader>al", vim.cmd.Oil)
set('n', '<leader>!', util.toggle_background)
set('n', '<leader>rr', wrap("Rest run"))
set('n', '<leader>rl', wrap("Rest last"))
set('n', '<leader>ro', wrap("Rest open"))
set('n', '<A-k>', vim.diagnostic.open_float)

set('n', '<leader>tn', vim.cmd.tabnew)
set('n', '<leader>tp', vim.cmd.tabprev)
set('n', '<leader>to', vim.cmd.tabnext)
set('n', '<leader>tq', vim.cmd.tabclose)

set('n', '<leader>w', '<C-w>')
set('t', '<Esc>', '<C-\\><C-n>')

set('n', '<leader>lr', vim.cmd.LspRestart)
set('n', '<leader>lx', vim.cmd.LspStop)
set('n', '<leader>ls', vim.cmd.LspStart)
set('n', '<leader>la', vim.cmd.LspInfo)

