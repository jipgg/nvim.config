local fs, stdpath = vim.fs, vim.fn.stdpath
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require 'load_plugins' ()

vim.cmd('colorscheme oldworld')

local config_dir = fs.joinpath(stdpath 'config', 'lua', 'configs')
for name, type in fs.dir(config_dir) do
    if type ~= 'file' then goto continue end
    local path = fs.abspath(fs.joinpath(config_dir, name))
    local ok, err = pcall(dofile, path)
    if not ok then vim.print(err) end
    ::continue::
end
