_G.IS_MAC = vim.fn.has("mac")
_G.IS_LINUX = vim.fn.has("linux")
_G.IS_WINDOWS = vim.fn.has("win32") or vim.fn.has("win64")
_G.IS_WSL = vim.fn.has("wsl")

_G.USE_FZF = IS_LINUX or IS_WSL
_G.USE_TELESCOPE = not USE_FZF
_G.USE_TMUX = IS_LINUX and not IS_WSL

_G.api = vim.api
_G.g = vim.g
_G.opt = vim.opt
_G.cmd = vim.cmd

_G.dump = function(...)
  print(vim.inspect(...))
end

_G.prequire = function(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

_G.keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local M = {}

function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.exists(list, val)
  local set = {}
  for _, l in ipairs(list) do
    set[l] = true
  end
  return set[val]
end

function M.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

return M
