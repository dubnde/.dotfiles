local configs = prequire'nvim-treesitter.configs'

if configs then
  configs.setup {
    ensure_installed = { "lua", "c", "cpp", "rust", "python", "cmake" },
    highlight = {
      enable = true,
    }
  }
end

local lastplace = prequire'nvim-lastplace'

if lastplace then
  lastplace.setup {
      lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
      lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
      lastplace_open_folds = true
  }
end
