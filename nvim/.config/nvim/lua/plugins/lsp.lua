return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    event = 'BufReadPre',
    config = function()
      -- Using protected call
      local lsp_ok, lspconfig = pcall(require, 'lspconfig')
      if not lsp_ok then
        return
      end
      local cmp_nvim_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
      if not cmp_nvim_ok then
        return
      end
      -- Setting up capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Setting up on_attach
      local on_attach = function(client, bufnr)
        local opts = { silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>mv', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>==', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end

      -- Setting up servers
      for _, server in pairs(require('utils').servers) do
        Opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        server = vim.split(server, '@')[1]

        local require_ok, conf_opts = pcall(require, 'settings.' .. server)
        if require_ok then
          Opts = vim.tbl_deep_extend('force', conf_opts, Opts)
        end

        lspconfig[server].setup(Opts)
      end

      -- Setting up border for LspInfo
      require('lspconfig.ui.windows').default_options.border = 'rounded'

      -- Setting up icons for diagnostics
      local signs = {
        { name = 'DiagnosticSignError', text = '' },
        { name = 'DiagnosticSignWarn', text = '' },
        { name = 'DiagnosticSignHint', text = '' },
        { name = 'DiagnosticSignInfo', text = '󰋽' },
      }
      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
      end

      vim.diagnostic.config {
        virtual_text = true,
        signs = {
          active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = 'minimal',
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
          suffix = '',
        },
      }

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
      })

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
      })
      -- Setting up lua server
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = {
                [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                [vim.fn.stdpath 'config' .. '/lua'] = true,
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }
    end,
  },
}
