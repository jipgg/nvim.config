local treesitter = {
    "c",
    "lua",
    "vim",
    "cpp",
    "luau",
    "vimdoc",
    "zig",
}
if __LINUX__ then
    table.insert(treesitter, "bash")
elseif __WINDOWS__ then
    table.insert(treesitter, "c_sharp")
end
local mason = {}
if __MASON_ENSURE_INSTALLED__ then
    mason = {
        "clangd",
        "lua_ls",
        "luau_lsp",
        "zls",
    }
    if __LINUX__ then
        table.insert(mason, "bashls")
    elseif __WINDOWS__ then
        table.insert(mason, "csharp_ls")
    end
end
return {
    treesitter = treesitter;
    mason = mason;
}
