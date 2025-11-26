local o = vim.o

o.nu = true
o.relativenumber = true
o.fillchars = 'eob: '
o.cmdheight = 1
o.exrc = true
o.fencs = 'utf-8,utf-16le,default,latin1'
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.wrap = false
o.swapfile = false
o.backup = false
o.hlsearch = false
o.incsearch = true
o.termguicolors = true
o.scrolloff = 8
o.updatetime = 60
o.encoding = "utf-8"
o.fileencoding = 'utf-8'
o.signcolumn = "number"
o.autoindent = true
o.clipboard = 'unnamed'

vim.api.nvim_set_option_value('clipboard', 'unnamed', {})

