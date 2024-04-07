return {
    -- Themes
    --[[
    "morhetz/gruvbox", -- gruvbox
    "nanotech/jellybeans.vim", -- jellybeans
    "luisiacc/gruvbox-baby",  -- gruvbox-baby
    "rebelot/kanagawa.nvim", -- kanagawa
    "folke/tokyonight.nvim", -- tokyonight
    --]]
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[ colorscheme nightfox ]]
        end
    }, -- nightfox
}
