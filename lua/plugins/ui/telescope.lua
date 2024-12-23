-- NOTE: Fuzzy Finder (files, lsp, etc)
-- See :Telescope help_tags
-- Two important keymaps to use while in Telescope are:
--  - Insert mode: <c-/>
--  - Normal mode: ?
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    {
      -- NOTE: If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    -- NOTE:
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          '^.git/',
          '^node_modules/',
          '^.next/',
          '%.ico',
          '%.png',
          '%.jpg',
          '%.jpeg',
          '%.gif',
          '%.DS_Store',
        },
        -- mappings = {
        --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        -- },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_cursor(),
        },
      },
    }

    -- NOTE: Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- NOTE: See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>ff', function()
      builtin.find_files { hidden = true, no_ignore = true }
    end, { desc = '[F]ind [F]iles' })

    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = '[/] Fuzzily find in current buffer' })
    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[F]ind [/] in Open Files' })

    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })

    vim.keymap.set('n', '<leader>fd', function()
      builtin.diagnostics(require('telescope.themes').get_ivy())
    end, { desc = '[F]ind [D]iagnostics' })

    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })

    -- NOTE: Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[F]ind [N]eovim files' })

    -- NOTE: View messages from noice
    vim.keymap.set('n', '<leader>fm', '<cmd>Noice telescope<CR>', { desc = '[F]ind [M]essages' })
  end,
}
