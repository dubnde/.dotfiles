local toggleterm = Prequire 'toggleterm'
if not toggleterm then
  return
end

toggleterm.setup {
  size = 15,
  -- open_mapping = [[<c-\>]],
  open_mapping = [[<c-'>]],
  hide_numbers = true,
  autochdir = true,
  -- shade_terminals = true,
  -- shading_factor = 2,
  -- start_in_insert = true,
  -- insert_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  -- direction = 'float',
  -- close_on_exit = true,
  -- shell = vim.o.shell,
  -- float_bufopts = {
  --   border = 'curved',
  -- },
}

---@diagnostic disable-next-line: duplicate-set-field
function _G.set_terminal_keymaps()
  local bufopts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], bufopts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], bufopts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], bufopts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], bufopts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], bufopts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], bufopts)
end

vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
