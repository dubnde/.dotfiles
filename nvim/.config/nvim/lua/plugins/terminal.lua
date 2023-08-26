return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = 'ToggleTerm' },
  },
  config = function()
    local ok, terminal = pcall(require, 'toggleterm')
    if ok then
      terminal.setup {}
    end
  end,
}
