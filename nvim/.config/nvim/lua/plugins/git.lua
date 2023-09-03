return {

  -- neogit
  {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
      { '<leader>gg', '<CMD>Neogit<CR>', desc = 'Open neogit' },
    },
    opts = {
      disable_builtin_notifications = true,
      disable_insert_on_commit = 'auto',
      kind = 'replace'
    },
  },

  -- gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  } }
