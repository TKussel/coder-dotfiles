
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
. "$HOME/.cargo/env"

alias py="python3"
alias cat="bat"
alias rgf='rg --files | rg'
alias la='ls -la'
alias ll='ls -la'
alias gp='git pull'
alias gst='git status'
alias gcmsg='git commit --message'
alias gd='git diff'
alias gl='git pull'
alias gfp!='git push --force'
alias dockerip="docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
