# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Load a prompt
zcomet load sindresorhus/pure

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

# Compiling/Linking/Finding packages
export LDFLAGS="-L/opt/homebrew/lib"
export PKG_CONFIG_PATH="/opt/homebrew/opt/pkgconfig"
export CPPFLAGS="-I/opt/homebrew/include"

####################################################
alias h='history'
alias vim=nvim
alias nv=nvim
alias vi=nvim

####################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fd.sh ] && source ~/.fd.sh

