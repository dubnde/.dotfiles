local fzf = prequire("fzf-lua")

if not fzf then
  return
end

local actions = prequire("fzf-lua.actions")

if not actions then
  return
end

fzf.setup {
  winopts = {
    -- split         = "new",           -- open in a split instead?
    win_height       = 0.85, -- window height
    win_width        = 0.80, -- window width
    win_row          = 0.30, -- window row position (0=top, 1=bottom)
    win_col          = 0.50, -- window col position (0=left, 1=right)
    -- win_border    = false,           -- window border? or borderchars?
    win_border       = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    window_on_create = function() -- nvim window options override
      vim.cmd("set winhl=Normal:Normal") -- popup bg match normal windows
    end,
  },
  buffers = { previewer = 'builtin' },
  fzf_opts = {
    ['--ansi']   = '',
    ['--prompt'] = '> ',
    ['--info']   = 'inline',
    ['--height'] = '100%',
    ['--layout'] = 'reverse',
    ['--border'] = false
  },
}
