return {
  "kylechui/nvim-surround",
  config = function()
    require("nvim-surround").setup({})

    vim.keymap.set("n", "<leader>sqd", 'ysw"')
    vim.keymap.set("n", "<leader>cqd", 'ys$"')
  end,
}
