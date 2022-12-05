local treesitter = Prequire 'nvim-treesitter.configs'
if not treesitter then
  return
end

-- configure treesitter
treesitter.setup {
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    'lua',
    'rust',
    'python',
    'c',
    'cpp',
    'cmake',
    'json',
    'yaml',
    'dockerfile',
  },
  -- auto install above language parsers
  auto_install = true,
}
