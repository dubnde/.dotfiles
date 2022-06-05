local fzf = prequire("fzf-lua")
local actions = prequire("fzf-lua.actions")

if not fzf or not actions then
  return
end

fzf.setup({})
