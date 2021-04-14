function yin --description "Install with yay and fzf."
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}' | xargs -ro yay -S
end
