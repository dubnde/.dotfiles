-- Miscelaneous fun stuff
return {
  'tpope/vim-surround', -- Surround stuff with the ys-, cs-, ds- commands
  -- Comment with haste
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  -- Move stuff with <M-j> and <M-k> in both normal and visual mode
  {
    'echasnovski/mini.move',
    config = function()
      require('mini.move').setup()
    end,
  },
  -- Better buffer closing actions. Available via the buffers helper.
  {
    'kazhala/close-buffers.nvim',
    opts = {
      preserve_window_layout = { 'this', 'nameless' },
    },
  },
}
