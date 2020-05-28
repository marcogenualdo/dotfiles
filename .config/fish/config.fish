#!/usr/bin/fish

fish_vi_key_bindings


# PROMPT

#starship init fish | source


# ALISES

# lock screen
alias lkk='xdg-screensaver lock'

# ranger leaves you in the directory you exit it from
alias rg="ranger --choosedir=$HOME/.rangerdir; cd (cat $HOME/.rangerdir)"

# use git bare repo to manage dotfiles
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME' 

# programs
abbr vim nvim
abbr confish "nvim ~/.config/fish/config.fish && source ~/.config/fish/config.fish"
abbr py python3

# git
abbr gs "git status"
abbr gds "gitdot status"
abbr gda "gitdot add ~/.config/fish/functions/ ~/.config/fish/config.fish ~/.config/nvim/init.vim ~/.config/starship.toml ~/.tmux.conf"

# (un)zipping
abbr targz "tar -xzf"


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
