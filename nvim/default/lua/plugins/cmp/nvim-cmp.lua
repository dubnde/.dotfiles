return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },

    -- For luasnip users.
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Useful snippets
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    -- load VSCode-like snippets from plugins (e.g., friendly-snippets)
    require("luasnip/loaders/from_vscode").lazy_load()

    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<C-k>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function()
          if cmp.visible() then cmp.select_next_item() end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then cmp.select_prev_item() end
        end, { "i", "s" }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),                      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP
        { name = "luasnip" },  -- snippets
        { name = "buffer" },   -- text within the current buffer
        { name = "path" },     -- file system paths
        { name = 'cmdline' }
      }),
    })
  end

}
