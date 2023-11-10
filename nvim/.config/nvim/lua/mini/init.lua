return {
  'echasnovski/mini.nvim',
  event = { "BufReadPre", "BufNewFile" },
  -- stylua: ignore
  keys = {
    { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
  },
  config = function()
    require('mini.ai').setup()
    require('mini.align').setup()
    require('mini.animate').setup()
    require('mini.bufremove').setup {}
    require('mini.cursorword').setup()

    -- Highlights current level of indentation, and animates the highlighting.
    require('mini.indentscope').setup {
      opts = {
        symbol = '│',
        options = { try_as_border = true },
      },
    }

    require('mini.operators').setup()
    require('mini.splitjoin').setup()
    require('mini.statusline').setup()
    require('mini.tabline').setup()
  end,
}
