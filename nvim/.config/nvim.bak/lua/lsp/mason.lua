return {
  {
    'williamboman/mason.nvim',
    config = function()
      -- import mason
      local mason = require 'mason'

      -- enable mason and configure icons
      mason.setup {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      }
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      -- import mason-lspconfig
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        -- list of servers for mason to install
        ensure_installed = require('utils').servers,

        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
      }
    end,
  }
}
