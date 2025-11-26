--- @type vim.lsp.Config
return { cmd = { 'clangd', "-function-arg-placeholders=0", '-header-insertion=never' } }
