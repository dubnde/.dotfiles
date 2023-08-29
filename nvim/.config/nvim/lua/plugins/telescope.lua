return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
  },
  keys = {
    { '<leader><leader>', '<cmd>Telescope commands<CR>',    desc = 'Commands' },
    { '<leader>/',        '<cmd>Telescope live_grep<CR>',   desc = 'Find a string' },
    { '<leader>*',        '<cmd>Telescope grep_string<CR>', desc = 'Find cursor string' },
    { '<leader>bb',       '<cmd>Telescope buffers<CR>',     desc = 'Find buffers' },
    { '<leader>ff',       '<cmd>Telescope find_files<CR>',  desc = 'Find Files' },
    { '<leader>fr',       '<cmd>Telescope oldfiles<CR>',    desc = 'History' },
    { '<leader>pf',       '<cmd>Telescope git_files<CR>',   desc = 'Git Files' },
    { '<leader>gc',       '<cmd>Telescope git_commits<CR>', desc = 'Git Commits' },
    { '<leader>gs',       '<cmd>Telescope git_status<CR>',  desc = 'Git Status' },
    { '<leader>sr',       '<cmd>Telescope resume<CR>',      desc = 'Resume' },
  },
  config = function()
    require('telescope').load_extension 'fzf'
  end,
}
