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

-- Use a protected call so we don't error out on first use
local ok, lazy = pcall(require, 'lazy')
if not ok then return end

-- Load plugins from specifications
local opts = {
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
}

-- (The leader key must be set before this)
lazy.setup({
  { import = 'plugins' },
}, opts)

-- Set other options
local colorscheme = require('helpers.colorscheme')
vim.cmd.colorscheme(colorscheme)

-- We have to set the leader key here for lazy.nvim to work
local keys = require('helpers.keys')

-- Might as well set up an easy-access keybinding
keys.map('n', '<leader>L', lazy.show, 'Lazy')
