local nvim_tree = Prequire 'nvim-tree'
if not nvim_tree then
  return
end

nvim_tree.setup {
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}
local opts = { silent = true }

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>', opts)
