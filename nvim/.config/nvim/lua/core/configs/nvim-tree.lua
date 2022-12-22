local nvim_tree = Prequire 'nvim-tree'
if not nvim_tree then
  return
end

nvim_tree.setup {
  sync_root_with_cwd = true,
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  -- filters = {
  --   dotfiles = true,
  -- },
}
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>', opts)
