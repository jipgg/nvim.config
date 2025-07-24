require 'keymaps.lsp'
require 'keymaps.rest'
require 'keymaps.telescope'

vim.keymap.set("n", "<leader>gn", vim.cmd.Neogit)
vim.keymap.set("n", "<leader>al", vim.cmd.Oil)

vim.keymap.set('n', '<leader>tn', vim.cmd.tabnew)
vim.keymap.set('n', '<leader>tp', vim.cmd.tabprev)
vim.keymap.set('n', '<leader>to', vim.cmd.tabnext)
vim.keymap.set('n', '<leader>tq', vim.cmd.tabclose)

vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
