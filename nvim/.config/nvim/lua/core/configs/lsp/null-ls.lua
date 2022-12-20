local null_ls = Prequire 'null-ls'
if not null_ls then
  return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup {
  -- setup formatters & linters
  sources = {
    formatting.stylua,
    formatting.clang_format,
    formatting.rustfmt,
    formatting.yamlfmt,
    formatting.shfmt,
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format {
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == 'null-ls'
            end,
            bufnr = bufnr,
          }
        end,
      })
    end
  end,
}
