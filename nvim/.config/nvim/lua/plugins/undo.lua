return {
  -- highlight-undo.nvim
  {
    'tzachar/highlight-undo.nvim',
    keys = { 'u', '<C-r>' },
    config = true
  },

  -- undotree
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Open undo tree' }
    }
  },
}
