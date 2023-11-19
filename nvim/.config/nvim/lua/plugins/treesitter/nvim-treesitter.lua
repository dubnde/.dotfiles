return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  config = function()
    -- Treesitter folding
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

    local treesitter_config = require 'nvim-treesitter.configs'

    ---@diagnostic disable-next-line: missing-fields
    treesitter_config.setup {

      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = true },
      indent = { enable = true },
      autopairs = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },

      ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'gitignore',
        'json',
        'lua',
        'python',
        'ron',
        'rust',
        'toml',
        'yaml',
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-s>",
          node_incremental = "<C-s>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },

      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },

    }
  end,
}
