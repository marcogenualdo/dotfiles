function confe --description "open file in .config with $EDITOR"
    fd --exclude node_modules -t f . ~/.config | fzf | xargs -ro $EDITOR
end
