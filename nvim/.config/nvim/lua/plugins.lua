-- Indicate first time installation
local packer_bootstrap = false

-- packer.nvim configuration
local conf = {
  profile = {
    enable = true,
    threshold = 1,
  },

  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Check if packer.nvim is installed
-- Run PackerCompile if there are changes in this file
local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
  end
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

-- Plugins
local function plugins(use)
  use { "wbthomason/packer.nvim" }

  -- TODO: Set it up
  use 'ethanholz/nvim-lastplace'

  -- Better surround
  use { "tpope/vim-surround", event = "InsertEnter" }
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'

  -- Performance
  use { "lewis6991/impatient.nvim" }
  use { "dstein64/vim-startuptime", cmd = "StartupTime" }
  use { "nathom/filetype.nvim" }

  -- used by lots of plugins
  use { "nvim-lua/plenary.nvim", module = "plenary" }

  use {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_better_performance = 1
      vim.cmd "colorscheme everforest"
    end,
    disable = false,
  }

  -- FZF
  use { "junegunn/fzf", run = "./install --all", event = "VimEnter", disable = false }
  use { "junegunn/fzf.vim", event = "BufEnter", disable = false }

  -- Some better syntax analysis
  use { 'nvim-treesitter/nvim-treesitter',
    event = "BufReadPre",
    run = ':TSUpdate',
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects" ,
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-context",
      "p00f/nvim-ts-rainbow",
    },
    disable = false,
  }

  -- Bootstrap Neovim
  if packer_bootstrap then
    print "Restart Neovim required after installation!"
    require("packer").sync()
  end
end

-- Init and start packer
packer_init()
local packer = require "packer"

-- Performance
pcall(require, "impatient")
-- pcall(require, "packer_compiled")

packer.init(conf)
packer.startup(plugins)

