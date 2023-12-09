return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = false,
  branch = "v3.x",
  keys = {
    { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  config = function()
    require("neo-tree").setup()
  end,
}
