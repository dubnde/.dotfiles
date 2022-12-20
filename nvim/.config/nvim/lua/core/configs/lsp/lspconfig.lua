local lspconfig = Prequire 'lspconfig'
if not lspconfig then
  return
end

local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }

keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- enable keybinds only for when lsp server available
local on_attach = function(_, bufnr)
  -- keybind options
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- got to declaration
  keymap.set('n', '<leader>==', vim.lsp.buf.format, bufopts) -- show diagnostics for cursor
  keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) -- go to implementation
  keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', bufopts) -- show definition, references
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', bufopts) -- see definition and make edits in window
  keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', bufopts) -- see available code actions
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', bufopts) -- smart rename
  keymap.set('n', '<leader>D', '<cmd>Lspsaga show_line_diagnostics<CR>', bufopts) -- show  diagnostics for line
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', bufopts) -- show diagnostics for cursor
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', bufopts) -- jump to previous diagnostic in buffer
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', bufopts) -- jump to next diagnostic in buffer
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', bufopts) -- show documentation for what is under cursor
  keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', bufopts) -- see outline on right hand side
end

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = ' ', Warn = ' ', Hint = 'ﴞ ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local cmp_nvim_lsp = Prequire 'cmp_nvim_lsp'
if not cmp_nvim_lsp then
  return
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

---@diagnostic disable-next-line: unused-local
local servers = {
  'bashls',
  'clangd',
  'cmake',
  'dockerls',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'yamlls',
}

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

-- configure lua server (with special settings)
lspconfig['sumneko_lua'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.stdpath 'config' .. '/lua'] = true,
        },
      },
    },
  },
}
