-- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { 'n', 'v' },
      ['g'] = { name = '+goto' },
      ['gz'] = { name = '+surround' },
      [']'] = { name = '+next' },
      ['['] = { name = '+prev' },
      ['<leader><tab>'] = { name = '+tabs' },
      ['<leader>b'] = { name = '+buffer' },
      ['<leader>c'] = { name = '+code' },
      ['<leader>d'] = { name = '+debug' },
      ['<leader>da'] = { name = '+adapters' },
      ['<leader>e'] = { name = '+explorer' },
      ['<leader>f'] = { name = '+file/find' },
      ['<leader>g'] = { name = '+git' },
      ['<leader>l'] = { name = '+lsp' },
      ['<leader>p'] = { name = '+project' },
      ['<leader>q'] = { name = '+quit/session' },
      ['<leader>s'] = { name = '+search' },
      ['<leader>t'] = { name = '+toggle/term/tab' },
      ['<leader>T'] = { name = '+Toggle' },
      ['<leader>u'] = { name = '+ui' },
      ['<leader>w'] = { name = '+windows' },
      ['<leader>x'] = { name = '+diagnostics/quickfix' },
      ['<leader>y'] = { name = '+yank/paste' },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
