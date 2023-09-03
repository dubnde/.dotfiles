return {
  { 'tpope/vim-unimpaired',      event = 'VeryLazy' },
  { 'tpope/vim-surround',        event = 'VeryLazy' },
  { 'nvim-lua/plenary.nvim',     event = 'VeryLazy' },
  { "numToStr/Comment.nvim",     event = { "BufReadPre", "BufNewFile" } },
  { "stevearc/dressing.nvim",    event = "VeryLazy" },
  { "numToStr/Comment.nvim",     event = { "BufReadPre", "BufNewFile" }, config = true },
  { "NvChad/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }, config = true },
  { 'windwp/nvim-autopairs',     event = "InsertEnter",                  config = true }
}
