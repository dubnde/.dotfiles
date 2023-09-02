return {
  'mhartington/formatter.nvim',
  keys = {
    { '<leader>==', '<cmd>Format<CR>', desc = 'Format' },
  },
  config = function()
    -- Utilities for creating configurations
    local util = require 'formatter.util'

    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require('formatter').setup {
      filetype = {
        lua = {
          require('formatter.filetypes.lua').stylua,
        },

        rust = {
          require('formatter.filetypes.rust').rustfmt,
        },

        ['*'] = {
          -- Defaults
          require('formatter.filetypes.any').remove_trailing_whitespace,
        },
      },
    }
  end,
}
