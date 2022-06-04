local project = prequire("neogit")
if not project then
  return
end

project.setup({
  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = { "lsp", "pattern" },

  -- All the patterns used to detect root dir, when **"pattern"** is in detection_methods
  patterns = {
    ".git",
    ".project",
    ".vscode",
    "compile_commands.json",
    "package.json",
    "setup_pw.sh",
    "Cargo.toml",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    "Makefile",
  },
})
