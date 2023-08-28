return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- Setting up on_attach
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        opts.desc = 'Go to declaration'
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        opts.desc = 'Show LSP definitions'
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        opts.desc = 'Show documentation for what is under cursor'
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        opts.desc = 'Show LSP implementations'
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        opts.desc = 'Smart rename'
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        opts.desc = 'Smart rename'
        vim.keymap.set('n', '<space>mv', vim.lsp.buf.rename, opts)
        opts.desc = 'See available code actions'
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        opts.desc = 'Show LSP references'
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        opts.desc = 'Restart LSP'
        vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary

        vim.keymap.set('n', '<space>==', function()
          vim.lsp.buf.format { async = true }
        end, opts)

        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        opts.desc = 'Show line diagnostics'
        opts.desc = 'Go to previous diagnostic'
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        opts.desc = 'Go to next diagnostic'
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
      end

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

      local signs = { Error = 'E', Warn = 'W', Hint = 'H', Info = 'I' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
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
