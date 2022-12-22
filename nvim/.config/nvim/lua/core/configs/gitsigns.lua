local gitsigns = Prequire 'gitsigns'
if not gitsigns then
  return
end

-- configure/enable gitsigns
gitsigns.setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}
