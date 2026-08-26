return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',

    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    'j-hui/fidget.nvim',
  },
  config = function()
    require('fidget').setup()
    require('mason').setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local language_servers = {
      'ts_ls',
      'pyright',
      'eslint',
      'html',
      'jsonls',
    }

    require('mason-lspconfig').setup({
      ensure_installed = language_servers,
      handlers = {
        function(server_name)
          vim.lsp.enable(server_name)
        end,
      },
    })

    -- TODO: Use handlers
    vim.lsp.enable('clangd', {
      capabilities = capabilities,
    })
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
      capabilities = capabilities,
    })
    vim.lsp.config('rust_analyzer', {
      capabilities = capabilities,
    })

    vim.lsp.enable('lua_ls', {
      capabilities = capabilities,
    })

    vim.lsp.enable('gopls', {
      capabilities = capabilities,
    })

    vim.lsp.config('qmlls', {
      cmd = { 'qmlls6' },
      filetypes = { 'qml' },
      on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
      end,
      capabilities = capabilities,
    })

    vim.lsp.enable('qmlls')

    -- TODO: Maybe make a file that resolves augroups/autocmd?
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>dr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>rd', vim.lsp.buf.rename, opts)
      end,
    })
  end,
}
