local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == 'Darwin'
_G.IS_LINUX = OS == 'Linux'
_G.IS_WINDOWS = OS:find 'Windows' and true or false
_G.IS_WSL = IS_LINUX and uname.release:find 'Microsoft' and true or false

_G.prequire = function(package)
  local ok, res = pcall(require, package)
  if not ok then
    vim.notify(res, vim.log.levels.ERROR)
    return nil
  else
    return res
  end
end

local M = {}

return M
