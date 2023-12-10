return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    {
      'williamboman/mason.nvim',
      keys = {
        { "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" },
      },
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'L3MON4D3/LuaSnip' },

    -- Useful completion sources:
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/nvim-cmp' },

    -- Noevim Development
    { 'folke/neodev.nvim' },
    { "folke/neoconf.nvim" },
  },
  config = function()
    local keys = require('helpers.keys')

    -- Neodev setup before LSP config
    require('neodev').setup()
    require("neoconf").setup()

    local lsp_zero = require('lsp-zero')

    ---@diagnostic disable-next-line: unused-local
    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })

      local lsp_map = keys.lsp_map

      lsp_map('<leader>lr', vim.lsp.buf.rename, bufnr, 'Rename symbol')
      lsp_map('<leader>la', vim.lsp.buf.code_action, bufnr, 'Code action')
      lsp_map('<leader>ca', vim.lsp.buf.code_action, bufnr, 'Code action')
      lsp_map('<leader>ld', vim.lsp.buf.type_definition, bufnr, 'Type definition')
      lsp_map('<leader>ls', vim.lsp.buf.signature_help, bufnr, 'Signature help')
      lsp_map('<leader>lD', vim.lsp.buf.document_symbol, bufnr, 'Document symbol')
      lsp_map('<leader>lb', vim.lsp.buf.completion, bufnr, 'Buffer completion')
      lsp_map('gd', vim.lsp.buf.definition, bufnr, 'Goto Definition')
      lsp_map('gD', vim.lsp.buf.declaration, bufnr, 'Goto Declaration')
      lsp_map('gI', vim.lsp.buf.implementation, bufnr, 'Goto Implementation')
      lsp_map('gr', vim.lsp.buf.references, bufnr, 'Goto References')
      lsp_map('K', vim.lsp.buf.hover, bufnr, 'Hover Documentation')
      lsp_map('gl', vim.diagnostic.open_float, bufnr, 'Show diagnostic')
      lsp_map('[d', vim.diagnostic.goto_prev, bufnr, 'Previous diagnostic')
      lsp_map(']d', vim.diagnostic.goto_next, bufnr, 'Next diagnostic')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      lsp_map('gq', '<cmd>Format<cr>', bufnr, 'Format')
      lsp_map('<leader>f=', '<cmd>Format<cr>', bufnr, 'Format')
    end)

    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
      }
    })

    -- see :help lsp-zero-guide:integrate-with-mason-nvim
    -- to learn how to use mason.nvim with lsp-zero
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'clangd',
        'lua_ls',
        'rust_analyzer'
      },
      handlers = {
        lsp_zero.default_setup,
      }
    })
  end
}
