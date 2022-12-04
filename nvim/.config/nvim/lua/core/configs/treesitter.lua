local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = { 
    "lua", 
    "vim", 
    "rust", 
    "python",
    "c",
    "cpp",
    "cmake",
    "json",
  }, -- put the language you want in this array

  -- ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing

	sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true,
  
  highlight = {
		enable = true, -- false will disable the whole extension
	},

	autopairs = {
		enable = true,
	},

	indent = { enable = true, disable = { "css" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
