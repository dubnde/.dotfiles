local keys = require('helpers.keys')

keys.set_leader(' ')
keys.set_localleader('\\')

_G.prequire = function(package)
  local ok, res = pcall(require, package)
  if not ok then
    vim.notify(res, vim.log.levels.ERROR)
    return nil
  else
    return res
  end
end
