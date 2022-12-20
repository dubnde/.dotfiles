local rooter = Prequire 'nvim-rooter'

if not rooter then
  return
end

rooter.setup {
  rooter_patterns = { '.git', '.hg', '.svn' },
  trigger_patterns = { '*' },
  manual = false,
}
