return {
  {
    'simrat39/rust-tools.nvim',
    enabled = false,
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local rt = require 'rust-tools'
      local rtdap = require 'rust-tools.dap'
      local mason_registry = require 'mason-registry'

      local codelldb = mason_registry.get_package 'codelldb'
      local extension_path = codelldb:get_install_path() .. '/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

      rt.setup {
        dap = {
          adapter = rtdap.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
  },
}
