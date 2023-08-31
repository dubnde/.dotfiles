return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
      local lspconfig = require 'lspconfig'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'

      -- Setting up on_attach
      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, {})

        bufmapn('gD', vim.lsp.buf.declaration, 'Go to declaration', bufnr)
        bufmapn('gd', vim.lsp.buf.definition, 'Show LSP definitions', bufnr)
        bufmapn('K', vim.lsp.buf.hover, 'Show documentation for what is under cursor', bufnr)
        bufmapn('gi', vim.lsp.buf.implementation, 'Show LSP implementations', bufnr)
        bufmapn('<space>lm', vim.lsp.buf.rename, 'Smart rename', bufnr)
        bufmapn('<space>lr', vim.lsp.buf.rename, 'Smart rename', bufnr)
        bufmapn('<space>la', vim.lsp.buf.code_action, 'See available code actions', bufnr)
        bufmapn('gr', vim.lsp.buf.references, 'Show LSP references', bufnr)
        bufmapn('<leader>ls', ':LspRestart<CR>', 'Restart LSP', bufnr)
        bufmapn('<leader>lf', ':Format<CR>', 'Format', bufnr)
        bufmapn('<leader>l=', ':Format<CR>', 'Format', bufnr)
        bufmapn('<leader>==', ':Format<CR>', 'Format', bufnr)
        bufmapn('<space>xe', vim.diagnostic.open_float, 'Show line diagnostics', bufnr)
        bufmapn('[x', vim.diagnostic.goto_prev, 'Go to previous diagnostic', bufnr)
        bufmapn(']x', vim.diagnostic.goto_next, 'Go to next diagnostic', bufnr)
        bufmapn('<space>xq', vim.diagnostic.setloclist, 'Set local list diagnostics', bufnr)
      end

      -- Setting up capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Setting up servers
      for _, server in pairs(require('utils').servers) do
        local Opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        server = vim.split(server, '@')[1]

        lspconfig[server].setup(Opts)
      end

      -- Setting up border for LspInfo
      require('lspconfig.ui.windows').default_options.border = 'rounded'

      local signs = {
        Error = 'E',
        Warn = 'W',
        Hint = 'H',
        Info = 'I',
      }

      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      vim.diagnostic.config {
        virtual_text = true,
        signs = { active = signs },
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
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            completion = { callSnippet = 'Replace' },
          },
        },
      }

      -- lspconfig.rust_analyzer.setup {
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   settings = {
      --     ['rust-analyzer'] = {
      --       cargo = { allFeatures = true, loadOutDirsFromCheck = true, runBuildScripts = true },
      --       checkOnSave = {
      --         allFeatures = true,
      --         command = 'clippy',
      --         extraArgs = { '--no-deps' },
      --       },
      --       procMacro = {
      --         enable = true,
      --         ignored = {
      --           ['async-trait'] = { 'async_trait' },
      --           ['napi-derive'] = { 'napi' },
      --           ['async-recursion'] = { 'async_recursion' },
      --         },
      --       },
      --     },
      --   },
      -- }
    end,
  },
}
