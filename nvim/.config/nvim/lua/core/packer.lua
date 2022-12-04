local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
  use { "nvim-lua/plenary.nvim" } 

  -- Essentials
  use { 'tpope/vim-unimpaired' }

  use { 'tpope/vim-surround' }
  use { 'vim-scripts/ReplaceWithRegister' }

  use { 'tpope/vim-commentary' }

  use { 'ellisonleao/gruvbox.nvim' }

  -- vs-code like icons
  use { 'nvim-tree/nvim-web-devicons' }

  -- file explorer
  use { 'nvim-tree/nvim-tree.lua' }

  -- statusline
  use { 'nvim-lualine/lualine.nvim' }

  -- treesitter configuration
  use { 'nvim-treesitter/nvim-treesitter' }

  -- fuzzy finding w/ telescope
  -- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use { 'nvim-telescope/telescope.nvim', branch = "0.1.x" } 

  use { 'akinsho/toggleterm.nvim', tag = '*' }

  use { "windwp/nvim-autopairs" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
