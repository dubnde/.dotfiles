local diffview = prequire("diffview")

if not diffview then
  return
end

-- local actions = prequire("diffview.actions")

-- if not actions then
--   return
-- end

diffview.setup({
  use_icons = false,
  icons = {},
  keymaps = {
    disable_defaults = true,
  },
})
