#!/bin/fish

tmux new-session -ds (basename (pwd))
tmux switchc -t (basename (pwd))
tmux bind -n 'M-e' switchc -t (tmux display-message -p '#S')
