local _, os = pcall(vim.uv.os_uname)
local sys = nil
if os then
  sys = os.sysname
end
__WINDOWS__ = (sys == "Windows_NT") and true or nil
__LINUX__ = (sys == "Linux") and true or nil
__MACOS__ = (sys == "Darwin") and true or nil

