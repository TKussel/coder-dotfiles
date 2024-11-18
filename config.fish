fish_add_path ~/.cargo/bin/
export STARSHIP_CONFIG=$HOME/.config/coderv2/dotfiles/starship.toml
set -g fish_greeting
starship init fish | source

alias py "python3"
alias cat "bat"
alias rgf 'rg --files | rg'
alias la 'ls -la'
alias ll 'ls -la'
alias gp 'git push'
alias gst 'git status'
alias gcmsg 'git commit --message'
alias gd 'git diff'
alias gl 'git pull'
alias gfp! 'git push --force'
alias dockerip "docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias k 'kubectl'
alias dc 'docker compose'
alias dr 'docker run --rm'
