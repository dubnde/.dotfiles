local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "catppuccin-macchiato" },
  },
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrw",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- get a notification when changes are found
  },
}

local lazy = require("lazy")

lazy.setup({
  { import = "plugins.core" },
  { import = "plugins.theme" },
  { import = "plugins.editor" },
  { import = "plugins.git" },
  { import = "plugins.mini" },
  { import = "plugins.treesitter" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
}, opts)
