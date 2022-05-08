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

# load local system config
set LOCAL_CONFIG_PATH $HOME/.config/fish/local.config.fish
if test -e $LOCAL_CONFIG_PATH
    source $LOCAL_CONFIG_PATH
end

# BINDS

for mode in default insert
    bind --mode $mode \co lf
    # emojis
    bind --mode $mode \cj put_emoji
end

fzf_configure_bindings --git_status=\cs --directory=\cf

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
