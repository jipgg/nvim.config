local luau_lsp = require 'luau-lsp'
local function is_rojo()
    return vim.fs.root(0, function(name)
        return name:match(".+%.project%.json$")
    end)
end

luau_lsp.setup {
    platform = { type = is_rojo() and "roblox" or "standard" },
    plugin = { enabled = true },
    fflags = { enable_new_solver = true },
}

return nil
