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
    { 'L3MON4D3/LuaSnip' },

    -- Useful completion sources:
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },

    -- For vsnip users.
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },

    -- For luasnip users.
    -- { 'L3MON4D3/LuaSnip' },
    -- { 'saadparwaiz1/cmp_luasnip' },

    -- For ultisnips users.
    -- { 'SirVer/ultisnips' },
    -- { 'quangnguyen30192/cmp-nvim-ultisnips' },

    -- For snippy users.
    -- { 'dcampos/nvim-snippy' },
    -- { 'dcampos/cmp-snippy' },

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
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

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

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })

        lsp_map('gq', '<cmd>Format<cr>', bufnr, 'Format')
        lsp_map('<leader>f=', '<cmd>Format<cr>', bufnr, 'Format')
      end
    })

    local default_setup = function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
      })
    end

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'clangd',
        'lua_ls',
        'rust_analyzer'
      },
      handlers = { default_setup }
    })

    require('luasnip.loaders.from_vscode').lazy_load()

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      }),
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      }),
      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
    })
  end
}
