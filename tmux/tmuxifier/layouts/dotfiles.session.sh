# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$HOME/.dotfiles/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dotfles"; then

  # Create a new window inline within session layout definition.
  new_window "neovim"
  run_cmd "nvim nvim/.config/nvim/init.lua"
  new_window "tmux"
  run_cmd "nvim tmux/.tmux.conf"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
