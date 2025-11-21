local tb = require 'telescope.builtin'

---@alias keymaps table<string, config.keymap.Entry>
---@type keymaps
local keymaps = {
    ['<leader>gn'] = vim.cmd.Neogit,
    ['<leader>al'] = vim.cmd.Oil,

    ['<leader>tn'] = vim.cmd.tabnew,
    ['<leader>tp'] = vim.cmd.tabprev,
    ['<leader>to'] = vim.cmd.tabnext,
    ['<leader>tq'] = vim.cmd.tabclose,

    ['<leader>w'] = '<C-w>',
    ['<Esc>'] = { mode = 't', action = '<C-\\><C-n>' },

    ['<leader>dr'] = vim.lsp.buf.rename,
    ['<leader>lf'] = vim.lsp.buf.format,
    ['<A-k>'] = vim.diagnostic.open_float,

    ['<leader>gc'] = tb.git_status,
    ['<leader>gf'] = tb.git_files,
    ['<leader>aj'] = tb.find_files,
    ['<leader>ai'] = tb.live_grep,
    ['<leader>ak'] = tb.buffers,
    ['<leader>ao'] = tb.current_buffer_fuzzy_find,
    ['<leader>ad'] = tb.diagnostics,
    ['<leader>ah'] = tb.help_tags,
}

for key, val in pairs(keymaps) do
    local type = type(val)
    if type == 'table' then
        assert(val.mode and val.action)
        vim.keymap.set(val.mode, key, val.action)
    else
        assert(type == 'string' or type == 'function')
        vim.keymap.set('n', key, val)
    end
end

--- @alias config.keymap.Mode 'n' | 't' | 'v' | 'i'
--- @alias config.keymap.Description { mode: config.keymap.Mode, action: function | string }
--- @alias config.keymap.Entry function | string | config.keymap.Description
