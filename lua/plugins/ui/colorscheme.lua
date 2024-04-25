---@diagnostic disable: unused-local
-- NOTE: Colorschemes
-- Use `:Telescope colorscheme` to see what colorschemes are already installed.

local tokyonight = {
  'folke/tokyonight.nvim',
  priority = 1000,
  -- init = function()
  --   vim.cmd.colorscheme 'tokyonight-night'
  --   vim.cmd.hi 'Comment gui=none'
  -- end,
  opts = {
    transparent = true,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
  },
}

local rose_pine = {
  'rose-pine/neovim',
  priority = 1000,
  -- init = function()
  --   vim.cmd.colorscheme 'rose-pine'
  -- end,
  name = 'rose-pine',
  opts = {
    styles = {
      transparency = true,
    },
  },
}

local catppuccin = {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
  opts = {
    custom_highlights = function(colors)
      return {
        LineNr = { fg = colors.subtext0 },
      }
    end,
    transparent_background = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = false,
      telescope = {
        enabled = true,
      },
      indent_blankline = {
        enabled = true,
        scope_color = 'lavender',
        colored_indent_levels = false,
      },
      harpoon = true,
    },
  },
}

return { tokyonight, rose_pine, catppuccin }
