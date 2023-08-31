return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      local treesitter_config = require 'nvim-treesitter.configs'

      ---@diagnostic disable-next-line: missing-fields
      treesitter_config.setup {
        ensure_installed = require('utils').parsers,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autopairs = { enable = true },
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
