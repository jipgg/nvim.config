require "first"
require "config.vim"
require "config.lazy"
require 'config.keymaps'
require 'config.colorscheme'
local lsp_overloads = require 'config.lsp_overloads'

vim.lsp.enable{"lua_ls", "clangd", "csharp_ls", "jsonls", "ts_ls", "luau_lsp"}
vim.lsp.config['*'] = {
  capabilities = require'cmp_nvim_lsp'.default_capabilities(),
  on_attach = function (client, bufnr)
    lsp_overloads(client, bufnr)
  end
}
vim.lsp.config('luau_lsp', require'config.lsp.luau_lsp')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function(args)
    vim.bo[args.buf].formatexpr = "v:vim.lsp.formatexpr()"
  end,
})
