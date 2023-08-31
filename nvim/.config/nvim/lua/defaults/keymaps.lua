_G.bufmap = function(modes, lhs, rhs, desc, bufnr)
  vim.keymap.set(modes, lhs, rhs, {
    desc = desc,
    buffer = bufnr,
    noremap = true,
    silent = true,
    nowait = true,
  })
end

_G.bufmapn = function(lhs, rhs, desc, bufnr)
  bufmap('n', lhs, rhs, desc, bufnr)
end

_G.bufmapv = function(lhs, rhs, desc, bufnr)
  bufmap('v', lhs, rhs, desc, bufnr)
end

_G.bufmapi = function(lhs, rhs, desc, bufnr)
  bufmap('i', lhs, rhs, desc, bufnr)
end

_G.bufmapx = function(lhs, rhs, desc, bufnr)
  bufmap('x', lhs, rhs, desc, bufnr)
end

_G.bufmapt = function(lhs, rhs, desc, bufnr)
  bufmap('t', lhs, rhs, desc, bufnr)
end

_G.map = function(modes, lhs, rhs, desc)
  vim.keymap.set(modes, lhs, rhs, {
    desc = desc,
    noremap = true,
    silent = true,
    nowait = true,
  })
end

_G.mapn = function(lhs, rhs, desc)
  map('n', lhs, rhs, desc)
end

_G.mapv = function(lhs, rhs, desc)
  map('v', lhs, rhs, desc)
end

_G.mapi = function(lhs, rhs, desc)
  map('i', lhs, rhs, desc)
end

_G.mapx = function(lhs, rhs, desc)
  map('x', lhs, rhs, desc)
end

_G.mapt = function(lhs, rhs, desc)
  map('t', lhs, rhs, desc)
end

--Remap space as leader key
map('', '<Space>', '<Nop>', '')

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
mapn('<C-h>', '<C-w>h', 'Left Window')
mapn('<C-j>', '<C-w>j', 'Lower Window')
mapn('<C-k>', '<C-w>k', 'Upper Window')
mapn('<C-l>', '<C-w>l', 'Right Window')

-- Resize with arrows
mapn('<C-Up>', ':resize -2<CR>', '')
mapn('<C-Down>', ':resize +2<CR>', '')
mapn('<C-Left>', ':vertical resize -2<CR>', '')
mapn('<C-Right>', ':vertical resize +2<CR>', '')

-- Navigate buffers
mapn('<S-l>', ':bnext<CR>', 'Next Buffer')
mapn('<S-h>', ':bprevious<CR>', 'Previous Buffer')
mapn('<TAB>', ':bnext<CR>', 'Next Buffer')
mapn('<S-TAB>', ':bprevious<CR>', 'Previous Buffer')

-- Clear highlights
mapn('<leader>nh', '<cmd>nohlsearch<CR>', 'Clear Highlight')

-- delete single character without copying into register
map({ 'x' }, '"_x', 'Delete Single Character')

-- Write file
mapn('<leader>fs', '<cmd>:write<CR>', 'Write File')
mapn('<leader>fw', '<cmd>:write<CR>', 'Write File')
mapn('<leader>fS', '<cmd>:wa<CR>', 'Write all files')
mapn('<leader>fW', '<cmd>:wa<CR>', 'Write all files')

mapn('<Leader>qq', ':quitall<CR>', 'Safe Quit')
mapn('<Leader>Q', ':quitall!<CR>', 'Force Quit')

-- Better paste
mapv('p', '"_dP', 'Better Paste')

-- Insert --
-- Press jk fast to enter
map({ 'i', 'v', 'x', 't' }, 'jk', '<ESC>', 'Escape')

-- Visual --
-- Stay in indent mode
mapv('<', '<gv', 'Shift left visual')
mapv('>', '>gv', 'Shift right visual')

-- Search will center on the line it's found in
mapn('n', 'nzzzv', '')
mapn('N', 'Nzzzv', '')
mapn('#', '#zz', '')
mapn('*', '*zz', '')

-- increment/decrement numbers
mapn('<leader>+', '<C-a>', 'increment')
mapn('<leader>-', '<C-x>', 'decrement')

-- window management
mapn('<leader>w=', '<Cmd>wincmd =<CR>', 'Equalise')
mapn('<leader>w|', '<Cmd>wincmd v<CR>', 'split vertically')
mapn('<leader>w-', '<Cmd>wincmd s<CR>', 'split horizontally')
mapn('<leader>wv', '<Cmd>wincmd v<CR>', 'split vertically')
mapn('<leader>wh', '<Cmd>wincmd s<CR>', 'split horizontally')
mapn('<leader>wd', '<Cmd>wincmd c<CR>', 'close window')
mapn('<leader>wn', '<Cmd>wincmd n<CR>', 'New window')
mapn('<leader>wo', '<Cmd>wincmd o<CR>', 'Only window')
mapn('<leader>wm', '<Cmd>wincmd o<CR>', 'Only window')
mapn('<leader>wp', '<Cmd>wincmd p<CR>', 'Previous window')
mapn('<leader>wq', '<Cmd>wincmd q<CR>', 'Quit')
mapn('<leader>ww', '<Cmd>wincmd p<CR>', 'Previous window')
mapn('<leader>wt', '<Cmd>wincmd T<CR>', 'Move to tab')

mapn('<leader>to', ':tabnew<CR>', 'New tab')
mapn('<leader>tx', ':tabclose<CR>', 'Close tab')
mapn('<leader>tn', ':tabnext<CR>', 'Next tab')
mapn('<leader>tp', ':tabprevious<CR>', 'Previous tab')
