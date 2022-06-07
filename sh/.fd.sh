export FD_OPTIONS="--color=always -F -H"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd -tf -tl $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

