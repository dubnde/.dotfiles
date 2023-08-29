if not vim.g.vscode then
  return {}
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyVimKeymaps',
  callback = function()
    mapn('<leader><space>', '<cmd>Find<cr>', '')
    mapn('<leader>/', [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]], '')
    mapn('<leader>ss', [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]], '')
  end,
})

return {
  {
    'flit.nvim',
    'lazy.nvim',
    'leap.nvim',
    'mini.ai',
    'mini.comment',
    'mini.pairs',
    'mini.surround',
    'nvim-treesitter',
    'nvim-treesitter-textobjects',
    'nvim-ts-context-commentstring',
    'vim-repeat',
  },
  { 'nvim-treesitter/nvim-treesitter', opts = { highlight = { enable = false } } },
}
