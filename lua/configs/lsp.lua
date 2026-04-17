local lsp        = require "vim.lsp"
local fs         = require "vim.fs"
local diagnostic = require "vim.diagnostic"
local api        = vim.api

lsp.enable {
   "lua_ls",
   "clangd",
   "texlab",
   "jsonls",
   "html",
   "ts_ls",
   "pylsp",
   "zls",
   "cssls",
   "neocmake",
   "cmake",
   "basedpyright",
   "omnisharp",
   "gopls",
}

diagnostic.config {
   underline = { severity = { min = "INFO" } }
}
api.nvim_set_hl(0, "SnippetTabstop", {})

api.nvim_create_autocmd("FileType", {
   pattern = "json",
   callback = function(args)
      vim.bo[args.buf].formatexpr = "v:vim.lsp.formatexpr()"
   end,
})

local configs_dir = fs.joinpath(vim.fn.stdpath 'config', 'lua', 'configs', 'lsp')

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
