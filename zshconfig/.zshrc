HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=1100000000
SAVEHIST=1000000000

setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_space
setopt always_to_end
setopt auto_cd
setopt auto_menu
setopt auto_pushd
setopt complete_in_word
setopt interactivecomments

# Deactivate ^S/^Q
unsetopt flow_control
# No beep on ambiguous auto complete
unsetopt list_beep
setopt prompt_subst
setopt pushd_minus

zstyle ':completion:*' cache-path ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compcache

typeset -A match_specifications=(
  [any_before_any]='r:|?=**'
  [any_before_dot]='r:|[.]=**'
  [any_before_word]='l:|=*'
  [case_and_dash_insensitive]='m:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}'
  [nonseparators_after_any_before_separator]='r:?||[-_ \]=*'
  [separator_after_any]='l:?|=[-_ \]'
)
zstyle ':completion:*' matcher-list \
    "$match_specifications[case_and_dash_insensitive] $match_specifications[any_before_dot] $match_specifications[any_before_word]" \
    "+$match_specifications[nonseparators_after_any_before_separator] $match_specifications[separator_after_any]" \
    "$match_specifications[case_and_dash_insensitive] $match_specifications[any_before_any]"
unset match_specifications

zstyle ':completion:*' menu select

zstyle ':completion::complete:*' use-cache yes

# Autocomplete at up/down
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

if [[ -r ~/.aliasrc ]]; then
    . ~/.aliasrc
fi

. ~/.config/zsh/prompt/agkozak-zsh-prompt.plugin.zsh
. ~/.cargo/env
