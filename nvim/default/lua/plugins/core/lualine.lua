return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')

    lualine.setup({
      options = {
        icons_enabled = not IS_LINUX,
        theme = 'gruvbox',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', file_status = true, path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype', 'filesize' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', file_status = true, path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {
        'lazy',
        'mason',
        'nvim-tree',
        'quickfix',
        'toggleterm',
      }
    })
  end
}
