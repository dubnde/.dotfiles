-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("helpers.utils")

-- Use a protected call so we don't error out on first use
local lazy = prequire('lazy')
if not lazy then
  return
end

-- Load plugins from specifications
local opts = {
  install = {
    colorscheme = { "catppuccin" },
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrw',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- get a notification when changes are found
  },
}

local plugins = {
  { import = 'plugins.core' },
  { import = 'plugins.themes' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.git' },
  { import = 'plugins.tmux' },
  { import = 'plugins.finder' },
  { import = 'plugins.explorer' },
  { import = 'plugins.cmp' },
  { import = 'plugins.lsp' },
  { import = 'plugins.lang' },
  { import = 'plugins.terminal' },
}

lazy.setup(plugins, opts)

local colorscheme = prequire('helpers.colorscheme')
if colorscheme then
  vim.cmd.colorscheme(colorscheme)
end

local keys = prequire('helpers.keys')
if keys then
  keys.map('n', '<leader>L', lazy.show, 'Lazy')
end
