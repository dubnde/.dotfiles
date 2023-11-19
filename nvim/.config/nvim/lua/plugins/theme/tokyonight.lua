return {
  "folke/tokyonight.nvim",
  enabled = not IS_LINUX,
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark", -- style for sidebars, see below
      floats = "dark",   -- style for floating windows
    },

  },
  config = function()
    vim.cmd.colorscheme 'tokyonight'
  end,
}
