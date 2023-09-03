return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',           -- text in buffer
    'hrsh7th/cmp-path',             -- file system paths
    'L3MON4D3/LuaSnip',             -- snippet engine
    'saadparwaiz1/cmp_luasnip',     -- autocompletion
    'rafamadriz/friendly-snippets', -- snippets
    'saecki/crates.nvim',           -- Rust crates
  },

  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    ---@diagnostic disable-next-line: missing-fields
    cmp.setup {

      ---@diagnostic disable-next-line: missing-fields
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },

      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'LSP',
            nvim_lua = 'LUA',
            luasnip = 'SNIP',
            buffer = 'BUF',
            path = 'PATH',
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-k>'] = cmp.mapping.select_prev_item(),       -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(),       -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),          --
        ['<C-f>'] = cmp.mapping.scroll_docs(4),           --
        ['<C-Space>'] = cmp.mapping.complete(),           -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),                  -- close completion window
        ['<CR>'] = cmp.mapping.confirm { select = true }, --

        -- Tab mapping
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end
      },

      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = "crates" },
      },
    }
  end,
}
