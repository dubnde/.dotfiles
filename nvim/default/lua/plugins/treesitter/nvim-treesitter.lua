-- Highlight, edit, and navigate code
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      prequire('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
          'c',
          'cmake',
          'cpp',
          'dockerfile',
          "json",
          "json5",
          "jsonc",
          'lua',
          "markdown",
          "markdown_inline",
          'python',
          "ninja",
          'ron',
          "rst",
          'rust',
          'toml',
          'vimdoc',
          'vim',
          'yaml',
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        ident = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          query = "rainbow-parens",
          strategy = require("ts-rainbow").strategy.global,
          max_file_lines = nil,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
      })
    end,
  },
}
