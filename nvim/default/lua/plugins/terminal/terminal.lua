return {
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = {
    { "<leader>''", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
    { "<leader>'t", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
  },
  opts = {
    autochdir = true,
    direction = 'float',
  },
}
