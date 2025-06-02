require "first"
require "config.vim"
require "config.lazy"
require 'config.keymaps'
require 'config.colorscheme'
require 'lsp'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function(args)
    vim.bo[args.buf].formatexpr = "v:vim.lsp.formatexpr()"
  end,
})
