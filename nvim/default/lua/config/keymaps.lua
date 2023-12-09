local keys = require('helpers.keys')

local map = keys.map
local keymap = keys.keymap

-- Blazingly fast way out of insert mode
map('i', 'jk', '<esc>')
map('i', 'kj', '<esc>')

-- Quick access to some common actions
map('n', '<leader>fw', '<cmd>w<cr>', 'Write')
map('n', '<leader>fs', '<cmd>w<cr>', 'Write')
map('n', '<leader>fa', '<cmd>wa<cr>', 'Write all')
map('n', '<leader>fS', '<cmd>wa<cr>', 'Write all')
map('n', '<leader>qq', '<cmd>q<cr>', 'Quit')
map('n', '<leader>qa', '<cmd>qa!<cr>', 'Quit all')
map('n', '<Leader>Q', '<CMD>quitall!<CR>', 'Force Quit')

-- Diagnostic keymaps
map('n', 'gx', vim.diagnostic.open_float, 'Show diagnostics under cursor')

-- Easier access to beginning and end of lines
map('n', '<M-h>', '^', 'Go to beginning of line')
map('n', '<M-l>', '$', 'Go to end of line')

-- Better window navigation
map('n', '<C-h>', '<C-w><C-h>', 'Navigate windows to the left')
map('n', '<C-j>', '<C-w><C-j>', 'Navigate windows down')
map('n', '<C-k>', '<C-w><C-k>', 'Navigate windows up')
map('n', '<C-l>', '<C-w><C-l>', 'Navigate windows to the right')

-- Move with shift-arrows
map('n', '<S-Left>', '<C-w><S-h>', 'Move window to the left')
map('n', '<S-Down>', '<C-w><S-j>', 'Move window down')
map('n', '<S-Up>', '<C-w><S-k>', 'Move window up')
map('n', '<S-Right>', '<C-w><S-l>', 'Move window to the right')

-- Resize with arrows
map('n', '<C-Up>', ':resize +2<CR>')
map('n', '<C-Down>', ':resize -2<CR>')
map('n', '<C-Left>', ':vertical resize +2<CR>')
map('n', '<C-Right>', ':vertical resize -2<CR>')

-- Deleting buffers
local buffers = require('helpers.buffers')
map('n', '<leader>bd', buffers.delete_this, 'Current buffer')
map('n', '<leader>bD', buffers.delete_all, 'All buffers')
map('n', '<leader>bo', buffers.delete_others, 'Other buffers')

-- Navigate buffers
map('n', '<S-l>', ':bnext<CR>', 'Next Buffer')
map('n', '<S-h>', ':bprevious<CR>', 'Previous Buffer')
map('n', '<TAB>', ':bnext<CR>', 'Next Buffer')
map('n', '<S-TAB>', ':bprevious<CR>', 'Previous Buffer')

local expr_opts = { noremap = true, expr = true, silent = true }

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- delete single character without copying into register
map("n", "x", '"_x')

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Better paste
map('v', 'p', '"_dP')

-- Insert --
-- Press jk fast to enter
map({ 'i', 'v', 'x', 't' }, 'jk', '<ESC>', 'Escape')
map({ 'i', 'v', 'x', 't' }, 'kj', '<ESC>', 'Escape')

-- Search will center on the line it's found in
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '#', '#zz')
map('n', '*', '*zz')

-- Switch between light and dark modes
map('n', '<leader>ut', function()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end, 'Toggle between light and dark themes')

-- Clear after search
map('n', '<leader>ur', '<cmd>nohl<cr>', 'Clear highlights')
map('n', '<leader>nh', '<cmd>nohl<cr>', 'Clear highlights')

-- window management
map('n', '<leader>w=', '<Cmd>wincmd =<CR>', 'Equalise')
map('n', '<leader>w|', '<Cmd>wincmd v<CR>', 'split vertically')
map('n', '<leader>w-', '<Cmd>wincmd s<CR>', 'split horizontally')
map('n', '<leader>wv', '<Cmd>wincmd v<CR>', 'split vertically')
map('n', '<leader>wh', '<Cmd>wincmd s<CR>', 'split horizontally')
map('n', '<leader>wc', '<Cmd>wincmd c<CR>', 'close window')
map('n', '<leader>wd', '<Cmd>wincmd c<CR>', 'close window')
map('n', '<leader>wn', '<Cmd>wincmd n<CR>', 'New window')
map('n', '<leader>wo', '<Cmd>wincmd o<CR>', 'Only window')
map('n', '<leader>wm', '<Cmd>wincmd o<CR>', 'Only window')
map('n', '<leader>wp', '<Cmd>wincmd p<CR>', 'Previous window')
map('n', '<leader>wq', '<Cmd>wincmd q<CR>', 'Quit')
map('n', '<leader>wr', '<Cmd>wincmd r<CR>', 'Rotate down/right')
map('n', '<leader>wR', '<Cmd>wincmd R<CR>', 'Rotate up/left')
map('n', '<leader>ww', '<Cmd>wincmd p<CR>', 'Previous window')
map('n', '<leader>wt', '<Cmd>wincmd T<CR>', 'Move to tab')
map('n', '<leader>wx', '<Cmd>wincmd X<CR>', 'Exchange window')

map('n', '<leader>to', ':tabnew<CR>', 'New tab')
map('n', '<leader>tx', ':tabclose<CR>', 'Close tab')
map('n', '<leader>tn', ':tabnext<CR>', 'Next tab')
map('n', '<leader>tp', ':tabprevious<CR>', 'Previous tab')
