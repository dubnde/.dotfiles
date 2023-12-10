return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { "<leader>e'", "<cmd>NvimTreeFocus<cr>",    desc = "NvimTreeFocus" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "NvimTreeCollapse" },
    { "<leader>ee", "<cmd>NvimTreeToggle<cr>",   desc = "NvimTreeToggle" },
    { "<leader>et", "<cmd>NvimTreeToggle<cr>",   desc = "NvimTreeToggle" },
    { "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTreeFindFile" },
  },
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      side = "right",
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      git_ignored = true,
      dotfiles = true,
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false
        },
      }
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end
}
