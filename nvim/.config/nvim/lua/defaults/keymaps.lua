
-- Functional wrapper mapping keys

function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    -- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    vim.keymap.set(mode, lhs, rhs, options)
end

--Remap space as leader key
map('', '<Space>', '<Nop>')

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
map('n', '<C-h>', '<C-w>h', { desc = 'Left Window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Lower Window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Upper Window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Right Window' })

-- Resize with arrows
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Navigate buffers
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next Buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous Buffer' })
map('n', '<TAB>', ':bnext<CR>', { desc = 'Next Buffer' })
map('n', '<S-TAB>', ':bprevious<CR>', { desc = 'Previous Buffer' })

-- Clear highlights
map('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- delete single character without copying into register
map("n", "x", '"_x')

-- Write file
map('n', '<leader>fs', '<cmd>write<CR>', { desc = 'Write File' })
map('n', '<leader>fw', '<cmd>write<CR>', { desc = 'Write File' })
map('n', '<leader>fS', '<cmd>wa<CR>', { desc = 'Write all files' })
map('n', '<leader>fW', '<cmd>wa<CR>', { desc = 'Write all files' })

map('n', '<Leader>qq', '<CMD>quitall<CR>', { desc = 'Safe quit current file' })
map('n', '<Leader>Q', '<CMD>quitall!<CR>', { desc = 'Force Quit' })

-- Better paste
map('v', 'p', '"_dP')

-- Insert --
-- Press jk fast to enter
map({ 'i', 'v', 'x', 't' }, 'jk', '<ESC>', { desc = 'Escape' })
map({ 'i', 'v', 'x', 't' }, 'kj', '<ESC>', { desc = 'Escape' })

-- Visual --
-- Stay in indent mode
map('v', '<', '<gv', { desc = 'Shift left visual' })
map('v', '>', '>gv', { desc = 'Shift right visual' })

-- Search will center on the line it's found in
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '#', '#zz')
map('n', '*', '*zz')

-- increment/decrement numbers
map('n', '<leader>+', '<C-a>', { desc = 'increment' })
map('n', '<leader>-', '<C-x>', { desc = 'decrement' })

-- window management
map('n', '<leader>w=', '<Cmd>wincmd =<CR>', { desc = 'Equalise' })
map('n', '<leader>w|', '<Cmd>wincmd v<CR>', { desc = 'split vertically' })
map('n', '<leader>w-', '<Cmd>wincmd s<CR>', { desc = 'split horizontally' })
map('n', '<leader>wv', '<Cmd>wincmd v<CR>', { desc = 'split vertically' })
map('n', '<leader>wh', '<Cmd>wincmd s<CR>', { desc = 'split horizontally' })
map('n', '<leader>wc', '<Cmd>wincmd c<CR>', { desc = 'close window' })
map('n', '<leader>wd', '<Cmd>wincmd c<CR>', { desc = 'close window' })
map('n', '<leader>wn', '<Cmd>wincmd n<CR>', { desc = 'New window' })
map('n', '<leader>wo', '<Cmd>wincmd o<CR>', { desc = 'Only window' })
map('n', '<leader>wm', '<Cmd>wincmd o<CR>', { desc = 'Only window' })
map('n', '<leader>wp', '<Cmd>wincmd p<CR>', { desc = 'Previous window' })
map('n', '<leader>wq', '<Cmd>wincmd q<CR>', { desc = 'Quit' })
map('n', '<leader>wr', '<Cmd>wincmd r<CR>', { desc = 'Rotate down/right' })
map('n', '<leader>wR', '<Cmd>wincmd R<CR>', { desc = 'Rotate up/left' })
map('n', '<leader>ww', '<Cmd>wincmd p<CR>', { desc = 'Previous window' })
map('n', '<leader>wt', '<Cmd>wincmd T<CR>', { desc = 'Move to tab' })
map('n', '<leader>wx', '<Cmd>wincmd X<CR>', { desc = 'Exchange window' })

map('n', '<leader>to', ':tabnew<CR>', { desc = 'New tab' })
map('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })
map('n', '<leader>tn', ':tabnext<CR>', { desc = 'Next tab' })
map('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Previous tab' })
