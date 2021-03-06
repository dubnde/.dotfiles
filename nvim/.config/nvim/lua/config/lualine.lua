local lualine = prequire("lualine")

if not lualine then
  return
end


local custom_gruvbox = prequire('lualine.themes.gruvbox')

if not custom_gruvbox then
  return
end

-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = '#112233'

lualine.setup {
  options = {
    theme                = custom_gruvbox,
    icons_enabled        = false,
    disabled_filetypes   = {},
    always_divide_middle = true,
    globalstatus         = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { '%f', "[%-m]", "filesize" },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
