#!/usr/bin/fish

fish_vi_key_bindings


# PROMPT

#starship init fish | source


# ALISES

alias xclip="xclip -selection clipboard"

if command -v exa > /dev/null
    alias ls exa
    alias ll "exa -l"
    alias la "exa -la"
end
if command -v bat > /dev/null
    alias print bat
end

# lock screen
alias lkk='xdg-screensaver lock'

# ranger leaves you in the directory you exit it from
alias lf="ranger --choosedir=$HOME/.rangerdir; cd (cat $HOME/.rangerdir)"

# use git bare repo to manage dotfiles
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME'

# programs
abbr vim nvim
abbr py python3

# zip-like tar extraction
abbr untar "tar -xzf"

# easy configs
abbr confish "nvim ~/.config/fish/config.fish && source ~/.config/fish/config.fish"
abbr convim "nvim ~/.config/nvim/init.vim"

# git
abbr gs "git status"
abbr gac "git add --all && git commit -m"

abbr gds "gitdot status"
abbr gdc "gitdot commit --all -m"


# VARIABLES

set fish_greeting ""
set --export EDITOR nvim
set --export VISUAL nvim
set --export BROWSER firefox

set -U fish_user_paths /usr/local/lib/nodejs/node-v12.16.3-linux-x64/bin


# EXECUTE ON LAUNCH

# start tmux
if status is-interactive
and not set -q TMUX
    exec tmux new-session -A -s def
end

eval (direnv hook fish)
