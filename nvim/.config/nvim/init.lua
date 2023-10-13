-- Utitilities
require('utils')

-- Default settings
require 'defaults'

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

-- Load the plugins
require('lazy').setup({
  { import = 'core' },
  { import = 'ui' },
  { import = 'mini' },
  { import = 'finder' },
  { import = 'editor' },
  { import = 'explorer' },
  { import = 'terminal' },
  { import = 'git' },
  { import = 'cmp' },
  { import = 'lsp' },
  -- { import = 'lint' },
  -- { import = 'fmt' },
  { import = 'lang' },
}, {
  checker = { enabled = false },
  change_detection = { notify = false },
  ui = { custom_keys = { false } },
})

-- Lazy keymap
vim.keymap.set('n', '<localleader>l', '<CMD>Lazy<CR>', { desc = 'Open Lazy' })
