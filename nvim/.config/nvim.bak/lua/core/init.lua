return {
  { 'aymericbeaumet/vim-symlink' },
  { 'nvim-tree/nvim-web-devicons' }, -- optional, for file icons
  { 'mg979/vim-visual-multi',     version = '*' },
  { 'tpope/vim-unimpaired',       event = 'VeryLazy' },
  { 'tpope/vim-surround',         event = 'VeryLazy' },
  { 'nvim-lua/plenary.nvim',      event = 'VeryLazy' },
  { "numToStr/Comment.nvim",      event = { "BufReadPre", "BufNewFile" }, config = true },
  { "NvChad/nvim-colorizer.lua",  event = { "BufReadPre", "BufNewFile" }, config = true },
  { 'windwp/nvim-autopairs',      event = "InsertEnter",                  config = true },
  { 'christoomey/vim-tmux-navigator' }
}
