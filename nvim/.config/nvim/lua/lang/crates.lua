return {
  'saecki/crates.nvim',
  event = { "BufRead Cargo.toml" },
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local crates = require('crates')

    crates.setup()

    local function opts(desc)
      return { desc = desc, noremap = true, silent = true }
    end

    vim.keymap.set('n', '<leader>ct', crates.toggle, opts 'Crates toggle')
    vim.keymap.set('n', '<leader>cr', crates.reload, opts 'Crates reload')

    vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts 'Crates show_versions_popup')
    vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts 'Crates show_features_popup')
    vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts 'Crates show_dependencies_popup')

    vim.keymap.set('n', '<leader>cu', crates.update_crate, opts 'Crates update_crate')
    vim.keymap.set('v', '<leader>cu', crates.update_crates, opts 'Crates update_crates')
    vim.keymap.set('n', '<leader>ca', crates.update_all_crates, opts 'Crates update_all_crates')
    vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, opts 'Crates upgrade_crate')
    vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, opts 'Crates upgrade_crates')
    vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts 'Crates upgrade_all_crates')

    vim.keymap.set('n', '<leader>ce', crates.expand_plain_crate_to_inline_table,
      opts 'Crates expand_plain_crate_to_inline_table')
    vim.keymap.set('n', '<leader>cE', crates.extract_crate_into_table, opts 'Crates extract_crate_into_table')

    vim.keymap.set('n', '<leader>cH', crates.open_homepage, opts 'Crates open_homepage')
    vim.keymap.set('n', '<leader>cR', crates.open_repository, opts 'Crates open_repository')
    vim.keymap.set('n', '<leader>cD', crates.open_documentation, opts 'Crates open_documentation')
    vim.keymap.set('n', '<leader>cC', crates.open_crates_io, opts 'Crates open_crates_io')
  end,
}
