return {
  'nvim-telescope/telescope.nvim',
  enabled = not IS_LINUX,
  cmd = 'Telescope',
  keys = {
    { '<leader><leader>', '<cmd>Telescope commands theme=ivy<CR>',                  desc = 'Commands' },
    { '<leader>/',        '<cmd>Telescope live_grep theme=ivy<CR>',                 desc = 'Find a string' },
    { '<leader>*',        '<cmd>Telescope grep_string theme=ivy<CR>',               desc = 'Find cursor string' },
    { '<leader>bb',       '<cmd>Telescope buffers theme=ivy<CR>',                   desc = 'Find buffers' },
    { '<leader>ff',       '<cmd>Telescope find_files theme=ivy<CR>',                desc = 'Find Files' },
    { '<leader>fr',       '<cmd>Telescope oldfiles theme=ivy<CR>',                  desc = 'History' },
    { '<leader>fg',       '<cmd>Telescope git_files theme=ivy<CR>',                 desc = 'Git Files' },
    { '<leader>gc',       '<cmd>Telescope git_commits theme=ivy<CR>',               desc = 'Git Commits' },
    { '<leader>gs',       '<cmd>Telescope git_status theme=ivy<CR>',                desc = 'Git Status' },
    { '<leader>sr',       '<cmd>Telescope resume theme=ivy<CR>',                    desc = 'Resume' },
    { '<leader>ss',       '<cmd>Telescope current_buffer_fuzzy_find theme=ivy<CR>', desc = 'Search buffer' },
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    telescope.setup {
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            -- map actions.which_key to default: <C-/>
            -- ['<C-h>'] = 'which_key',
            -- <Esc> to quit in insert mode
            ['<esc>'] = actions.close,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    }
  end,
}

