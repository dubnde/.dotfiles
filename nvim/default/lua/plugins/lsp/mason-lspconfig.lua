return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },

  lazy = false,

  opts = {
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
  },
}
