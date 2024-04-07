return {
    "tpope/vim-fugitive",
    config = function()
        -- MORE KEYBINDS SOON
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.api.nvim_set_keymap("n", "<leader>gp", ":Git! push<CR>", {
            noremap = true
        })
    end
}
