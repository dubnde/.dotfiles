return {
  { "nvim-lua/plenary.nvim",           lazy = false },
  { 'HiPhish/rainbow-delimiters.nvim', lazy = false },
  { 'aymericbeaumet/vim-symlink',      lazy = false },
  { 'nvim-tree/nvim-web-devicons',     lazy = false },
  { 'mg979/vim-visual-multi',          lazy = false },
  { 'christoomey/vim-tmux-navigator',  lazy = false },
  { 'nvim-lua/plenary.nvim',           lazy = false },
  { 'tpope/vim-unimpaired',            event = 'VeryLazy' },
  { 'tpope/vim-surround',              event = 'VeryLazy' },
  { "numToStr/Comment.nvim",           event = { "BufReadPre", "BufNewFile" }, config = true },
  { "NvChad/nvim-colorizer.lua",       event = { "BufReadPre", "BufNewFile" }, config = true },
  { 'windwp/nvim-autopairs',           event = "InsertEnter",                  config = true },
}
