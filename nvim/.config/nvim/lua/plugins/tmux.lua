return {
  'christoomey/vim-tmux-navigator',
  config = function()
    local ok, tmux = pcall(require, 'vim-tmux-navigator')
    if ok then
      tmux.setup {}
    end
  end,
}
