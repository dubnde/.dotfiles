-- Telescope fuzzy finding (all the things)
return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable('make') == 1 },
    },
    keys = {
      { '<C-p>',           '<CMD>Telescope keymaps<CR>',                   desc = 'Search keymaps' },
      { '<leader>*',       '<CMD>Telescope grep_string<CR>',               desc = 'Current word' },
      { '<leader>/',       '<CMD>Telescope live_grep<CR>',                 desc = 'Grep' },
      { '<leader>:',       '<CMD>Telescope commands<CR>',                  desc = 'Commands' },
      { '<leader><space>', '<CMD>Telescope buffers<CR>',                   desc = 'Open buffers' },
      { '<leader>fb',      '<CMD>Telescope buffers<CR>',                   desc = 'Open buffers' },
      { '<leader>fd',      '<CMD>Telescope diagnostics<CR>',               desc = 'Diagnostics' },
      { '<leader>ff',      '<CMD>Telescope find_files<CR>',                desc = 'Files' },
      { '<leader>fh',      '<CMD>Telescope help_tags<CR>',                 desc = 'Help' },
      { '<leader>fk',      '<CMD>Telescope keymaps<CR>',                   desc = 'Keymaps' },
      { '<leader>fr',      '<CMD>Telescope oldfiles<CR>',                  desc = 'Recently opened' },
      { '<leader>ss',      '<CMD>Telescope current_buffer_fuzzy_find<CR>', desc = 'Fuzzy find in buffer' },
      { '<leader>sr',      '<CMD>Telescope resume<CR>',                    desc = 'Resume' },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key",
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      })

      -- Enable telescope fzf native, if installed
      prequire('telescope').load_extension('fzf')
    end,
  },
}
