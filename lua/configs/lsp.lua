local lsp, fs, stdpath = vim.lsp, vim.fs, vim.fn.stdpath
local create_autocmd = vim.api.nvim_create_autocmd

lsp.enable {
	"lua_ls",
	"clangd",
	"csharp_ls",
	"jsonls",
	"html",
	"ts_ls",
	"pylsp",
	"zls",
	"cssls",
	"neocmake",
	"cmake",
}
lsp.config('*', {
	capabilities = require 'cmp_nvim_lsp'.default_capabilities(),
})

create_autocmd("FileType", {
	pattern = "json",
	callback = function(args)
		vim.bo[args.buf].formatexpr = "v:vim.lsp.formatexpr()"
	end,
})
create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end
                if not client.server_capabilities.signatureHelpProvider then return end

		local lsp_overloads = require 'lsp-overloads'

		--- @diagnostic disable-next-line
		lsp_overloads.setup(client, {
			display_automatically = true,
			silent = true,
		})
	end
})

local configs_dir = fs.joinpath(stdpath 'config', 'lua', 'configs', 'lsp')

for entry, type in fs.dir(configs_dir) do
	if type ~= 'file' then goto continue end

	local lua_ext = '.lua'
	local file_ext = entry:sub(- #lua_ext)
	if file_ext ~= lua_ext then goto continue end

	local path = fs.joinpath(configs_dir, entry)
	local config = dofile(path)
	if not config then goto continue end

	local name = entry:match("(.+)%..-$")
	vim.lsp.config(name, config)

	::continue::
end
