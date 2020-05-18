# Window title
case $TERM in
    xterm*)
        precmd_title () {print -Pn "\e]0;%~\a"}
        ;;
esac

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
zstyle ':vcs_info:git:*' formats '('$'\U2692'' %b)'

precmd_functions+=( precmd_title; precmd_vcs_info )

# Enable colors and change prompt
autoload -U colors && colors
setopt prompt_subst
PROMPT=$'%B%F{blue}%n@%m%f \U21D9 %F{green}%d %F{magenta}$vcs_info_msg_0_ \n%F{red}\U21AF %f%b'

# History settings
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# Vim bindings
bindkey -v

# Edit command in vim
autoload  edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Tab completion
zstyle :compinstall filename '/home/jonny/.zshrc'
zstyle ':completion:*' special-dirs true

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# PATHS

# add cuda to PATH
export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# add node.js to PATH
export PATH=$PATH:/usr/local/lib/nodejs/node-v12.14.1-linux-x64/bin


### ALIASES

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ranger leaves you in the directory you exit it from
alias rg='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
