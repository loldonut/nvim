return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  tag = 'v0.1.9',
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>pf', function()
      builtin.find_files({
        no_ignore = true,
        hidden = true,
      })
    end, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fd', builtin.buffers, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

    vim.keymap.set('n', '<leader>pd', builtin.lsp_references, {})

    local telescopeConfig = require('telescope.config')
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- search in hidden/dot files.
    table.insert(vimgrep_arguments, '--hidden')
    -- don't search in the `.git` directory.
    table.insert(vimgrep_arguments, '--glob')
    table.insert(vimgrep_arguments, '!**/.git/*')

    require('telescope').setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
      defaults = {
        file_ignore_patterns = {
          'node_modules',
          '.git',
        },
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
        },
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          previewer = false,
          mappings = {
            i = {
              ['<c-d>'] = 'delete_buffer',
            },
          },
        },
      },
    })

    require('telescope').load_extension('fzf')
  end,
}
