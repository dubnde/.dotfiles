local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == 'Darwin'
_G.IS_LINUX = OS == 'Linux'
_G.IS_WINDOWS = OS:find 'Windows' and true or false
_G.IS_WSL = IS_LINUX and uname.release:find 'Microsoft' and true or false

_G.bufmap = function(modes, lhs, rhs, desc, bufnr)
  vim.keymap.set(modes, lhs, rhs, {
    desc = desc,
    buffer = bufnr,
    noremap = true,
    silent = true,
    nowait = true,
  })
end

_G.bufmapn = function(lhs, rhs, desc, bufnr)
  bufmap('n', lhs, rhs, desc, bufnr)
end

_G.bufmapv = function(lhs, rhs, desc, bufnr)
  bufmap('v', lhs, rhs, desc, bufnr)
end

_G.map = function(modes, lhs, rhs, desc)
  vim.keymap.set(modes, lhs, rhs, {
    desc = desc,
    noremap = true,
    silent = true,
    nowait = true,
  })
end

_G.mapn = function(lhs, rhs, desc)
  map('n', lhs, rhs, desc)
end

_G.mapv = function(lhs, rhs, desc)
  map('v', lhs, rhs, desc)
end

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
  'flake8',
  'clang_format',
  'shellcheck',
  'shfmt',
  'stylua',
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
  'lua',
  'markdown',
  'markdown_inline',
  'python',
  'rust',
  'toml',
  'vim',
  'vimdoc',
  'yaml',
}

return M
