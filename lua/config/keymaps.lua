-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>s', '<cmd>w<CR>', { desc = '[S]ave current file' })
vim.keymap.set('n', '<leader>x', '<cmd>xa<CR>', { desc = '[X] Save and close Neovim' })
