local mason = Prequire 'mason'
if not mason then
  return
end

local mason_lspconfig = Prequire 'mason-lspconfig'
if not mason_lspconfig then
  return
end

local mason_null_ls = Prequire 'mason-null-ls'
if not mason_null_ls then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup {
  -- list of servers for mason to install
  ensure_installed = {
    'bashls',
    -- 'bufls',
    'clangd',
    'cmake',
    'dockerls',
    'sumneko_lua',
    'jsonls',
    'pyright',
    'rust_analyzer',
    'taplo',
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}

mason_null_ls.setup {
  -- list of formatters & linters for mason to install
  ensure_installed = {
    'stylua', -- lua formatter
    'shfmt',
    'clang_format',
    'yamllint',
    'shellcheck',
    'jq', -- json
    'yamlls',
    -- 'buf',
    -- 'protolint',
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
}
