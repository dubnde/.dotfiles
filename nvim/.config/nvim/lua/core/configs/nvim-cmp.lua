local cmp = Prequire 'cmp'
if not cmp then
  return
end

local luasnip = Prequire 'luasnip'
if not luasnip then
  return
end

-- import lspkind plugin safely
local lspkind = Prequire 'lspkind'
if not lspkind then
  return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require('luasnip/loaders/from_vscode').lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- Setup keyboard mappings
  mapping = cmp.mapping.preset.insert {
    ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
    ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
    ['<C-e>'] = cmp.mapping.abort(), -- close completion window
    ['<CR>'] = cmp.mapping.confirm { select = false },
  },

  -- sources for autocompletion
  sources = cmp.config.sources {
    { name = 'path' }, -- file system paths
    { name = 'nvim_lsp', keyword_length = 2 }, -- lsp
    { name = 'buffer', keyword_length = 2 }, -- text within current buffer
    { name = 'luasnip', keyword_length = 2 }, -- snippets
  },

  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format {
      maxwidth = 50,
      ellipsis_char = '...',
    },
  },
}
