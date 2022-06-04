local nightfox = prequire("nightfox")

if not nightfox then
  return
end

nightfox.setup({
  options = {
    dim_inactive = true,
    styles = {
      comments = "italic",
      -- keywords = "bold",
      -- functions = "italic,bold",
    },
    inverse = {
      search = true,
      match_paren = true,
    },
  },
  groups = {
    all = {
      CursorLine = { bg = "#353A54" },
      CmpItemAbbr = { fg = "#9FA4B6" },
      CmpItemKind = { fg = "#8289A0" },
      CmpItemMenu = { fg = "#8289A0" },
      PmenuSel = { bg = "#73daca", fg = "#111111" },
      Pmenu = { bg = "#2E3248" },
      GitSignsAddNr = { fg = "#26A07A" },
      GitSignsDeleteNr = { fg = "#E87D7D" },
      GitSignsChangeNr = { fg = "#AD991F" },
      Visual = { fg = "#111111", bg = "#73daca" },
    },
  },
})

vim.cmd("colorscheme duskfox")
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme dayfox")
-- vim.cmd("colorscheme dawnfox")
-- vim.cmd("colorscheme nordfox")
-- vim.cmd("colorscheme terafox")
