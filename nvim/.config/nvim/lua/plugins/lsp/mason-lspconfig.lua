return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },

  lazy = false,

  config = function()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'bashls',
        'clangd',
        'cmake',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'taplo',
        'yamlls',
      },
      automatic_installation = true,
    })
  end
}
