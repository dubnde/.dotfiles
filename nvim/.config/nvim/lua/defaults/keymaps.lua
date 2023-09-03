local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end

--Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', opts 'Remap space as leader')
vim.keymap.set('', '\\', '<Nop>', opts 'Remap space as leader')

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts 'Left Window')
vim.keymap.set('n', '<C-j>', '<C-w>j', opts 'Lower Window')
vim.keymap.set('n', '<C-k>', '<C-w>k', opts 'Upper Window')
vim.keymap.set('n', '<C-l>', '<C-w>l', opts 'Right Window')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts 'Next Buffer')
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts 'Previous Buffer')
vim.keymap.set('n', '<TAB>', ':bnext<CR>', opts 'Next Buffer')
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', opts 'Previous Buffer')

-- Clear highlights
vim.keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', opts 'Clear search highlights')

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- Write file
vim.keymap.set('n', '<leader>fs', '<cmd>write<CR>', opts 'Write File')
vim.keymap.set('n', '<leader>fw', '<cmd>write<CR>', opts 'Write File')
vim.keymap.set('n', '<leader>fS', '<cmd>wa<CR>', opts 'Write all files')
vim.keymap.set('n', '<leader>fW', '<cmd>wa<CR>', opts 'Write all files')

vim.keymap.set('n', '<Leader>qq', '<CMD>quitall<CR>', opts 'Safe quit current file')
vim.keymap.set('n', '<Leader>Q', '<CMD>quitall!<CR>', opts 'Force Quit')

-- Better paste
vim.keymap.set('v', 'p', '"_dP')

-- Insert --
-- Press jk fast to enter
vim.keymap.set({ 'i', 'v', 'x', 't' }, 'jk', '<ESC>', opts 'Escape')

-- Visual --
-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts 'Shift left visual')
vim.keymap.set('v', '>', '>gv', opts 'Shift right visual')

-- Search will center on the line it's found in
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '#', '#zz')
vim.keymap.set('n', '*', '*zz')

-- increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts 'increment')
vim.keymap.set('n', '<leader>-', '<C-x>', opts 'decrement')

-- window management
vim.keymap.set('n', '<leader>w=', '<Cmd>wincmd =<CR>', opts 'Equalise')
vim.keymap.set('n', '<leader>w|', '<Cmd>wincmd v<CR>', opts 'split vertically')
vim.keymap.set('n', '<leader>w-', '<Cmd>wincmd s<CR>', opts 'split horizontally')
vim.keymap.set('n', '<leader>wv', '<Cmd>wincmd v<CR>', opts 'split vertically')
vim.keymap.set('n', '<leader>wh', '<Cmd>wincmd s<CR>', opts 'split horizontally')
vim.keymap.set('n', '<leader>wd', '<Cmd>wincmd c<CR>', opts 'close window')
vim.keymap.set('n', '<leader>wn', '<Cmd>wincmd n<CR>', opts 'New window')
vim.keymap.set('n', '<leader>wo', '<Cmd>wincmd o<CR>', opts 'Only window')
vim.keymap.set('n', '<leader>wm', '<Cmd>wincmd o<CR>', opts 'Only window')
vim.keymap.set('n', '<leader>wp', '<Cmd>wincmd p<CR>', opts 'Previous window')
vim.keymap.set('n', '<leader>wq', '<Cmd>wincmd q<CR>', opts 'Quit')
vim.keymap.set('n', '<leader>ww', '<Cmd>wincmd p<CR>', opts 'Previous window')
vim.keymap.set('n', '<leader>wt', '<Cmd>wincmd T<CR>', opts 'Move to tab')

vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts 'New tab')
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts 'Close tab')
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', opts 'Next tab')
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', opts 'Previous tab')
