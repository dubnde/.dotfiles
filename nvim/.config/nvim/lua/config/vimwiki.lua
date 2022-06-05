local vimwiki = prequire("vimwiki")

if not vimwiki then
  return
end

vim.cmd("let g:vimwiki_list = [{'path': '~/.dofiles/', 'index.html': '~/public_dotfiles/'}]")
