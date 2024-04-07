return {
    "tpope/vim-fugitive",
    config = function()
        -- MORE KEYBINDS SOON
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
}
