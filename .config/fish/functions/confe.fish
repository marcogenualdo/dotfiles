function confe --description "open file in .config with $EDITOR"
    find ~/.config -type f | fzf | xargs -ro $EDITOR
end
