return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'folke/neodev.nvim' },
  },
  config = function()
    -- Neodev setup before LSP config
    require('neodev').setup()

    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })

      local keys = require('helpers.keys')

      -- Quick access via keymap
      keys.map('n', '<leader>mm', '<cmd>Mason<cr>', 'Mason')

      local lsp_map = keys.lsp_map
      local telescope_builtin = require('telescope.builtin')

      lsp_map('<leader>lr', vim.lsp.buf.rename, bufnr, 'Rename symbol')
      lsp_map('<leader>la', vim.lsp.buf.code_action, bufnr, 'Code action')
      lsp_map('<leader>ca', vim.lsp.buf.code_action, bufnr, 'Code action')
      lsp_map('<leader>ld', vim.lsp.buf.type_definition, bufnr, 'Type definition')
      lsp_map('<leader>ls', telescope_builtin.lsp_document_symbols, bufnr, 'Document symbols')

      lsp_map('gd', vim.lsp.buf.definition, bufnr, 'Goto Definition')
      lsp_map('gr', telescope_builtin.lsp_references, bufnr, 'Goto References')
      lsp_map('gI', vim.lsp.buf.implementation, bufnr, 'Goto Implementation')
      lsp_map('K', vim.lsp.buf.hover, bufnr, 'Hover Documentation')
      lsp_map('gD', vim.lsp.buf.declaration, bufnr, 'Goto Declaration')

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
      ensure_installed = { 'clangd', 'lua_ls', 'rust_analyzer' },
      handlers = {
        lsp_zero.default_setup,
      }
    })
  end
}
