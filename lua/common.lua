local M = {}

--- @param path string
--- @return string|nil, nil|string
function M.read_file(path)
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
function M.read_json_file(path)
    local data, err = M.read_file(path)
    if not data then return nil, err end
    local ok, content = pcall(vim.json.decode, data)
    if not ok then return nil, content end
    return content
end
--- @alias DirectoryIterator fun(): string?, string?
--- directory iterator
--- @param dirpath string
--- @return DirectoryIterator
function M.subpaths(dirpath)
    local dir = vim.uv.fs_scandir(dirpath)
    if not dir then
        return function() end
    end
    return function()
        local name, type = vim.uv.fs_scandir_next(dir)
        if name then
            return name, type
        else
            return nil, nil
        end
    end
end

return M
