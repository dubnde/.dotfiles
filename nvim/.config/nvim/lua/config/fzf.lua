local fzf = prequire("fzf")

if not fzf then
  return
end

if vim.fn.executable('fdfind') then
  local fd_opts = 'fdfind --type f --ignore-case --follow --color=always'

  vim.env.FZF_DEFAULT_COMMAND = fd_opts
else vim.fn.executable('fd')
  local fd_opts = 'fd --type f --ignore-case --follow --color=always'

  vim.env.FZF_DEFAULT_COMMAND = fd_opts
end
