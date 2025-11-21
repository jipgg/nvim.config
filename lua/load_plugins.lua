local LAZY_PATH = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv, opt = vim.uv, vim.opt

local is_lazy_installed = function()
    return uv.fs_stat(LAZY_PATH) ~= nil
end

local install_lazy = function()
    local res = vim.system {
        "git", "clone",
        "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        LAZY_PATH
    }:wait()
    if res.code ~= 0 then
        return nil, res.stderr
    else
        return res.stdout, nil
    end
end

if not is_lazy_installed() then
    assert(install_lazy())
end

return function()
    vim.opt.rtp:prepend(LAZY_PATH)
    local lazy = require 'lazy'
    lazy.setup {
        spec = {
            { import = 'plugins' },
        },
        checker = { enabled = false },
    }
end
