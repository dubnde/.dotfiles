-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>")

vim.g.mapleader = " "
-- vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Clear highlights
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>")

-- delete single character without copying into register
keymap("n", "x", '"_x')

-- Close buffers
keymap("n", "<leader>bd", "<cmd>:bd<CR>")
keymap("n", "<leader>bD", "<cmd>Bdelete!<CR>")

-- Write file
keymap("n", "<leader>fw", "<cmd>:write<CR>")

-- Safe quit
keymap('n', '<Leader>qq', ':quitall<CR>')

-- Force quit
keymap('n', '<Leader>Q', ':quitall!<CR>')


-- Better paste
keymap("v", "p", '"_dP')

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Search will center on the line it's found in
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', '#', '#zz')
keymap('n', '*', '*zz')

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>") -- increment
keymap("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap("n", "<leader>wv", "<C-w>v") -- split window vertically
keymap("n", "<leader>wh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>wd", ":close<CR>") -- close current split window

keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

