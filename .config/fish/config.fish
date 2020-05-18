#!/usr/bin/fish

fish_vi_key_bindings


# PROMPT

starship init fish | source

#function fish_prompt
#    set_color blue --bold
#    printf "%s" "$USER"
#    set_color green --bold
#    printf " %s" "$PWD\n"
#    set_color normal
#end
#fish_git_prompt


# ALISES

# lock screen
alias lock='xdg-screensaver lock'

# ranger leaves you in the directory you exit it from
alias rg='ranger --choosedir=$HOME/.rangerdir; set LASTDIR (cat $HOME/.rangerdir); cd "$LASTDIR"'

# use git bare repo to manage dotfiles
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME' 

abbr c clear
abbr vim nvim
abbr confish "nvim ~/.config/fish/config.fish && source ~/.config/fish/config.fish"

abbr py python3
abbr ape "source .venv/bin/activate.fish"

# VARIABLES

set fish_greeting ""
set --export EDITOR vim
set --export BROWSER firefox

set -U fish_user_paths /usr/local/lib/nodejs/node-v12.16.3-linux-x64/bin


# EXECUTE ON LAUNCH

# start tmux
if status is-interactive
and not set -q TMUX
    exec tmux attach
end
