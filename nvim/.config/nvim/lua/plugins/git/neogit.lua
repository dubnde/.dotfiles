return {
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
  }

