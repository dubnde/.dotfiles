local telescope = prequire('telescope')

if not telescope then
  return
end

local actions = prequire('telescope.actions')

if not actions then
  return
end

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('ui-select')
telescope.load_extension("project")
telescope.load_extension("file_browser")
telescope.load_extension('fzf')
