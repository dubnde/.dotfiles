local M = {}

M.keymap = function(mode, lhs, rhs, opts)
  local options = { silent = true, noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

M.map = function(mode, lhs, rhs, desc)
  M.keymap(mode, lhs, rhs, { desc = desc })
end

M.lsp_map = function(lhs, rhs, bufnr, desc)
  M.keymap('n', lhs, rhs, { buffer = bufnr, desc = desc })
end

M.term_map = function(lhs, rhs, desc)
  M.keymap('t', lhs, rhs, { buffer = 0, desc = desc })
end

M.dap_map = function(mode, lhs, rhs, desc)
  M.map(mode, lhs, rhs, desc)
end

M.set_leader = function(key)
  vim.g.mapleader = key
  M.map({ 'n', 'v' }, key, '<nop>')
end

M.set_localleader = function(key)
  vim.g.maplocalleader = key
  M.map({ 'n', 'v' }, key, '<nop>')
end
return M
