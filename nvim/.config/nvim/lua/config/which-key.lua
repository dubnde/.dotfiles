local wk = prequire("which-key")

if not wk then
  return
end

local setup = {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = ">", -- symbol used in the command line area that shows your active key combo
    separator = "-", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["/"]     = { "<cmd>Telescope live_grep<cr>", "Grep" },
  ["*"]     = { "<cmd>Telescope grep_string<cr>", "Grep under cursor" },
  ["'"]     = { "<cmd>ToggleTerm direction=horizontal<cr>", "Terminal" },
  ["<tab>"] = { "<cmd>Telescope commands<cr>", "Commands" },

  ["<space>"] = {
    name = "Jumps",
    ["1"] = { "<cmd>HopChar1<cr>", "Single Char" },
    ["2"] = { "<cmd>HopChar2<cr>", "Two Chars" },
    ["/"] = { "<cmd>HopPattern<cr>", "Hope around" },
    ["b"] = { "<cmd>HopWordBC<cr>", "Hop Back Word" },
    ["j"] = { "<cmd>HopLineAC<cr>", "Hope Line Down" },
    ["k"] = { "<cmd>HopLineBC<cr>", "Hope Line Up" },
    ["l"] = { "<cmd>HopLine<cr>", "Hop Line" },
    ["L"] = { "<cmd>HopLineStart<cr>", "Hop Line Start" },
    ["w"] = { "<cmd>HopWordAC<cr>", "Hop Word" },
  },

  [","] = {
    name = "Buffer Local",
    ["="] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format Buffer" },
    ["e"] = { "<cmd>:luafile %<cr>", "Evaluate File" },
    ["l"] = { "<cmd>HopLineBC<cr>", "Hope Line Up" },
  },

  ["="] = {
    name = "Format/Align",
    ["="] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format Buffer" },
    ["f"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format Buffer" },
  },

  ["a"] = {
    name = "Align",
  },

  ["b"] = {
    name = "Buffers",
    ["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
    ["n"] = { "<cmd>new<cr>", "Buffer New" },
    ["d"] = { "<cmd>bdelete<cr>", "Buffer Delete" },
    ["s"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Buffer" },
    ["S"] = { "<cmd>Telescope lines<cr>", "Search Buffers" },
  },

  ["c"] = {
    name = "Colours/Comments",
    ["l"] = { "<cmd>Telescope colorscheme<cr>", "Colour Schemes" },
  },

  ["e"] = {
    name = "Explorer/Errors",
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["l"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostics" },
  },

  ["f"] = {
    name = "Files",
    ["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
    ["e"] = { "<cmd>:luafile %<cr>", "Evaluate File" },
    ["f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
    ["h"] = { "<cmd>Telescope help_tags<cr>", "Tags" },
    ["g"] = { "<cmd>Telescope git_files<cr>", "Find Git Files" },
    ["r"] = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    ["w"] = { "<cmd>:write<cr>", "Save" },
    ["W"] = { "<cmd>:wall<cr>", "Save All" },
  },

  ["g"] = {
    name = "Git",
    ["g"] = { "<cmd>Neogit<cr>", "Git" },
    ["l"] = { "<cmd>Neogit log<cr>", "Git log" },
    ["P"] = { "<cmd>Neogit push<cr>", "Git Push" },
  },

  ["h"] = {
    name = "Help",
    ["b"] = { "<cmd>Telescope builtin<cr>", "Builtins" },
    ["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    ["m"] = { "<cmd>Telescope man_pages<cr>", "Manual Pages" },
  },

  ["j"] = {
    name = "jump/join",
    ["j"] = { "<cmd>Telescope jumplist<cr>", "Jumps" },
    ["l"] = { "<cmd>HopLine<cr>", "Line" },
    ["m"] = { "<cmd>Telescope marks<cr>", "Marks" },
    ["r"] = { "<cmd>Telescope registers<cr>", "registers" },
  },

  ["k"] = {
    name = "Keymaps",
    ["k"] = { "<cmd>Telescope keymaps<cr>", "Keymap" },
  },

  ["l"] = {
    name = "lsp",
    ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    ["d"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostics" },
    ["m"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    ["n"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Diagnostic Next" },
    ["p"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Diagnostic Previous" },
    ["q"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Set Local List" },
  },

  ["q"] = {
    name = "Quit/Restart",
    ["q"] = { "<cmd>:q<cr>", "Quit" },
  },

  ["s"] = {
    name = "Search",
    ["/"] = { "<cmd>Telescope blines<cr>", "Search current buffer" },
    ["c"] = { "<cmd>:nohl<cr>", "Clear Highlight" },
    ["p"] = { "<cmd>Telescope grep_project<cr>", "Search Project" },
    ["r"] = { "<cmd>Telescope resume<cr>", "Search Resume" },
    ["s"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Buffer" },
    ["S"] = { "<cmd>Telescope lines<cr>", "Search Buffers" },
  },

  ["t"] = {
    name = "toggle",
    ["'"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Terminal Horizontal" },
    ["e"] = { "<cmd>NvimTreeToggle<cr><cr>", "Explorer" },
    ["t"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Terminal Horizontal" },
    ["v"] = { "<cmd>ToggleTerm direction=vertical<cr>", "Terminal Vertical" },
  },

  ["v"] = {
    name = "vimwiki",
    ["w"] = { "<cmd><cr>", "Open default wiki index file" },
    ["t"] = { "<cmd><cr>", "Open default wiki index file in a new tab." },
    ["s"] = { "<cmd><cr>", "Select and open wiki index file." },
    ["d"] = { "<cmd><cr>", "Delete wiki file you are in." },
    ["r"] = { "<cmd><cr>", "Rename wiki file you are in." },
    ["f"] = { "<cmd><cr>", "Follow/Create wiki link." },
    ["h"] = { "<cmd><cr>", "Split and follow/create wiki link." },
    ["v"] = { "<cmd><cr>", "Vertical split and follow/create wiki link." },
    ["g"] = { "<cmd><cr>", "Vertical split and follow/create wiki link." },
    ["n"] = { "<cmd><cr>", "Find next wiki link." },
    ["p"] = { "<cmd><cr>", "Find previous wiki link." },
  },

  ["w"] = {
    name = "Windows",
    ["="] = { "<cmd>wincmd =<cr>", "Balance" },
    ["-"] = { "<cmd>wincmd s<cr>", "Split Horizontal" },
    ["|"] = { "<cmd>wincmd v<cr>", "Split Vertical" },
    ["b"] = { "<cmd>wincmd b<cr>", "Move to bottom-left" },
    ["c"] = { "<cmd>wincmd c<cr>", "Close" },
    ["d"] = { "<cmd>wincmd c<cr>", "Close" },
    ["h"] = { "<cmd>wincmd h<cr>", "Move cursor left" },
    ["H"] = { "<cmd>wincmd H<cr>", "Move left" },
    ["j"] = { "<cmd>wincmd j<cr>", "Move cursor down" },
    ["J"] = { "<cmd>wincmd J<cr>", "Move down" },
    ["k"] = { "<cmd>wincmd k<cr>", "Move cursor up" },
    ["K"] = { "<cmd>wincmd K<cr>", "Move up" },
    ["l"] = { "<cmd>wincmd l<cr>", "Move cursor right" },
    ["L"] = { "<cmd>wincmd L<cr>", "Move right" },
    ["n"] = { "<cmd>wincmd n<cr>", "New" },
    ["o"] = { "<cmd>wincmd o<cr>", "Only" },
    ["p"] = { "<cmd>wincmd p<cr>", "Previous" },
    ["P"] = { "<cmd>wincmd P<cr>", "Preview" },
    ["q"] = { "<cmd>wincmd q<cr>", "Quit" },
    ["r"] = { "<cmd>wincmd r<cr>", "Rotate Down/Right" },
    ["t"] = { "<cmd>wincmd t<cr>", "Move to top/right" },
    ["R"] = { "<cmd>wincmd R<cr>", "Rotate Up/Left" },
    ["v"] = { "<cmd>wincmd v<cr>", "Split Vertical" },
    ["w"] = { "<cmd>wincmd w<cr>", "Move to Below/Right" },
    ["W"] = { "<cmd>wincmd W<cr>", "Move to Above/Left" },
    ["x"] = { "<cmd>wincmd x<cr>", "Exchange next" },
  },

  ["y"] = {
    name = "Yank",
    ["r"] = { "<cmd>let @+ = expand('%')<cr>", "Yank Relative Path" },
    ["d"] = { "<cmd>let @+ = expand('%:p:h')<cr>", "Yank Directory" },
    ["f"] = { "<cmd>let @+ = expand('%:t')<cr>", "Yank Filename" },
    ["p"] = { "<cmd>let @+ = expand('%:p')<cr>", "Yank Absolute Path" },
  },

  ["z"] = {
    name = "Packer",
    ["c"] = { "<cmd>PackerCompile<cr>", "Compile" },
    ["C"] = { "<cmd>PackerClean<cr>", "Clean" },
    ["i"] = { "<cmd>PackerInstall<cr>", "Install" },
    ["p"] = { "<cmd>PackerProfile<cr>", "Profile" },
    ["s"] = { "<cmd>PackerSync<cr>", "Sync" },
    ["S"] = { "<cmd>PackerStatus<cr>", "Status" },
    ["u"] = { "<cmd>PackerUpdate<cr>", "Update" },
  },
}

wk.setup(setup)
wk.register(mappings, opts)
