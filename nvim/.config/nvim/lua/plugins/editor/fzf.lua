return {
  'junegunn/fzf.vim',
  enabled = IS_LINUX,
  dependencies = { 'junegunn/fzf' },
  keys = {
    { '<leader><leader>', '<cmd>Commands<CR>', desc = 'Commands' },
    { '<leader>/',        '<cmd>Rg<CR>',       desc = 'Search' },
    { '<leader>ff',       '<cmd>Files<CR>',    desc = 'Find Files' },
    { '<leader>fr',       '<cmd>History<CR>',  desc = 'History' },
    { '<leader>sw',       '<cmd>Windows<CR>',  desc = 'Windows' },
    { '<leader>bb',       '<cmd>Buffers<CR>',  desc = 'Buffers' },
    { '<leader>gs',       '<cmd>GFiles?<CR>',  desc = 'Git Status' },
    { '<leader>ss',       '<cmd>BLines<CR>',   desc = 'Search Loaded Buffers' },
    { '<leader>sS',       '<cmd>Lines<CR>',    desc = 'Search Current Buffer' },
  },
}

