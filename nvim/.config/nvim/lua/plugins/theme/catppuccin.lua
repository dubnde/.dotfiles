return {
  'catppuccin/nvim',
  enabled = not IS_LINUX,
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  opts = {
    flavour = 'macchiato', -- latte, frappe, macchiato, mocha
    background = { dark = 'macchiato' },
    integrations = {
      cmp = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      mason = true,
      mini = true,
      -- native_lsp = {
      --   enabled = true,
      --   underlines = {
      --     errors = { "undercurl" },
      --     hints = { "undercurl" },
      --     warnings = { "undercurl" },
      --     information = { "undercurl" },
      --   },
      -- },
      neotree = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  config = function()
    vim.cmd.colorscheme 'catppuccin-macchiato'
  end,
}
