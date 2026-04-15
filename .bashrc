#
# ~/.bashrc
#
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clip='clip.exe'  # for wsl; 
alias gettoken='bash ~/scripts/congatec-keycloak-token/script.bash'   # get congatec keycloak token

ff() {  # fzf with colorful file preview
  local files
  files=$(fzf --ansi --multi \
              --preview 'bat --color=always --style=numbers --line-range=:500 {}' \
              --header 'Tab to select multiple | Enter to open')

  if [[ -n "$files" ]]; then
    echo "$files" | xargs -d '\n' nvim -p
  fi
}

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

tmux() {
  # Default behavior when no arguments: create my 3 window setup
  if [ "$#" -eq 0 ]; then
    local session_name
    session_name="$(basename "$PWD")"

    # If session exists, attach to it
    if /usr/sbin/tmux has-session -t "$session_name" 2>/dev/null; then
      /usr/sbin/tmux attach -t "$session_name"
      return
    fi

    # Create detached session with first window
    /usr/sbin/tmux new-session -d -s "$session_name"

    # Window 1: nvim
    /usr/sbin/tmux rename-window -t "$session_name:1" nvim
    /usr/sbin/tmux send-keys -t "$session_name:1" "nvim" C-m

    # Window 2: bash
    /usr/sbin/tmux new-window -t "$session_name" -n bash

    # Window 3: lazygit
    /usr/sbin/tmux new-window -t "$session_name" -n lazygit
    /usr/sbin/tmux send-keys -t "$session_name:3" "lazygit" C-m

    # Attach
    /usr/sbin/tmux attach-session -t "$session_name"
  else  # If arguments are pass, behave like regular tmux
    /usr/sbin/tmux "$@"
  fi
}

export WIN="/mnt/c/Users/kazirahman"
export PATH="$PATH:/home/shaf/.dotnet/tools"
export TERM_CONF="/mnt/c/Users/kazirahman/AppData/Roaming/alacritty"

# Load sensitive variables from ~/.env if it exists
if [ -f "$HOME/.env" ]; then
  set -o allexport
  # shellcheck disable=SC1090
  . "$HOME/.env"
  set +o allexport
fi

PS1='\[\e[1;32m\]\$ \[\e[1;34m\]\w\[\e[0m\] '

. "$HOME/.local/bin/env"
