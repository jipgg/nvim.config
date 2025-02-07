local function win_root_dir()-- monkey patch, cons are that the root dir needs to be cd'd to before lsp works
    return vim.fn.getcwd();
end
local lspconfig = require "lspconfig"
return {
    sqls = function ()
        lspconfig.sqls.setup{
            settings = {
                sqls = {
                    connections = {
                        {
                            driver = 'mysql',
                            dataSourceName = 'root:root@tcp(localhost:3306)/store',
                        },
                        {
                            driver = 'mysql',
                            dataSourceName = 'root:root@tcp(localhost:3306)/examdb',
                        }
                    }
                }
            }

        }
    end,
    zls = function ()
        lspconfig.zls.setup{
        }
    end,
    clangd = function()
        lspconfig.clangd.setup {
            cmd = {"clangd", "-header-insertion=never"},
            settings = {
                ["clangd"] = {
                    completion = {style = "detailed"},
                }
            }
        }
    end,
    luau_lsp = function()
        lspconfig.luau_lsp.setup {
            cmd = {"luau-lsp", "lsp", --[["--definitions=definitions.d.luau"]]},
            settings = {
                ["luau-lsp"] = {
                    platform = {
                        type = "standard",
                    },
                    require = {
                        mode = "relativeToFile",
                        -- directoryAliases = {
                        --     ["legion"] = "./legion_luau/",
                        -- },
                    },
                    sourcemap = {
                        enabled = false,
                        autogenerate = false,
                    },
                    index = {
                        enabled = true,
                    },
                    hover = {
                        strictDatamodelTypes = false,
                    },
                    diagnostics = {
                        strictDatamodelTypes = true,
                        includeDependents = true,
                    },
                    imports = {
                        requireStyle = "auto",
                        suggestRequires = true,
                        suggestServices = true,
                    },
                    plugin = {
                        enabled = false,
                    },
                }
            }
        }
    end,
    lua_ls = function()
        local t = {}
        if __WINDOWS__ then
            t.root_dir = win_root_dir;
        end
        lspconfig.lua_ls.setup(t)
    end,
    sqlls = function()
        local t = {}
        if __WINDOWS__ then
            t.root_dir = win_root_dir;
            lspconfig.sqlls.setup(t);
        end
    end,
    cssls = function ()
        --Enable (broadcasting) snippet capability for completion
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        require'lspconfig'.cssls.setup {
            capabilities = capabilities,
        }
    end,
    function(server_name) -- default handlers
        lspconfig[server_name].setup({})
    end,
}
