#!/bin/bash

# 1. Get current state
curr_s=$(tmux display-message -p "#S")
curr_w=$(tmux display-message -p "#I")
curr_p=$(tmux display-message -p "#{pane_current_path}")

# 2. Determine target session name
if [[ "$curr_s" == *"-term" ]]; then
    target_s="${curr_s%-term}"
else
    target_s="${curr_s}-term"
fi

# 3. Create session if it doesn't exist
if ! tmux has-session -t "$target_s" 2>/dev/null; then
    tmux new-session -d -s "$target_s" -c "$curr_p"
fi

# 4. Create window if it doesn't exist (to match current index)
if ! tmux select-window -t "$target_s:$curr_w" 2>/dev/null; then
    tmux new-window -t "$target_s:$curr_w" -c "$curr_p"
fi

# 5. Switch to the session/window
tmux switch-client -t "$target_s:$curr_w"
