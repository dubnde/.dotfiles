return {
  'catppuccin/nvim',
  enabled = not IS_LINUX,
  name = 'catppuccin',
  lazy = false,
  priority = 999,
  opts = {
    flavour = 'macchiato', -- latte, frappe, macchiato, mocha
    background = { dark = 'macchiato' },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      cmp = true,
      flash = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      mason = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      neogit = true,
      vimtree = true,
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
