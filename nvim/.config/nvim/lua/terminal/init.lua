return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { "<leader>'",  '<cmd>ToggleTerm<CR>',                      desc = 'ToggleTerm' },
    { '<leader>tt', '<cmd>ToggleTerm<CR>',                      desc = 'ToggleTerm' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<CR>',      desc = 'ToggleTerm Float' },
    { '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', desc = 'ToggleTerm horizontal' },
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>',   desc = 'ToggleTerm vertical' },
  },
  config = function()
    local terminal = require 'toggleterm'

    terminal.setup {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == 'horizontal' then
          return 20
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,

      start_in_insert = true,
      close_on_exit = true,
    }

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', "<localleader>'", [[<Cmd>ToggleTerm<CR>]], opts)
      vim.keymap.set('t', "<localleader>t", [[<Cmd>ToggleTerm<CR>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
  end,
}
