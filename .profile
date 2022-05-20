# Set environment variables
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Extend $PATH
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# If running bash, include .bashrc
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
