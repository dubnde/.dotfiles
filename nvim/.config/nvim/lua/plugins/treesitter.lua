return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      -- Treesitter folding
      -- vim.wo.foldmethod = 'expr'
      -- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

      local treesitter_config = require 'nvim-treesitter.configs'

      ---@diagnostic disable-next-line: missing-fields
      treesitter_config.setup {
        ensure_installed = require('utils').parsers,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autopairs = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      -- Using protected call
      local treesitter_config = require 'nvim-treesitter.configs'

      ---@diagnostic disable-next-line: missing-fields
      treesitter_config.setup {
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
