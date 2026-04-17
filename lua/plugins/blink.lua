return {
   {
      "saghen/blink.cmp",
      build = "cargo build --release",
      opts = {
         keymap = {
            preset = "none",
            ["<C-Space>"] = { "show", "fallback" },
            ["<C-e>"]     = { "cancel", "fallback" },
            ["<CR>"]      = { "accept", "fallback" },
            ["<M-CR>"]    = { "accept", "fallback" },
            ["<C-b>"]     = { "scroll_documentation_up", "fallback" },
            ["<C-f>"]     = { "scroll_documentation_down", "fallback" },
            ["<Tab>"]     = { "select_next", "fallback" },
            ["<S-Tab>"]   = { "select_prev", "fallback" },
            ["<C-j>"]     = { "select_next", "fallback" },
            ["<C-k>"]     = { "select_prev", "fallback" },
         },
         completion = {
            -- menu = {
            --    draw = {
            --       -- no kind icon column
            --       columns = { { "label", "label_description", gap = 1 }, { "kind" } },
            --    },
            -- },
            documentation = { auto_show = true },
         },
         signature = { enabled = true },
         sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
               lazydev = {
                  name = "LazyDev",
                  module = "lazydev.integrations.blink",
                  score_offset = 100,
               },
            },
         },
      },
   },
}
