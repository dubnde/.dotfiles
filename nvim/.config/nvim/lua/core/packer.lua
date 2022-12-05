local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- lua functions that many plugins use
  use { 'nvim-lua/plenary.nvim' }

  -- Essentials
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-surround' }
  use { 'ggandor/leap.nvim' }
  use { 'vim-scripts/ReplaceWithRegister' }

  use { 'ellisonleao/gruvbox.nvim' }

  -- vs-code like icons
  use { 'nvim-tree/nvim-web-devicons' }

  -- file explorer
  use { 'nvim-tree/nvim-tree.lua' }

  -- statusline
  use { 'nvim-lualine/lualine.nvim' }

  -- treesitter configuration
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update { with_sync = true }
    end,
  }

  -- fuzzy finding w/ telescope
  -- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }

  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- auto closing
  use { 'windwp/nvim-autopairs' } -- autoclose parens, brackets, quotes, etc...
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' } -- autoclose tags

  -- autocompletion
  use 'hrsh7th/nvim-cmp' -- completion plugin
  use 'hrsh7th/cmp-buffer' -- source for text in buffer
  use 'hrsh7th/cmp-path' -- source for file system paths

  -- snippets
  use 'L3MON4D3/LuaSnip' -- snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- for autocompletion
  use 'rafamadriz/friendly-snippets' -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use 'williamboman/mason.nvim' -- in charge of managing lsp servers, linters & formatters
  use 'williamboman/mason-lspconfig.nvim' -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use 'neovim/nvim-lspconfig' -- easily configure language servers
  use 'hrsh7th/cmp-nvim-lsp' -- for autocompletion
  use { 'glepnir/lspsaga.nvim', branch = 'main' } -- enhanced lsp UIs
  -- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use 'onsails/lspkind.nvim' -- vs-code like icons for autocompletion

  -- formatting & linting
  use 'jose-elias-alvarez/null-ls.nvim' -- configure formatters & linters
  use 'jayp0521/mason-null-ls.nvim' -- bridges gap b/w mason & null-ls

  -- git integration
  use { 'lewis6991/gitsigns.nvim' } -- show line modifications on left hand side

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
