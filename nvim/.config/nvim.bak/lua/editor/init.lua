return {
  -- todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = true,
    keys = {
      { ']t', function() return require('todo-comments').jump_next() end, desc = 'Jump to next todo comment' },
      { '[t', function() return require('todo-comments').jump_prev() end, desc = 'Jump to previous todo comment' },
    },
  },

  -- trouble.nvim
  {
    'folke/trouble.nvim',
    config = true,
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle<CR>',                       desc = 'Toggle trouble.nvim' },
      { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>', desc = 'Open workspace diagnostics' },
      { '<leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>',  desc = 'Open document diagnostics' },
      { '<leader>xq', '<cmd>TroubleToggle quickfix<CR>',              desc = 'Open quickfix' },
      { '<leader>xl', '<cmd>TroubleToggle loclist<CR>',               desc = 'Open location list' },
      { '<leader>xr', '<cmd>TroubleToggle lsp_references<CR>',        desc = 'Open lsp references' },
    },
  },

  -- zen-mode.nvim
  {
    'folke/zen-mode.nvim',
    dependencies = {
      'folke/twilight.nvim',
      keys = {
        { '<leader>zt', '<cmd>Twilight<CR>', desc = 'Toggle twilight.nvim' }
      },
      config = true,
    },
    opts = { plugins = { kitty = { enabled = true, font = '+4' } } },
    keys = {
      { '<leader>zm', function() return require('zen-mode').toggle() end, desc = 'Toggle zen-mode.nvim' },
    },
  },
}
