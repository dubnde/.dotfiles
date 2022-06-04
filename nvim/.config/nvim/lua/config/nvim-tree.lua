local tree = prequire("nvim-tree")

if not tree then
  return
end

tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    number = true,
    relativenumber = true,
  },
  filters = {
    custom = { ".git" },
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
}

vim.g.nvim_tree_respect_buf_cwd = 1
