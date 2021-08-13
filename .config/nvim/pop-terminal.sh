#!/bin/bash

# references
THIS_SESSION=$(tmux display-message -p '#S')
THIS_WINDOW=$(tmux display-message -p '#I')

# terminal session
if [ $(echo $THIS_SESSION | grep -o '.....$') == '-term' ];then
    TERM_SESSION=${THIS_SESSION::-5}
else
    TERM_SESSION=$THIS_SESSION-term
fi

tmux new-session -ds $TERM_SESSION
tmux new-window -t $TERM_SESSION:$THIS_WINDOW

tmux switchc -t $TERM_SESSION:$THIS_WINDOW
