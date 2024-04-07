return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                "javascript",
                "typescript",
                "c",
                "vim",
                "vimdoc"
            },
            sync_installed = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        })
    end
}
