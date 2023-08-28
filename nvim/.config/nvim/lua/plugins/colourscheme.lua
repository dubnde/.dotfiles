return {
  {
    'catppuccin/nvim',
    -- enabled = false,
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato', -- latte, frappe, macchiato, mocha
        background = { dark = 'macchiato' },
        integrations = {
          cmp = true,
          flash = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
        },
      }
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
  {
    'bluz71/vim-nightfly-guicolors',
    enabled = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd [[colorscheme nightfly]]
    end,
  },
}
