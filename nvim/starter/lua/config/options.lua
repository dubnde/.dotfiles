local opt = vim.opt
local wo = vim.wo

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smarttab = true
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.showmatch = true

-- Appearance
opt.background = 'dark'
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- History
opt.undofile = true

-- Behaviour
opt.ttyfast = true
opt.timeout = true
opt.timeoutlen = 300
opt.updatetime = 100
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
opt.showmode = false
opt.listchars = { eol = '↵', trail = '~', tab = '>~' }
opt.list = true

opt.wildignore = {
  '*/node_modules/*',
  '*.class',
  '*.pyc',
  '*.swp',
  '*.o',
  '*.obj',
  '*.map',
  '*.elf',
  '*.cache',
  '*.jar',
  '*/tmp/*',
  '*.zip',
  '*.tar',
  '*.gz',
  '*.bz2',
  '*.xz',
  '*/.git/*',
  '*/.metals/*',
  '*/.bloop/*',
  '*/.bsp/*',
  '*/vendor/*',
  '*/venv/*',
  '*/.venv/*',
  '*/target/*',
  '*/build_*/*',
  '*/CMakeFiles/*'
}

-- folds
wo.foldlevel = 20
wo.foldmethod = 'expr'
-- wo.foldcolumn = "auto"

