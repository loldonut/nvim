return {
  "stevearc/conform.nvim",
  lazy = false,
  config = function()
    local javascript = { { "prettierd", "prettier" } }

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = javascript,
        typescript = javascript,
      },
      formatters = {
        prettierd = {
          prepend_args = {
            "--single-quote",
            "--semi",
            "--quote-props=as-needed",
            "--end-of-line=lf",
            "--trailing-comma=all",
          },
        },
      },
      notify_on_error = false,
    })

    require("conform").formatters.injected = {
      options = {
        ignore_errors = true,
        lang_to_formatters = {
          json = { "jq" },
        },
      },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        local disable_filetypes = {
          html = true,
        }

        local filetype = vim.bo[args.buf].filetype

        require("conform").format({
          bufnr = args.buf,
          timeout_ms = 500,
          async = true,
          lsp_fallback = not disable_filetypes[filetype],
        })
      end,
    })

    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end)
  end,
}
