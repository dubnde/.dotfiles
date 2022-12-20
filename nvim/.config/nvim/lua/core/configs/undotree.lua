local undotree = Prequire 'undotree'
if not undotree then
  return
end

vim.api.nvim_set_keymap('n', '<Leader>u', ':UndotreeShow<CR>', { noremap = true, silent = true })
