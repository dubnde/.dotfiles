return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '<leader>et', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file explorer' },
    { '<leader>ef', '<cmd>NvimTreeFocus<CR>', desc = 'Focus file explorer' },
    { '<leader>ee', '<cmd>NvimTreeFindFileToggle<CR>', desc = 'Toggle file explorer on current file' },
  },
  config = function()
    local nvimtree = require 'nvim-tree'

    -- configure nvim-tree
    nvimtree.setup {
      sort_by = 'case_sensitive',

      view = {
        width = 40,
        side = 'right',
      },
      -- change folder arrow icons
      renderer = {
        group_empty = true,
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '', -- arrow when folder is closed
              arrow_open = '', -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        -- dotfiles = true,
        custom = { '.DS_Store' },
      },
      git = {
        ignore = false,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = 'h',
          info = 'i',
          warning = 'w',
          error = 'e',
        },
      },
    }
  end,
}
