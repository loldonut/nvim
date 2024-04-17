return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { { "prettierd", "prettier" } },
            },
            format_on_save = { timeout_ms = 500, },
            format_after_save = {
                lsp_fallback = true,
            },
            formatters = {
                prettierd = {
                    prepend_args = { "--single-quote" }
                }
            },
        })

        require("conform").formatters.injected = {
            options = {
                ignore_errors = true,
                lang_to_formatters = {
                    json = { "jq" },
                },
            },
        }
    end
}
