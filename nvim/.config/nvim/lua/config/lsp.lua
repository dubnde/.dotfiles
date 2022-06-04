local lspinstaller = prequire('nvim-lsp-installer')

if lspinstaller then
  lspinstaller.setup {}
end


local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

local lspconfig = prequire('lspconfig')
local cmp_nvim_lsp = prequire('cmp_nvim_lsp')

if lspconfig and cmp_nvim_lsp then
  -- nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

  local servers = { 'sumneko_lua', 'cmake', 'clangd', 'rust_analyzer', 'pyright' }

  -- Use a loop t conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup out lua path
            path = vim.split(package.path, ";"),
          },
          workspace = {
            -- So 'gf' can find the files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            },
          },
          diagnostics = {
            globals = {
              'vim',
              'prequire',
              'keymap',
              'USE_FZF',
              'USE_TELESCOPE',
              'USE_TMUX',
            }
          },
          telemetry = { enable = false },
        },
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
        },
      },
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    }
  end
end


local null_ls = prequire('null-ls')

if null_ls then
  null_ls.setup({
    sources = {
      null_ls.builtins.completion.spell,
    },
    on_attach = function(client, bufnr)
      -- Autoformat
      if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
        vim.cmd [[augroup END]]
      end
      -- call local on_attach
      return on_attach(client, bufnr)
    end
  })
end


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

local cmp = prequire('cmp')
local luasnip = prequire('luasnip')

if cmp and luasnip then
  cmp.setup {
    mapping = {
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      -- use Tab and shift-Tab to navigate autocomplete menu
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }
    },
  }
end
