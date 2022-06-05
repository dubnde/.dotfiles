local fzf = prequire("fzf-lua")

if not fzf then
  return
end

fzf.setup({})

-- vim.env.FD_OPTIONS = "--follow --hidden --exclude .git --exclude --exclude node_modules --color=always"
-- vim.env.FZF_DEFAULT_OPTS = "--ansi"
-- vim.env.FZF_DEFAULT_COMMAND = "git ls-files --cached --others --exclude-standard | fd --type f --type 1 $FD_OPTIONS"
-- vim.env.FZF_CTRL_T_COMMAND = "fd $FD_OPTIONS"
-- vim.env.FZF_ALT_C_COMMAND = "fd --type d $FD_OPTIONS"

keymap("n", "<C-p>", "<cmd>Fzf files<cr>")
