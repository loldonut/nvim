-- Plugins that require minimal setup will be placed here
return {
    "mattn/emmet-vim",
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup()
        end
    },
}
