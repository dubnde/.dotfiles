return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'folke/neodev.nvim', opts = {} },
    },
    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
      local lsp_ok, lspconfig = pcall(require, 'lspconfig')
      if not lsp_ok then
        return
      end

      local cmp_nvim_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
      if not cmp_nvim_ok then
        return
      end

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
        bufmapn('<leader>==', ':Format<CR>', 'Format', bufnr)

        -- use trouble.nvim for diganostics
        -- bufmapn('<space>dd', vim.diagnostic.open_float, 'Show line diagnostics', bufnr)
        -- bufmapn('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic', bufnr)
        -- bufmapn(']d', vim.diagnostic.goto_next, 'Go to next diagnostic', bufnr)
        -- bufmapn('<space>dq', vim.diagnostic.setloclist, 'Set local list diagnostics', bufnr)
      end

      -- Setting up capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

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
          },
        },
      }
    end,
  },
}
