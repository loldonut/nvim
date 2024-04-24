return {
  "tpope/vim-fugitive",
  config = function()
    -- MORE KEYBINDS SOON
    -- TODO: Add more keybinds
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
  end,
}
