local cmm = require'common'

local aliases = {}
local command = {"luau-lsp", "lsp"}
local cwd = vim.uv.cwd()

local config = cmm.read_json_file(cwd.."/.luaurc")
if config then
    for k, v in pairs(config.aliases) do
        aliases['@'..k] = vim.fs.normalize(v)
    end
end

local definitions_content = cmm.read_file(cwd.."/.nvimlspconfig.lua")
if definitions_content then
    local data = loadstring(definitions_content)()
    if data and data.luau_lsp then
        local luau = data.luau_lsp
        if luau.definitions then
            for i, v in ipairs(luau.definitions) do
                table.insert(command, "--definitions="..v)
            end
        end
        if luau.docs then
            for i, v in ipairs(luau.docs) do
                table.insert(command, "--docs="..v)
            end
        end
    end
end

local settings = {
    platform = {
        type = "standard",
    },
    require = {
        mode = "relativeToFile",
        directoryAliases = aliases,
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
        --strictDatamodelTypes = true,
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
return {
    cmd = command,
    settings = {["luau-lsp"] = settings},
}
