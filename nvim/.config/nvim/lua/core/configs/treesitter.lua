local treesitter = Prequire 'nvim-treesitter.configs'
if not treesitter then
  return
end

-- Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldnestmax = 10
vim.wo.foldenable = false

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

  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
}
