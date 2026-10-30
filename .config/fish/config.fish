#!/usr/bin/fish

set fish_greeting ""

# PROMPT

# starship init fish | source

# PROGRAMS

set --export EDITOR nvim
set --export VISUAL nvim
set --export BROWSER zen-browser
set --export PAGER less -RF
set --export MANPAGER "nvim +Man!"

# npm/yarn global packages for $USER
set --export npm_config_prefix $HOME/.local
fish_add_path $HOME/.local/bin

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

if status is-interactive
    zoxide init fish --cmd z | source
    set -gx CARAPACE_BRIDGES zsh,fish,bash
    carapace _carapace | source
end

# version manager
if command -v mise >/dev/null
    mise activate fish | source
end
