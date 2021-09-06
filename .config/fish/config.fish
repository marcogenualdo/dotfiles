#!/usr/bin/fish

fish_vi_key_bindings

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

set --export fish_vi_force_cursor true


# PROMPT

#starship init fish | source


# ALISES

alias xclip="xclip -selection clipboard"

if command -v exa > /dev/null
    alias ls "exa -1"
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
abbr vi nvim
abbr py python

# zip-like tar extraction
abbr untar "tar -xzf"

# easy configs
abbr confish "nvim ~/.config/fish/config.fish && source ~/.config/fish/config.fish"
abbr convim "nvim -c 'cd ~/.config/nvim/' ~/.config/nvim/init.vim"
abbr conwm "nvim ~/.config/i3/config"

# git
alias gsb "git branch -v | fzf | awk '{print $1}' | xargs -ro git checkout"
abbr g git
abbr gs "git status --short"
abbr ga "git add"
abbr gc "git checkout"
abbr gC "git commit -m"
abbr gac "git add --all && git commit -m"
abbr gsd "git diff --compact-summary"
abbr glog "git log --oneline --all --graph"

abbr gd "gitdot"
abbr gds "gitdot status --short"
abbr gdca "gitdot commit --all -m"
abbr gdsd "gitdot diff --compact-summary"


# VARIABLES

set fish_greeting ""

set --export EDITOR nvim
set --export VISUAL nvim
set --export BROWSER firefox
set --export PAGER less -RF
set --export MANPAGER "nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' -"

# load local system config
set LOCAL_CONFIG_PATH $HOME/.config/fish/local.config.fish
if test -e $LOCAL_CONFIG_PATH;
    source $LOCAL_CONFIG_PATH;
end

# EXECUTE ON LAUNCH

# direnv
eval (direnv hook fish)

# version manager
source /opt/asdf-vm/asdf.fish
