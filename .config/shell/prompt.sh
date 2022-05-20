# Functions
function virtualenv_info() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    PYVENV="$(grep 'prompt' ${VIRTUAL_ENV}/pyvenv.cfg | cut -d"'" -f 2)"
    PYVENV="(pyenv:${PYVENV}) "
  else
    PYVENV=''
  fi
  echo "${PYVENV}"
}

# Colors
COLOR_RED="\[\e[31m\]"
COLOR_GREEN="\[\e[32m\]"
COLOR_BLUE="\[\e[34m\]"
COLOR_YELLOW="\[\e[33m\]"
COLOR_END="\[\e[m\]"

# Variables
PROMPT_USER="${COLOR_GREEN}\u${COLOR_END}"
PROMPT_HOST="${COLOR_RED}@\h${COLOR_END}"
PROMPT_DIR="\w"
PROMPT_SYMBOL="${COLOR_BLUE}❯${COLOR_END}"
PYVENV="${COLOR_YELLOW}\$(virtualenv_info)${COLOR_END}"

# Put the actual prompt together
[ -n "$SSH_CONNECTION" ] && PROMPT_HOST="${PROMPT_USER}${PROMPT_HOST} " || PROMPT_HOST=""
PS1="${PROMPT_HOST}${PROMPT_DIR} ${PYVENV}${PROMPT_SYMBOL} "
