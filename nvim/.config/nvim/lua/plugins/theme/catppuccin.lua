return   {
    'catppuccin/nvim',
    enabled = not IS_LINUX,
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
  }
