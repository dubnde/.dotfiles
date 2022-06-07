local telescope = prequire('telescope')

if not telescope then
  return
end

local actions = prequire('telescope.actions')

if not actions then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-h>"] = "which_key",
      },
    },
    file_ignore_patterns = {
      ".git",
      "/build_*",
      "/deploy_*",
      "/tools",
      "/cmake",
    },
    layout_config = {
      vertical = { width = 0.5 }
    },
  },
  pickers = {
    buffers = {
      theme = "ivy",
    },
    colorscheme = {
      theme = "ivy",
    },
    commands = {
      theme = "ivy",
    },
    find_files = {
      theme = "ivy",
      follow = true,
    },
    git_files = {
      them = "ivy",
    },
    grep_string = {
      them = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    oldfiles = {
      them = "ivy",
    },
  },
  extensions = {
    project = {
      hidden_files = false,
      theme = "ivy",
    },
  }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('ui-select')
telescope.load_extension("project")
telescope.load_extension("file_browser")
