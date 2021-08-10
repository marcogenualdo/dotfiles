#!/bin/bash

# references
THIS_SESSION=$(tmux display-message -p '#S')
THIS_WINDOW=$(tmux display-message -p '#I')

# terminal session
TERM_SESSION=$THIS_SESSION-term
tmux new-session -ds $TERM_SESSION
tmux new-window -t $TERM_SESSION:$THIS_WINDOW

tmux switchc -t $TERM_SESSION:$THIS_WINDOW
