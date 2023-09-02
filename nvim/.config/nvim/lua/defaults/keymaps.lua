--Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Left Window'})
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Lower Window'})
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Upper Window'})
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Right Window'})

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Next Buffer'})
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous Buffer'})
vim.keymap.set('n', '<TAB>', ':bnext<CR>', { desc = 'Next Buffer'})
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', { desc = 'Previous Buffer'})

-- Clear highlights
vim.keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights'})

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- Write file
vim.keymap.set('n', '<leader>fs', '<cmd>:write<CR>', { desc = 'Write File'})
vim.keymap.set('n', '<leader>fw', '<cmd>:write<CR>', { desc = 'Write File'})
vim.keymap.set('n', '<leader>fS', '<cmd>:wa<CR>', { desc = 'Write all files'})
vim.keymap.set('n', '<leader>fW', '<cmd>:wa<CR>', { desc = 'Write all files'})

vim.keymap.set('n', '<Leader>qq', ':quitall<CR>', { desc = 'Safe Quit'})
vim.keymap.set('n', '<Leader>Q', ':quitall!<CR>', { desc = 'Force Quit'})

-- Better paste
vim.keymap.set('v', 'p', '"_dP')

-- Insert --
-- Press jk fast to enter
vim.keymap.set({ 'i', 'v', 'x', 't' }, 'jk', '<ESC>', { desc = 'Escape' } )

-- Visual --
-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Shift left visual'})
vim.keymap.set('v', '>', '>gv', { desc = 'Shift right visual'})

-- Search will center on the line it's found in
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '#', '#zz')
vim.keymap.set('n', '*', '*zz')

-- increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'increment'})
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'decrement'})

-- window management
vim.keymap.set('n', '<leader>w=', '<Cmd>wincmd =<CR>', { desc = 'Equalise'})
vim.keymap.set('n', '<leader>w|', '<Cmd>wincmd v<CR>', { desc = 'split vertically'})
vim.keymap.set('n', '<leader>w-', '<Cmd>wincmd s<CR>', { desc = 'split horizontally'})
vim.keymap.set('n', '<leader>wv', '<Cmd>wincmd v<CR>', { desc = 'split vertically'})
vim.keymap.set('n', '<leader>wh', '<Cmd>wincmd s<CR>', { desc = 'split horizontally'})
vim.keymap.set('n', '<leader>wd', '<Cmd>wincmd c<CR>', { desc = 'close window'})
vim.keymap.set('n', '<leader>wn', '<Cmd>wincmd n<CR>', { desc = 'New window'})
vim.keymap.set('n', '<leader>wo', '<Cmd>wincmd o<CR>', { desc = 'Only window'})
vim.keymap.set('n', '<leader>wm', '<Cmd>wincmd o<CR>', { desc = 'Only window'})
vim.keymap.set('n', '<leader>wp', '<Cmd>wincmd p<CR>', { desc = 'Previous window'})
vim.keymap.set('n', '<leader>wq', '<Cmd>wincmd q<CR>', { desc = 'Quit'})
vim.keymap.set('n', '<leader>ww', '<Cmd>wincmd p<CR>', { desc = 'Previous window'})
vim.keymap.set('n', '<leader>wt', '<Cmd>wincmd T<CR>', { desc = 'Move to tab'})

vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'New tab'})
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab'})
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { desc = 'Next tab'})
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Previous tab'})
