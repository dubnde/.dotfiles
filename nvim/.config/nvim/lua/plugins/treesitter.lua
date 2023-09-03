return {

  -- nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      -- Treesitter folding
      -- vim.wo.foldmethod = 'manual'
      -- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

      local treesitter_config = require 'nvim-treesitter.configs'

      ---@diagnostic disable-next-line: missing-fields
      treesitter_config.setup {
        ensure_installed = {
          'bash',
          'c',
          'cmake',
          'cpp',
          'dockerfile',
          'gitignore',
          'git_config',
          'html',
          'java',
          'json',
          'json5',
          'jsonc',
          'lua',
          'markdown',
          'markdown_inline',
          'ninja',
          'python',
          'ron',
          'rust',
          'toml',
          'vim',
          'vimdoc',
          'yaml',
        },

        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autopairs = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      }
    end,
  },

  -- nvim-treesitter-context
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = true,
  },

  -- nvim-treesitter-textobjects
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      local configs = require 'nvim-treesitter.configs'

      ---@diagnostic disable-next-line: missing-fields
      configs.setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment region' },
              ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment region' },

              ['a:'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/field region' },
              ['i:'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/field region' },

              ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional region' },
              ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional region' },

              ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop region' },
              ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop region' },

              ['ab'] = { query = '@block.outer', desc = 'Select outer part of a block region' }, -- overrides default text object block of parenthesis to parenthesis
              ['ib'] = { query = '@block.inner', desc = 'Select inner part of a block region' }, -- overrides default text object block of parenthesis to parenthesis

              ['af'] = { query = '@function.outer', desc = 'Select outer part of a function region' },
              ['if'] = { query = '@function.inner', desc = 'Select inner part of a function region' },

              ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class region' },
              ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            },
            include_surrounding_whitespace = true,
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>on'] = '@parameter.inner', -- swap object under cursor with next
            },
            swap_previous = {
              ['<leader>op'] = '@parameter.inner', -- swap object under cursor with previous
            },
          },
        },
      }
    end,
  },
}
