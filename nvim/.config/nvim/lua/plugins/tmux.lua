return {
  'christoomey/vim-tmux-navigator',
  config = function()
    vim.g.tmux_navigator_no_wrap = 1

    local ok, tmux = pcall(require, 'vim-tmux-navigator')
    if ok then
      tmux.setup {}
    end
  end,
}
