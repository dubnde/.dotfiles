return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      keys = {
        { "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" }
      }
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },

    -- Noevim Development
    { 'folke/neodev.nvim' },
    { "folke/neoconf.nvim" },
  },
  config = function()
    local keys = require('helpers.keys')

    -- Neodev setup before LSP config
    require('neodev').setup()
    require("neoconf").setup()

    local lspconfig = require('lspconfig')
    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local bufnr = event.buf
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

        local formatCallback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', formatCallback, { desc = 'Format current buffer with LSP' })

        lsp_map('gq', '<cmd>Format<cr>', bufnr, 'Format')
        lsp_map('<leader>f=', '<cmd>Format<cr>', bufnr, 'Format')

        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = { "*.lua", ".rs" },
          group = augroup,
          callback = formatCallback,
        })
      end
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local default_setup = function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
      })
    end

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { 'clangd', 'lua_ls', 'rust_analyzer' },
      handlers = { default_setup }
    })
  end
}
