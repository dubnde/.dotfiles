local autopairs = Prequire 'nvim-autopairs'
if not autopairs then
  return
end

-- configure autopairs
autopairs.setup {
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
    javascript = { 'template_string' }, -- don't add pairs in javscript template_string treesitter nodes
    java = false, -- don't check treesitter on java
  },
}

-- import nvim-autopairs completion functionality safely
local cmp_autopairs = Prequire 'nvim-autopairs.completion.cmp'
if not cmp_autopairs then
  return
end

-- import nvim-cmp plugin safely (completions plugin)
local cmp = Prequire 'cmp'
if not cmp then
  return
end

-- make autopairs and completion work together
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
