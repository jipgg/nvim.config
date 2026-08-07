local vim = vim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.nu = true
vim.o.relativenumber = false
vim.o.fillchars = 'eob: '
vim.o.cmdheight = 1
vim.o.exrc = true
vim.o.fencs = 'utf-8,utf-16le,default,latin1'
vim.o.softtabstop = 3
vim.o.shiftwidth = 3
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.expandtab = false
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.updatetime = 60
vim.o.encoding = "utf-8"
vim.o.fileencoding = 'utf-8'
vim.o.signcolumn = "number"
vim.o.autoindent = true
vim.o.clipboard = 'unnamed'
vim.api.nvim_set_option_value('clipboard', 'unnamed', {})

vim.keymap.set('n', '<leader>tn', vim.cmd.tabnew)
vim.keymap.set('n', '<leader>tp', vim.cmd.tabprev)
vim.keymap.set('n', '<leader>to', vim.cmd.tabnext)
vim.keymap.set('n', '<leader>tq', vim.cmd.tabclose)
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>dr', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<A-k>', vim.diagnostic.open_float)

vim.pack.add {
	{ src = "https://github.com/dgox16/oldworld.nvim" },
}
vim.pack.add {
	{ src = "https://github.com/rktjmp/lush.nvim" },
	{ src = "https://github.com/zenbones-theme/zenbones.nvim" },
}
vim.cmd.colorscheme "neobones"

vim.pack.add {
	{ src = "https://github.com/windwp/nvim-autopairs" },
}
require("nvim-autopairs").setup {}

vim.pack.add {
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
}
require('nvim-treesitter').setup {
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = { enable = true },
}
vim.api.nvim_create_autocmd('FileType', {
	pattern = { '<filetype>' },
	callback = function() vim.treesitter.start() end,
})
vim.pack.add {
	{ src = "https://github.com/neovim/nvim-lspconfig.git" },
}
vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },
})
require("blink.cmp").setup({
	keymap = {
		preset      = "none",
		["<C-r>"]   = { "show", "fallback" },
		["<A-j>"]   = { "show", "fallback" },
		["<C-e>"]   = { "cancel", "fallback" },
		["<CR>"]    = { "accept", "fallback" },
		["<M-CR>"]  = { "accept", "fallback" },
		["<C-b>"]   = { "scroll_documentation_up", "fallback" },
		["<C-f>"]   = { "scroll_documentation_down", "fallback" },
		["<Tab>"]   = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<C-j>"]   = { "select_next", "fallback" },
		["<C-k>"]   = { "select_prev", "fallback" },
	},
	appearance = { nerd_font_variant = 'mono' },
	completion = {
		menu = { auto_show = false },
		documentation = { auto_show = false },
	},
	signature = { enabled = true },
	sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
	fuzzy = { implementation = "prefer_rust_with_warning" }
})

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
})
require('telescope').setup {}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>aj', builtin.find_files)
vim.keymap.set('n', '<leader>ai', builtin.live_grep)
vim.keymap.set('n', '<leader>ak', builtin.buffers)
vim.keymap.set('n', '<leader>ao', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>ad', builtin.diagnostics)
vim.keymap.set('n', '<leader>ah', builtin.help_tags)

vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim.git" },
})
require('oil').setup()
vim.keymap.set('n', '<leader>al', vim.cmd.Oil)


vim.lsp.enable {
	"lua_ls",
	"clangd",
	"texlab",
	"html",
	"ts_ls",
	"pylsp",
	"zls",
	"cssls",
	"neocmake",
	"cmake",
	"basedpyright",
	"roslyn_ls",
	"gopls",
	"ols",
	"glsl_analyzer",
	"just",
	"c3_lsp",
}
vim.lsp.config.ols = {
	init_options = {
		checker_args = "-strict-style",
		collections = {
			{ name = "shared", path = vim.fn.expand('$HOME/odin-lib') }
		},
	},
}
vim.lsp.config("clangd", {
	cmd = { 'clangd', "-function-arg-placeholders=0", "-header-insertion=never" }
})
vim.diagnostic.config({
	signs = false,
	virtual_text = true,
	underline = true,
	update_in_insert = false
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		"tex",
		'lua',
		'luau',
		'cpp',
		'cs',
		'zig',
		'python',
		"http",
		"typescript",
		"typescriptreact",
		"go",
		"odin",
		"glsl",
		"just",
		"markdown",
	},
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end
})
