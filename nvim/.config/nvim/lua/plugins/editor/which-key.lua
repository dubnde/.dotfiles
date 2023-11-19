-- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.
return {
  "folke/which-key.nvim",
  lazy = false,
  opts = {
    highlight = { timer = 250 },
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>="] = { name = "+format/align" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>e"] = { name = "+explorer" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>l"] = { name = "+lsp" },
      ["<leader>L"] = { name = "+Lazy" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>t"] = { name = "+terminal" },
      ["<leader>T"] = { name = "+Toggle" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
      ["<leader>y"] = { name = "+yank/paste" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
