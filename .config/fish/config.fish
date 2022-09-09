#!/usr/bin/fish

set fish_greeting ""

# PROMPT

#starship init fish | source

# PROGRAMS

set --export EDITOR nvim
set --export VISUAL nvim
set --export BROWSER firefox
set --export PAGER less -RF
set --export MANPAGER "nvim +Man!"

# npm/yarn global packages for $USER
set --export npm_config_prefix $HOME/.local
set --export fish_user_paths $HOME/.local/bin

# load local system config
set LOCAL_CONFIG_PATH $HOME/.config/fish/local.config.fish
if test -e $LOCAL_CONFIG_PATH
    source $LOCAL_CONFIG_PATH
end

# EXECUTE ON LAUNCH

# direnv
if command -v direnv >/dev/null
    eval (direnv hook fish)
end

# version manager
set -l vm_path "/opt/asdf-vm/asdf.fish"
if test -e $vm_path
    source $vm_path
end
