local util = {}

function util.toggle_gitsigns()
  vim.cmd "Gitsigns toggle_numhl"
  vim.cmd "Gitsigns toggle_current_line_blame"
end
local is_bg_light = false
function util.toggle_background()
  is_bg_light = not is_bg_light
  vim.cmd.colorscheme( is_bg_light and "modus-operandi" or "modus-vivendi")
  vim.cmd.set(("background=%s"):format(is_bg_light and "light" or "dark"))
end

return util
