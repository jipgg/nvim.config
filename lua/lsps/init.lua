require 'lsps.configs.luau_lsp'
require 'lsps.configs.clangd'
local overloads = require'lsps.overloads_handler'
local cmp = require'cmp_nvim_lsp'


vim.lsp.config['*'] = {
    capabilities = cmp.default_capabilities(),
}
-- on_attach in lsp.config['*'] does not take precedence over existing bound on_attach functions
-- autocmd workaround
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        overloads(client)
    end
})

vim.lsp.enable{
    "lua_ls",
    "clangd",
    "csharp_ls",
    "jsonls",
    "ts_ls",
    "luau_lsp",
    "bashls",
    "pylsp"
}
