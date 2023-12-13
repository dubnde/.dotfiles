return {

  {
    'mg979/vim-visual-multi',
    enabled = false,
  },

  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = { 'smoka7/hydra.nvim' },
    opts = {},
    cmd = {
      'MCstart',
      'MCvisual',
      'MCclear',
      'MCpattern',
      'MCvisualPattern',
      'MCunderCursor'
    },
    keys = {
      { mode = { 'v', 'n' }, '<Leader>m', '<cmd>MCstart<cr>', desc = 'MultiCursor Start', },
      { mode = { 'v', 'n' }, '<C-N>',     '<cmd>MCstart<cr>', desc = 'MultiCursor Start', }
    },
  },

}
