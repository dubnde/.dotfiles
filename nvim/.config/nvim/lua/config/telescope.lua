local telescope = prequire('telescope')

if not telescope then
  return
end

local actions = prequire('telescope.actions')

if not actions then
  return
end

telescope.setup {
  defaults = {
    -- color_devicons = false,
    prompt_prefix = "$ ",
    file_ignore_patterns = {
      "^.git/",
      "node_modules",
      "build_*",
      "tools/cmake",
    },
    layout_config = {
      vertical = { width = 0.5 }
    },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ["<C-h>"] = "which_key",
      }
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      },
      file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          ["i"] = {
            -- your custom insert mode mappings
          },
          ["n"] = {
            -- your custom normal mode mappings
          },
        },
      },
    },
    project = {
      base_dirs = {
        ".git",
        ".vscode",
      },
      theme = "dropdown"
    },
  },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('ui-select')
telescope.load_extension("project")
telescope.load_extension("file_browser")
-- telescope.load_extension('fzf')
