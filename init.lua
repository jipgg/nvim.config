local _, os = pcall(vim.uv.os_uname)
local sysname = nil
if os then sysname = os.sysname end
__WINDOWS__ = (sysname == "Windows_NT") and true or nil
__LINUX__ = (sysname == "Linux") and true or nil
__MACOS__ = (sysname == "Darwin") and true or nil

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require 'lazy_loader'
require 'neomodern'.load() -- colorscheme
require 'options'
require 'keymaps'
require 'lsps'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function(args)
    vim.bo[args.buf].formatexpr = "v:vim.lsp.formatexpr()"
  end,
})
