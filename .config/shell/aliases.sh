# exa / ls
if $(command -v exa &>/dev/null); then
    options="--color=auto --classify --group-directories-first"
    alias ls="exa ${options}"
    alias la="exa ${options} --all"
    alias ll="exa ${options} --long --group"
    alias lla="exa ${options} --long --group --all"
    unset options
else
    options="--color=auto --classify --group-directories-first"
    alias ls="ls ${options}"
    alias la="ls ${options} --almost-all"
    alias ll="ls ${options} -l"
    alias lla="ls ${options} -l --almost-all"
fi

# git
alias gs="git status"
alias ga="git add"
alias gc="git commit"

# yadm
alias ys="yadm status"
alias ya="yadm add"
alias yc="yadm commit"

# Reboot
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"

# Apt
alias update="sudo apt update && apt list --upgradable"
alias upgrade="sudo apt full-upgrade"
alias install="sudo apt install"
