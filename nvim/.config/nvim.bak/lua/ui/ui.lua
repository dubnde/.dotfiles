return {
  -- rainbow brackets
  { 'HiPhish/rainbow-delimiters.nvim' },

  -- catppuccin
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

  -- nvim-origami
  {
    'chrisgrieser/nvim-origami',
    event = { 'BufReadPost', 'BufNewFile' },
    config = true
  },

}
