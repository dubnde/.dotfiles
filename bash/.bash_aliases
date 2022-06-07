alias l='ls -CF'
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lx='ll -XB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.

# Follow sym links
alias cd='cd -P'

# History
alias h='history'

# TMUX
alias t="tmux"
alias ta="t a -t"
alias tl="t ls"
alias tn="t new -t"

# Vim
alias vi="nvim"
alias vim="nvim"
alias nv="nvim"

