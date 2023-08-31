return {
  'jay-babu/mason-null-ls.nvim',
  event = 'BufReadPre',
  opts = {
    automatic_setup = true,
    ensure_installed = require('utils').linters,
    automatic_installation = true,
  },
  dependencies = {
    {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = 'nvim-lua/plenary.nvim',
      config = function()
        local null_ls = require 'null-ls'

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        -- Setting up null ls
        null_ls.setup {
          border = 'rounded',
          debug = false,
          sources = {
            formatting.prettier.with {
              extra_filetypes = { 'toml' },
              extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
            },
            formatting.clang_format,
            formatting.stylua,
            formatting.shfmt,
            formatting.black.with { extra_args = { '--fast' } },
            diagnostics.flake8,
          },
        }
      end,
    },
  },
}
