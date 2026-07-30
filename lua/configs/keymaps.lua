local telescope_builtin = require 'telescope.builtin'

local toggle_background = function()
   if (vim.o.background == 'light') then
      vim.o.background = "dark"
      vim.cmd("colorscheme oldworld")
   else
      vim.o.background = "light"
      require("neomodern").load()
   end
end
local blink_cmp = require("blink.cmp")
---@alias keymaps table<string, config.keymap.Entry>
---@type keymaps
local keymaps = {
   ['<A-j>'] = {mode = "i",action = blink_cmp.show},
   ['<leader>gn'] = vim.cmd.Neogit,
   ['<leader>al'] = vim.cmd.Oil,

   ['<leader>tn'] = vim.cmd.tabnew,
   ['<leader>tp'] = vim.cmd.tabprev,
   ['<leader>to'] = vim.cmd.tabnext,
   ['<leader>tq'] = vim.cmd.tabclose,
   ['<leader>bg'] = toggle_background,

   ['<leader>w'] = '<C-w>',
   ['<Esc>'] = { mode = 't', action = '<C-\\><C-n>' },

   ['<leader>dr'] = vim.lsp.buf.rename,
   ['<leader>lf'] = vim.lsp.buf.format,
   ['<A-k>'] = vim.diagnostic.open_float,

   ['<leader>aj'] = telescope_builtin.find_files,
   ['<leader>ai'] = telescope_builtin.live_grep,
   ['<leader>ak'] = telescope_builtin.buffers,
   ['<leader>ao'] = telescope_builtin.current_buffer_fuzzy_find,
   ['<leader>ad'] = telescope_builtin.diagnostics,
   ['<leader>ah'] = telescope_builtin.help_tags,
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
