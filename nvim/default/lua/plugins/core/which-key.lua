return {

  'folke/which-key.nvim',
  config = function()
    local wk = require('which-key')
    wk.setup({
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
    })

    wk.register({
      ['<leader>'] = {
        ["'"] = { name = 'Terminal' },
        ["="] = { name = 'Align/Format' },
        ["f"] = { name = 'File/Format' },
        ["b"] = { name = 'Buffer' },
        ["c"] = { name = 'Code' },
        ["d"] = { name = 'Delete/Close' },
        ["e"] = { name = 'Explorer' },
        ["g"] = { name = 'Git' },
        ["l"] = { name = 'LSP' },
        ["m"] = { name = 'Mason' },
        ["n"] = { name = 'No/Toggle' },
        ["q"] = { name = 'Quit' },
        ["s"] = { name = 'Search' },
        ["t"] = { name = 'tab' },
        ["u"] = { name = 'UI' },
        ["w"] = { name = 'Window' },
      },
    })
  end

}
