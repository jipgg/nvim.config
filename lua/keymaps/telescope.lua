local builtin = require('telescope.builtin')
local mapkey = vim.keymap.set
mapkey('n', "<leader>gc", builtin.git_status)
mapkey('n', "<leader>gf", builtin.git_files)
mapkey('n', "<leader>aj", builtin.find_files)
mapkey('n', "<leader>ai", builtin.live_grep)
mapkey('n', "<leader>ak", builtin.buffers)
mapkey('n', "<leader>ao", builtin.current_buffer_fuzzy_find)
mapkey('n', "<leader>ad", builtin.diagnostics)
mapkey('n', "<leader>ah", builtin.help_tags)
