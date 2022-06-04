-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

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
  -- Packer can manage itself
  use { "wbthomason/packer.nvim" }

  -- Follow symlinks
  use { 'aymericbeaumet/vim-symlink' }

  -- Performance
  use { "lewis6991/impatient.nvim" }
  use { "dstein64/vim-startuptime", cmd = "StartupTime" }
  use { "nathom/filetype.nvim" }

  -- Some sane plugins
  use { "tpope/vim-surround" }
  use { "tpope/vim-commentary" }
  use { "tpope/vim-unimpaired" }
  use { "tpope/vim-repeat" }
  use { "wellle/targets.vim" }
  use { "junegunn/vim-easy-align" }

  -- These two are use all over the place
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }

  -- Indentation guides
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = get_config("indent-blankline"),
    disable = false,
  }

  if vim.fn.executable('fzf') then
    use {
      "christoomey/vim-tmux-navigator",
      config = get_config("tmux"),
    }
  end

  use {
    "ahmedkhalf/project.nvim",
    config = get_config("project"),
    disable = false,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    opt = true,
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = get_config("nvim-tree"),
    disable = false,
  }

  use {
    event = "BufReadPre",
    "rcarriga/nvim-notify",
    config = get_config("nvim-notify"),
    disable = false,
  }

  if vim.fn.executable('fzf') then
    use {
      'junegunn/fzf.vim',
      requires = { 'junegunn/fzf' },
    }
  else
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = {
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-telescope/telescope-project.nvim' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
      },
      config = get_config("telescope"),
    }
  end


  use {
    "EdenEast/nightfox.nvim",
    "folke/tokyonight.nvim",
    config = get_config("colourscheme"),
    disable = false,
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    event = "VimEnter",
    disable = false,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    require = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "nvim-treesitter/nvim-treesitter-context" },
      { "p00f/nvim-ts-rainbow" },
    },
    config = get_config("treesitter"),
    disable = false,
  }

  use {
    "phaazon/hop.nvim",
    config = get_config("hop"),
    disable = false,
  }

  use {
    "williamboman/nvim-lsp-installer",
    requires = {
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
    },
    after = "nvim-cmp",
    config = get_config("lsp"),
    disable = false,
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
    },
    disable = false,
  }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = get_config("autopairs"),
    disable = false,
  }

  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = get_config("neogit"),
    disable = false,
  }

  use {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = get_config("gitsigns"),
    disable = false,
  }

  -- WhichKey
  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = get_config("which-key"),
    disable = false,
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim", tag = 'v1.*',
    config = get_config("toggleterm"),
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
