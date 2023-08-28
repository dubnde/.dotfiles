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
zcomet load ohmyzsh plugins/fd
zcomet load ohmyzsh plugins/fzf
zcomet load ohmyzsh plugins/history
zcomet load ohmyzsh plugins/pip
zcomet load ohmyzsh plugins/python
zcomet load ohmyzsh plugins/rsync

# Completions
fpath+=~/.zfunc

# Run compinit and compile its cache
zcomet compinit

# Editing
export EDITOR=nvim
export VISUAL=${EDITOR}

# PATH
export PATH=~/.gem/rub/2.6/bin:${PATH}
export PATH=~/.local/bin:${PATH}
export PATH=~/.yarn/bin:${PATH}
export PATH=~/.cargo/bin:${PATH}
export PATH=/opt/homebrew/bin:${PATH}

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="/opt/homebrew/sbin:$PATH"

# Compiling/Linking/Finding packages
export LDFLAGS="-L/opt/homebrew/lib"
export PKG_CONFIG_PATH="/opt/homebrew/opt/pkgconfig"
export CPPFLAGS="-I/opt/homebrew/include"

# TMUX Setup
if [[ ! $PATH == *~/.tmux/plugins/tmuxifier/bin* ]]; then
  export PATH=${PATH:+${PATH}:}~/.tmux/plugins/tmuxifier/bin
  # So we can add them to git
  export TMUXIFIER_LAYOUT_PATH=~/.dotfiles/tmux/tmuxifier/layouts
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

####################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fd.sh ] && source ~/.fd.sh

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
if ! ls ~/.cargo/bin | grep 'cargo-upgrade' &> /dev/null; then
  cargo install cargo-edit
fi
