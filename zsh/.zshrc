# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Load a prompt
zcomet load sindresorhus/pure

# It is good to load these popular plugins last, and in this order:
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-history-substring-search

# From oh-my-zsh
zcomet load ohmyzsh plugins/common-aliases
zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/history

zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
(( ${+commands[fzf]} )) || ~[fzf]/install --bin

# Completions
fpath+=${HOME}/.zfunc

# Run compinit and compile its cache
zcomet compinit

# Editing
export EDITOR=nvim
export VISUAL=${EDITOR}

# PATH
export PATH="${HOME}/.gem/rub/2.6/bin"${PATH:+:${PATH}}
export PATH="${HOME}/.local/bin"${PATH:+:${PATH}}
export PATH="${HOME}/.yarn/bin"${PATH:+:${PATH}}
export PATH="${HOME}/.cargo/bin"${PATH:+:${PATH}}

# Compiling/Linking/Finding packages
export PATH=/opt/homebrew/bin${PATH:+:${PATH}}
export LDFLAGS="-L$(brew --prefix)/opt/lib"
export PKG_CONFIG_PATH="$(brew --prefix)/opt/opt/pkgconfig"
export CPPFLAGS="-I$(brew --prefix)/opt/include"
export PATH="$(brew --prefix)/opt/python3/libexec/bin"${PATH:+:${PATH}}

# TMUX Setup
if [[ ! $PATH == *${HOME}/.tmux/plugins/tmuxifier/bin* ]]; then
  export PATH="${HOME}/.tmux/plugins/tmuxifier/bin"${PATH:+:${PATH}}
  # So we can add them to git
  export TMUXIFIER_LAYOUT_PATH="${HOME}/.dotfiles/tmux/tmuxifier/layouts"
  eval "$(tmuxifier init -)"
fi

####################################################
alias h='history'
alias vim=nvim
alias nv=nvim
alias vi=nvim

# Python Virtual Enviroment
export VIRTUAL_ENV_DISABLE_PROMPT=

####################################################
if [ ! -f $HOME/.zfunc/_docker ]; then
  cp /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion $HOME/.zfunc/_docker
fi

if [ ! -f $HOME/.zfunc/_docker-compose ]; then
  cp /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion $HOME/.zfunc/_docker-compose
fi

# configure rust environment
#
# - autocomplete
# - rust-analyzer
# - cargo audit
# - cargo-nextest
# - cargo fmt
# - cargo clippy
# - cargo edit
#
source $HOME/.cargo/env

if [ ! -f $HOME/.zfunc/_rustup ]; then
  rustup completions zsh > $HOME/.zfunc/_rustup
fi
if [ ! -f $HOME/.zfunc/_cargo ]; then
  rustup completions zsh cargo > $HOME/.zfunc/_cargo
fi
if ! command -v rust-analyzer &> /dev/null; then
  brew install rust-analyzer
fi
if ! cargo audit --version &> /dev/null; then
  cargo install cargo-audit --features=fix
fi
if ! cargo nextest --version &> /dev/null; then
  cargo install cargo-nextest
fi
if ! cargo fmt --version &> /dev/null; then
  rustup component add rustfmt
fi
if ! cargo clippy --version &> /dev/null; then
  rustup component add clippy
fi
if ! ls "${HOME}/.cargo/bin" | grep 'cargo-upgrade' &> /dev/null; then
  cargo install cargo-edit
fi
