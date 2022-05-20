# Return if not running interactively
[[ $- != *i* ]] && return

# Bash History
HISTFILE="$HOME/.bash_history"
# No duplicate lines or lines starting with space
HISTCONTROL=ignoreboth
# History size
HISTSIZE=50
HISTFILESIZE=50
# Append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prompt
[ -e "$HOME/.config/shell/prompt.sh" ] && . "$HOME/.config/shell/prompt.sh"

# Aliases
[ -e "$HOME/.config/shell/aliases.sh" ] && . "$HOME/.config/shell/aliases.sh"

# SSH Auth with GPG
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Required for pinentry-curses to work
export GPG_TTY=$(tty)

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
