return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '<leader>ee', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
    { '<leader>ef', '<cmd>NvimTreeFocus<CR>',  desc = 'Focus NvimTree' },
  },
  opts = {
    sort_by = 'case_sensitive',
    view = {
      width = 30,
      side = 'right',
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
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
  },
}
