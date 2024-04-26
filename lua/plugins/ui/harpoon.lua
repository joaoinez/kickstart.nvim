-- NOTE: Mark buffers and cycle through them
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'H[A]rpoon file' })
    vim.keymap.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open [H]arpoon' })

    vim.keymap.set('n', '<M-u>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<M-i>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<M-o>', function()
      harpoon:list():select(3)
    end)

    vim.keymap.set('n', '<S-Tab>', function()
      harpoon:list():prev()
    end, { desc = 'Prev buffer' })
    vim.keymap.set('n', '<Tab>', function()
      harpoon:list():next()
    end, { desc = 'Next buffer' })
  end,
}