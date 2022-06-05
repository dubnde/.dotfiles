local fzf = prequire("fzf-lua")

if not fzf then
  return
end

fzf.setup({})

keymap("n", "<C-p>", "<cmd>Fzf files<cr>")
