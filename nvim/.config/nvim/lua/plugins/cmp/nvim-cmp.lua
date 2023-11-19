return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- autocompletion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    -- snippets
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    {
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      opts = { src = { cmp = { enabled = true } } },
    },
  },

  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    require("luasnip/loaders/from_vscode").lazy_load()

    cmp.setup({
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),   -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(),   -- next suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(),   -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(),   -- next suggestion
        ["<S-TAB>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<TAB>"] = cmp.mapping.select_next_item(),   -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = false,
        }),
      },
      -- sources for autocompletion
      sources = {
        { name = "nvim_lsp" }, -- LSP
        { name = "luasnip" },  -- snippets
        { name = "buffer" },   -- text within the current buffer
        { name = "path" },     -- file system paths
        { name = "create" },   -- Rust crates
      },
    })
  end

}
