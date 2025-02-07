return {
    {'navarasu/onedark.nvim'},
    {'Mofiqul/vscode.nvim'},
    {"zenbones-theme/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" }},
    {"rebelot/kanagawa.nvim"},
    {"killitar/obscure.nvim",lazy = false, priority = 1000, opts = {}},
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    {"slugbyte/lackluster.nvim"},
    {"steguiosaur/fullerene.nvim", lazy = false, priority = 1000},
    {"ishan9299/modus-theme-vim", lazy = false, priority =1000},
    {"Shatur/neovim-ayu"},
    {"miffi/apropospriate.nvim"},
    {
        "rockyzhang24/arctic.nvim",
        dependencies = { "rktjmp/lush.nvim" },
        name = "arctic",
        branch = "main",
        priority = 1000,
    },
    {
        'cdmill/neomodern.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('neomodern').setup{}
        end
    }
}
