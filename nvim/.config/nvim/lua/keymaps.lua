local expr_opts = { expr = true }

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>")
keymap("t", "jk", "<C-\\><C-n>")
keymap("i", "JK", "<ESC>")
keymap("t", "JK", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Center search results
keymap("n", "n", "nzz", { desc = 'Search and center screen' })
keymap("n", "N", "Nzz", { desc = 'Search and center screen' })
keymap('n', '*', '*zz', { desc = 'Search and center screen' })

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Always center
-- keymap("n", "k", "kzz")
-- keymap("n", "j", "jzz")
-- keymap("n", "G", "Gzz")

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP')

-- Switch buffer
keymap("n", "<S-h>", ":bnext<CR>")
keymap("n", "<S-l>", ":bprevious<CR>")
keymap("n", "<Tab>", ":bnext<CR>")
keymap("n", "<S-Tab>", ":bprevious<CR>")

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>")

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "J", ":move '>+1<CR>gv-gv")

-- Resizing panes
keymap("n", "<Left>", ":vertical resize -2<CR>")
keymap("n", "<Right>", ":vertical resize +2<CR>")
keymap("n", "<Up>", ":resize +2<CR>")
keymap("n", "<Down>", ":resize -2<CR>")
