return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    {'Saecki/crates.nvim', event = { 'BufRead Cargo.toml' },},
  },
  event = 'InsertEnter',
  config = function()
    -- Using protected call
    local cmp_ok, cmp = pcall(require, 'cmp')
    if not cmp_ok then
      return
    end
    local luasnip_ok, luasnip = pcall(require, 'luasnip')
    if not luasnip_ok then
      return
    end

    ---@diagnostic disable-next-line: missing-fields
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
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
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'crates' },
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
    }
  end,
}
