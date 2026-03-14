local nvim_treesitter = require 'nvim-treesitter'
nvim_treesitter.install {
	'lua',
	'luau',
	'cpp',
	'c_sharp',
	'python',
	"http",
	"typescript",
	"tsx",
	"markdown"
}

vim.api.nvim_create_autocmd('FileType', {
	pattern = {
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
		"markdown",
	},
	callback = function(args)
      pcall(vim.treesitter.start, args.buf)
	end
})
