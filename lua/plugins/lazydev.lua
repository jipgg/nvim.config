return {
   {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
         enabled = function(root_dir)
            return vim.fn.expand("%:t") == ".nvim.lua"
               or vim.fn.isdirectory(root_dir .. "/lua") == 1
               or root_dir == vim.fn.stdpath("config")
         end,
         library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
         },
      },
   },
}
