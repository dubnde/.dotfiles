-- Setup treesitter
local ts = prequire("nvim-treesitter.configs")

if not ts then
  return
end

ts.setup {
  ensure_installed = "all",

  indent = {
    enable = true,
  },

  highlight = {
    enable = true,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

-- Folding
-- vim.cmd("set foldmethod=expr")
-- vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
