-- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.
return {
  'folke/which-key.nvim',
  keys = { '<leader>', '"', "'", '`', 'c', 'g', 'y', 'd', 'z', 'g' },
  event = 'VeryLazy',
  opts = {
    plugins = { spelling = true },
    operators = {
      gc = 'Comments',
      gb = 'Block comments',
      ys = 'Add surroundings',
      cs = 'Change surroundings',
    },
    defaults = {
      mode = { 'n', 'v' },
      ['g'] = { name = '+goto' },
      ['gb'] = { name = '+Block comments' },
      ['gc'] = { name = '+Comments' },
      ['gz'] = { name = '+Surround' },
      [']'] = { name = '+next' },
      ['['] = { name = '+prev' },
      ['<leader><tab>'] = { name = '+tabs' },
      ['<leader>='] = { name = '+Format' },
      ['<leader>b'] = { name = '+buffer' },
      ['<leader>c'] = { name = '+code/crates' },
      ['<leader>d'] = { name = '+debug' },
      ['<leader>da'] = { name = '+adapters' },
      ['<leader>e'] = { name = '+explorer' },
      ['<leader>f'] = { name = '+file/find' },
      ['<leader>g'] = { name = '+git' },
      ['<leader>l'] = { name = '+lsp' },
      ['<leader>L'] = { name = '+Lazy' },
      ['<leader>p'] = { name = '+project' },
      ['<leader>q'] = { name = '+quit/session' },
      ['<leader>s'] = { name = '+search' },
      ['<leader>t'] = { name = '+toggle/term/tab' },
      ['<leader>T'] = { name = '+Toggle' },
      ['<leader>u'] = { name = '+ui' },
      ['<leader>w'] = { name = '+windows' },
      ['<leader>x'] = { name = '+diagnostics/quickfix' },
      ['<leader>y'] = { name = '+yank/paste' },
      ['<leader>z'] = { name = '+zane' },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}