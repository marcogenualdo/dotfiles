function put_emoji --description "Puts emoji in cursor position, selected through fzf."
    if not command -v emoji-fzf >/dev/null
        echo "Missing dependency, please run pip install emoji-fzf"
    else
        set emoji (
            emoji-fzf preview                                | \
               fzf -m --preview "emoji-fzf get --name {1}" | \
               cut -d " " -f 1                             | \
               emoji-fzf get
        )
        commandline --current-token --replace $emoji
    end

    commandline --function repaint
end
