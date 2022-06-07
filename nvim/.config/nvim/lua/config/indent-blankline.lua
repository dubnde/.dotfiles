local indent = prequire("indent-blankline")

if not indent then
  return
end

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

vim.g.indent_blankline_char_list = { '|', '¦', '┆', '┊' }
vim.g.indent_blankline_char_list_blankline = { '|', '¦', '┆', '┊' }
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_show_trailinvim.g_blankline_indent = false

indent.setup({
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
})
