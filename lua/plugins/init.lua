-- Plugins that require minimal setup will be placed here
return {
    -- Themes
    "morhetz/gruvbox", -- gruvbox
    "nanotech/jellybeans.vim", -- jellybeans
    "luisiacc/gruvbox-baby",  -- gruvbox-baby
    "rebelot/kanagawa.nvim", -- kanagawa
    "folke/tokyonight.nvim", -- tokyonight
    "EdenEast/nightfox.nvim", -- nightfox

    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup()
        end
    },
}
