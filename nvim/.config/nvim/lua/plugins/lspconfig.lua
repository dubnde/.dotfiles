return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        "folke/neodev.nvim",
        opts = {},
        config = function()
          require("neodev").setup()
        end
      },
      'hrsh7th/cmp-nvim-lsp',
      "ahmedkhalf/project.nvim",
      'saecki/crates.nvim',
      {
        'antosha417/nvim-lsp-file-operations',
        config = true
      },
    },
    config = function()
      local lspconfig = require 'lspconfig'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      -- Setting up on_attach
      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format { async = false }
          end, { desc = "Format buffer" })

          -- Auto format on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.lua", "*.rs" },
            -- buffer = bufnr,
            callback = function()
              -- vim.cmd [[Format]]
              vim.lsp.buf.format { async = false }
            end
          })
        end

        local function opts(desc)
          return { desc = 'LSP: ' .. desc, buffer = bufnr, noremap = true, silent = true }
        end

        local function show_documentation()
          local filetype = vim.bo.filetype
          if vim.tbl_contains({ 'vim', 'help' }, filetype) then
            vim.cmd('h ' .. vim.fn.expand('<cword>'))
          elseif vim.tbl_contains({ 'man' }, filetype) then
            vim.cmd('Man ' .. vim.fn.expand('<cword>'))
          elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
            require('crates').show_popup()
          else
            vim.lsp.buf.hover()
          end
        end

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts 'Go to declaration')
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts 'Show LSP definitions')
        vim.keymap.set('n', 'K', show_documentation, opts 'Show documentation under cursor')
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts 'Show LSP implementations')
        vim.keymap.set('n', '<space>lm', vim.lsp.buf.rename, opts 'Smart rename')
        vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, opts 'Smart rename')
        vim.keymap.set('n', '<space>la', vim.lsp.buf.code_action, opts 'See available code actions')
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts 'Show LSP references')
        vim.keymap.set('n', '<leader>ls', ':LspRestart<CR>', opts 'Restart LSP')
        vim.keymap.set('n', '<leader>lf', ':Format<CR>', opts 'Format buffer')
        vim.keymap.set('n', '<leader>l=', ':Format<CR>', opts 'Format buffer')
        vim.keymap.set('n', '<leader>==', ':Format<CR>', opts 'Format buffer')
        vim.keymap.set('n', '<space>xe', vim.diagnostic.open_float, opts 'Show line diagnostics')
        vim.keymap.set('n', '[x', vim.diagnostic.goto_prev, opts 'Go to previous diagnostic')
        vim.keymap.set('n', ']x', vim.diagnostic.goto_next, opts 'Go to next diagnostic')
        vim.keymap.set('n', '<space>xq', vim.diagnostic.setloclist, opts 'Set local list diagnostics')
      end

      -- used to enable autocompletion (assign to every lsp server config)
      -- local capabilities = cmp_nvim_lsp.default_capabilities()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      -- Setting up servers
      for _, server in pairs(require('utils').servers) do
        server = vim.split(server, '@')[1]

        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
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

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
          },
        },
      }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "rustup", "run", "stable", "rust-analyzer" },
      }
    end,
  },
}
