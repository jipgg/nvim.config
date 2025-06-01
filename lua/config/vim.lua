vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 60
vim.o.fillchars = 'eob: '
vim.o.cmdheight = 1
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = 'utf-8'
vim.o.fencs = 'utf-8,utf-16le,default,latin1'
vim.opt.signcolumn = "number"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.api.nvim_set_option_value("clipboard", "unnamed", {})
if __WINDOWS__ then
  vim.o.fileformats = "dos"
end
vim.o.exrc = true
