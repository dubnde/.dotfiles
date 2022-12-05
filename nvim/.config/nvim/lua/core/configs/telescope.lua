local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local telescope_status_ok, builtin = pcall(require, 'telescope.builtin')
if not telescope_status_ok then
  return
end

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-P>', builtin.find_files, opts)
vim.keymap.set('n', '<leader>bb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, opts)
vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
vim.keymap.set('n', '<leader>*', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory

local actions_status_ok, actions = pcall(require, 'telescope.actions')
if not actions_status_ok then
  return
end

telescope.setup {
  defaults = {

    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'smart' },
    file_ignore_patterns = { '.git/', 'node_modules' },

    mappings = {
      i = {
        ['<Down>'] = actions.cycle_history_next,
        ['<Up>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  },
}
