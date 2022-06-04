local cmd = vim.cmd

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- show cursor line only in active window
cmd [[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]]

-- go to last loc when opening a buffer
cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]]

-- don't auto comment new line
cmd [[autocmd BufEnter * set formatoptions-=cro]]


-- WSL yank support
-- cmd [[
--   let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
--   if executable(s:clip)
--     augroup WSLYank
--       autocmd!
--       autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
--     augroup END
--   endif
-- ]]
