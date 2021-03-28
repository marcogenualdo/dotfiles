#!/bin/bash

tmux new-session -ds $(basename "$PWD")
tmux switchc -t $(basename "$PWD")
tmux bind -n 'M-b' switchc -t $(tmux display-message -p '#S')
