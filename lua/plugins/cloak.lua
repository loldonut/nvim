return {
  "laytan/cloak.nvim",
  config = function()
    require("cloak").setup({
      enabled = true,
      cloak_character = "*",
      highlight_group = "Comment",
      cloak_length = nil,
      try_all_patterns = true,
      cloak_telescope = true,
      patterns = {
        {
          file_pattern = ".env*,config.json",
          cloak_pattern = {
            "=.+",
            { ":.+" },
          },
          replace = nil,
        },
      },
    })
  end,
}
