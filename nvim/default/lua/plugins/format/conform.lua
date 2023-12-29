return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        json = { { 'prettierd', 'prettier' } },
        markdown = { { 'prettierd', 'prettier' } },
        bash = { 'beautysh' },
        proto = { 'buf' },
        python = { { 'isort', 'black' } },
        rust = { 'rustfmt' },
        yaml = { 'yamlfix' },
        toml = { 'taplo' },
      },
    })

    local conform_args = { lsp_fallback = true, async = false, timeout_ms = 500 }

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.lua', '*.rs', '*.toml' },
      callback = function(args)
        conform.format(vim.tbl_extend('force', { bufnr = args.buf }, conform_args))
      end,
    })

    local conform_buffer = function()
      conform.format(conform_args)
    end

    vim.keymap.set({ 'n', 'v' }, '<leader>==', conform_buffer, { desc = 'Format file or range (in visual mode)' })
  end,
}
