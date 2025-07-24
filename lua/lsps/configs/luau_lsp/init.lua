local util = require('lsps.configs.luau_lsp.util')
local solved = util.solve_nvimlspconfig_info()

if solved then
    vim.lsp.config.luau_lsp = {
        cmd = solved.command,
        settings = {["luau-lsp"] = solved.settings},
    }
end
