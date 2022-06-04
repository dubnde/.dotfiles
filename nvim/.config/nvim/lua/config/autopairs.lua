autopairs = prequire("nvim-autopairs")

if not autopairs then
  return
end

autopairs.setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" , "vim" },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = prequire('nvim-autopairs.completion.cmp')
local cmp = prequire('cmp')

if cmp_autopairs and cmp then
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

  -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
  cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
end

