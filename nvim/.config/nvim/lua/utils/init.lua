local M = {}

M.servers = {
  'bashls',
  'clangd',
  'cmake',
  'html',
  'jsonls',
  'lua_ls',
  'pyright',
  'rust_analyzer',
  'yamlls',
}

M.linters = {
  'prettier',
  'stylua',
  'clang_format',
}

M.parsers = {
  'bash',
  'c',
  'cmake',
  'cpp',
  'dockerfile',
  'html',
  'java',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'python',
  'rust',
  'toml',
  'yaml',
}

return M
