local keys = require('helpers.keys')

local map = keys.map

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

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

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
