local status_ok, _ = pcall(vim.cmd, 'colorscheme gruvbox')
if not status_ok then
  print 'Colorscheme not found!' -- print error if colorscheme not installed
  return
end
