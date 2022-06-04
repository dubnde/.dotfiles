local pounce = prequire("pounce")

if not pounce then
  return
end

pounce.setup({
  accept_keys = "NTESIROAGJKDFVBYMCXWPQZ",
  accept_best_key = "<enter>",
  multi_window = true,
  debug = false,
})

--- plugins
keymap("n", "s",  "<cmd>Pounce<CR>")
keymap("n", "S",  "<cmd>PounceRepeat<CR>")
keymap("v", "s",  "<cmd>Pounce<CR>")
keymap("o", "gs", "<cmd>Pounce<CR>") -- 's' is used by vim-surround
