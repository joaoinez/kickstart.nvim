-- NOTE: Show pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    -- NOTE: Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader>G'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]oto', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      ['<leader>,'] = { name = '[,] Settings', _ = 'which_key_ignore' },
      ['<leader>,l'] = { name = '[,] Settings: [L]azy', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]ist', _ = 'which_key_ignore' },
      ['<leader>C'] = { name = '[C]hatGPT', _ = 'which_key_ignore' },
      ['<leader>q'] = { name = '[Q]uickfix', _ = 'which_key_ignore' },
    }

    -- NOTE: Visual mode
    require('which-key').register({
      ['<leader>G'] = { '[G]it' },
    }, { mode = 'v' })
  end,
}
