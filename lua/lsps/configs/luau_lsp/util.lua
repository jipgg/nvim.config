--- @param path string
--- @return string|nil, nil|string
local function read_file(path)
    local fd, err_fd = vim.uv.fs_open(path, 'r', 438)
    if not fd then return nil, err_fd end
    local fstat, err_fstat = vim.uv.fs_fstat(fd)
    if not fstat then
        vim.uv.fs_close(fd)
        return nil, err_fstat
    end
    local data, err_data = vim.uv.fs_read(fd, fstat.size)
    vim.uv.fs_close(fd)
    return data, err_data
end

--- @return string|nil, nil|string
local function read_json_file(path)
    local data, err = read_file(path)
    if not data then return nil, err end
    local ok, content = pcall(vim.json.decode, data)
    if not ok then return nil, content end
    return content
end

local function get_rc_aliases(path)
    local rc = assert(read_json_file(path or (vim.uv.cwd().."/.luaurc")))
    if rc["aliases"] == nil then
        return nil
    end
    local aliases = {}
    for k, v in pairs(rc["aliases"]) do
        aliases['@'..k] = vim.fs.normalize(v)
    end
    return aliases
end

local M = {}

function M.solve_nvimlspconfig_info()
    local lsp_config = read_file(vim.uv.cwd().."/.nvimlspconfig.lua")
    if not lsp_config then
        return nil
    end
    local data = loadstring(lsp_config)()
    if not data or not data.luau_lsp then
        return nil
    end
    local luau = data.luau_lsp
    local command = {"luau-lsp", "lsp"}
    if luau.v2 then
        table.insert(command, "--flag:LuauSolverV2=True")
    end
    if luau.definitions then
        for _, v in ipairs(luau.definitions) do
            table.insert(command, "--definitions="..v)
        end
    end
    if luau.docs then
        for _, v in ipairs(luau.docs) do
            table.insert(command, "--docs="..v)
        end
    end
    local settings = nil
    if luau.preset == "roblox" then
        local res = assert(os.getenv("LOCALAPPDATA")).."/nvim/lua/lsps/configs/luau_lsp/resources"
        table.insert(command, "--definitions="..res.."/globalTypes.d.luau")
        table.insert(command, "--docs="..res.."/api-docs.json")
        print("loading roblox preset")
        settings = require('lsps.configs.luau_lsp.settings.roblox')
    else
        print("loading standard preset")
        settings = require('lsps.configs.luau_lsp.settings.standard')(get_rc_aliases())
    end
    return {
        command = command,
        settings = settings,
    }
end

return M
