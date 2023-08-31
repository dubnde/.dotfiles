local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == 'Darwin'
_G.IS_LINUX = OS == 'Linux'
_G.IS_WINDOWS = OS:find 'Windows' and true or false
_G.IS_WSL = IS_LINUX and uname.release:find 'Microsoft' and true or false

local M = {}

M.servers = {
  'bashls',
  'clangd',
  'cmake',
  'html',
  'jsonls',
  -- 'lua_ls',
  'pyright',
  -- 'rust_analyzer',
  'taplo',
  'yamlls',
}

M.linters = {
  'clang_format',
  'cmake_lint',
  'flake8',
  'hadolint',
  'shellcheck',
  'shfmt',
  -- 'stylua',
}

M.parsers = {
  'bash',
  'c',
  'cmake',
  'cpp',
  'dockerfile',
  'gitignore',
  'html',
  'java',
  'json',
  'json5',
  'jsonc',
  'lua',
  'markdown',
  'markdown_inline',
  'ninja',
  'python',
  'ron',
  'rust',
  'toml',
  'vim',
  'vimdoc',
  'yaml',
}

return M
