local prettier = require("prettier")

prettier.setup({
    bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
    ["null-ls"] = {
        condition = function ()
            return prettier.config_exists({
                check_package_json = true
            })
        end,
        runtime_condition = function ()
            return true
        end,
        timeout = 5000,
    },
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
    cli_options = {
        arrow_parens = "always",
        bracket_spacing = true,
        bracket_same_line = false,
        embedded_language_formatting = "auto",
        end_of_line = "lf",
        html_whitespace_sensitivity = "css",
        print_width = 80,
        prose_wrap = "preserve",
        quote_props = "as-needed",
        semi = true,
        single_quote = true,
        tab_width = 4,
        trailing_comma = "all",
        use_tabs = false,
        vue_indent_script_and_style = false,
    }
})
