diff <(yay -Qe | awk '{print $1}') <(yay -Qeg | awk '{print $2}') | grep '>' | awk '{print $2}' > $HOME/.config/packages/groups.txt

diff <(yay -Qe | awk '{print $1}') <(yay -Qeg | awk '{print $2}') | grep '<' | awk '{print $2}' > $HOME/.config/packages/singles.txt
