--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- Utitilities
require('utils')

-- Default settings
require 'defaults'

-- Load the plugins
require('lazy').setup({
  { import = 'plugins' },
}, {
  checker = { enabled = true },
  change_detection = { notify = false },
  git = { log = { '--since=3 days ago' } },
  ui = { custom_keys = { false } },
})

-- Lazy keymap
vim.keymap.set('n', '<localleader>l', '<CMD>Lazy<CR>', { desc = 'Open Lazy' })
