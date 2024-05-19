local M = {}

-- NOTE: Language servers
M.servers = {
  lua_ls = require 'config.lsp.lua',
  tsserver = require 'config.lsp.typescript',
  tailwindcss = {},
  cssls = require 'config.lsp.css',
}

-- NOTE: Additional linters
M.linters = {
  'eslint_d',
  'markdownlint',
  'jsonlint',
}

-- NOTE: Additional formatters
M.formatters = {
  'prettierd',
  'stylua',
  'clang-format',
}

return M
