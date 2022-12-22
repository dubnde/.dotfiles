local indent = Prequire 'indent_blankline'

if not indent then
  return
end

vim.opt.list = true
vim.opt.listchars:append 'space:⋅'
vim.opt.listchars:append 'eol:↴'

indent.setup {
  char = '▏',
  show_end_of_line = true,
  use_treesitter = true,
  space_char_blankline = ' ',
  -- show_current_context = true,
  -- show_current_context_start = true,
}
