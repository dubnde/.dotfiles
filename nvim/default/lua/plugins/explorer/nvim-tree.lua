return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { "<leader>e'", "<cmd>NvimTreeFocus<cr>", desc = "NvimTreeFocus" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "NvimTreeCollapse" },
    { "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle" },
    { "<leader>et", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle" },
    { "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTreeFindFile" },
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
}
