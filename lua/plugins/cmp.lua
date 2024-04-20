local enabled = true

-- NOTE: Autocompletion
-- See `:help cmp`
local plugin = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- NOTE: `friendly-snippets` contains a variety of premade snippets.
        -- See the README about individual language/framework/plugin snippets:
        -- https://github.com/rafamadriz/friendly-snippets
        --
        -- {
        --   'rafamadriz/friendly-snippets',
        --   config = function()
        --     require('luasnip.loaders.from_vscode').lazy_load()
        --   end,
        -- },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- NOTE: Read `:help ins-completion`
      mapping = cmp.mapping.preset.insert {
        -- NOTE: Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- NOTE: Select the [n]ext item
        -- ['<C-n>'] = cmp.mapping.select_next_item(),
        -- NOTE: Select the [p]revious item
        -- ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- NOTE: Accept ([y]es) the completion.
        -- This will auto-import if your LSP supports it.
        -- This will expand snippets if the LSP sent a snippet.
        -- ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- NOTE: Traditional completion keymaps
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- NOTE: Manually trigger a completion from nvim-cmp.
        -- Generally you don't need this, because nvim-cmp will display
        -- completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- NOTE: Think of <c-l> as moving to the right of your snippet expansion.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        -- NOTE: <c-h> is similar, except moving you backwards.
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- NOTE: For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        -- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}

return enabled and plugin or {}