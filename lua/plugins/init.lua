-- Plugins that require minimal setup will be placed here
return {
    "christoomey/vim-tmux-navigator",
    "nvim-tree/nvim-web-devicons",
    "mattn/emmet-vim",
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup()
        end
    },
}
