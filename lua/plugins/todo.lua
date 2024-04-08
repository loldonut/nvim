return {
    "folke/todo-comments.nvim",
    config = function()
        require("todo-comments").setup({})

        vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
        end, { desc = "Next todo comment!" })

        vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
        end, { desc = "Previous todo comment!" })

        vim.keymap.set("n", "<leader>tdq", ":TodoQuickFix<CR>",
            { desc = "Quickfix to show all todos" }
        )

        vim.keymap.set("n", "<leader>tdf", ":TodoTelescope<CR>",
            { desc = "Find TODOs using telescope.nvim" }
        )
    end
}
