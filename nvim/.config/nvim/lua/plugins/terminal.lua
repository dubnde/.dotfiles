return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { "<leader>'", '<cmd>ToggleTerm<CR>', desc = 'ToggleTerm' },
    { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = 'ToggleTerm' },
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
    }

    function _G.set_terminal_keymaps()
      bufmapt('<C-h>', [[<Cmd>wincmd h<CR>]], 0)
      bufmapt('<C-j>', [[<Cmd>wincmd j<CR>]], 0)
      bufmapt('<C-k>', [[<Cmd>wincmd k<CR>]], 0)
      bufmapt('<C-l>', [[<Cmd>wincmd l<CR>]], 0)
      bufmapt("<leader>'", [[<Cmd>ToggleTerm<CR>]], 0)
      bufmapt('<leader>tt', [[<Cmd>ToggleTerm<CR>]], 0)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
  end,
}
