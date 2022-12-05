local leap = Prequire 'leap'

if not leap then
  return
end

local opts = {
  max_phase_one_targets = nil,
  highlight_unlabeled_phase_one_targets = false,
  max_highlighted_traversal_targets = 10,
  case_sensitive = false,
  equivalence_classes = { ' \t\r\n' },
  substitute_chars = {},
  safe_labels = {},
  labels = { 'q', 'w', 'e', 'r', 't', 'y', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l' },
  special_keys = {
    repeat_search = '<enter>',
    next_phase_one_target = '<enter>',
    next_target = { '<enter>', ';' },
    prev_target = { '<tab>', ',' },
    next_group = '<space>',
    prev_group = '<tab>',
    multi_accept = '<enter>',
    multi_revert = '<backspace>',
  },
}

leap.setup(opts)

leap.set_default_keymaps()
