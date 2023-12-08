alias xclip="xclip -selection clipboard"
abbr xi "xclip -i"
abbr xo "xclip -o"

if command -v exa >/dev/null
    alias ls "exa -1"
    alias ll "exa -l"
    alias la "exa -la"
end
if command -v bat >/dev/null
    alias cat bat
end

# lock screen
alias lkk='xdg-screensaver lock'

# ranger leaves you in the directory you exit it from
alias lf="ranger --choosedir=$HOME/.rangerdir; cd (cat $HOME/.rangerdir)"

# use git bare repo to manage dotfiles
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME'

# programs
abbr vi nvim
abbr py python

# zip-like tar extraction
abbr untar "tar -xzf"

# easy configs
abbr confish "nvim -c 'cd ~/.config/fish/' ~/.config/fish/config.fish && source ~/.config/fish/config.fish"
abbr convim "nvim -c 'cd ~/.config/nvim/' ~/.config/nvim/init.vim"
abbr conwm "nvim -c 'cd ~/.config/sway/' ~/.config/sway/config"

# git
abbr g git
abbr gs "git s"
abbr ga "git add"
abbr gc "git commit -m"
abbr gck "git checkout"
abbr gac "git add --all && git commit -m"
abbr gsd "git df"
alias glg "git lg"
alias gsb "git branch -v | fzf | awk '{print $1}' | xargs -ro git checkout"

abbr gd gitdot
abbr gds "gitdot s"
abbr gdca "gitdot commit --all -m"
abbr gdsd "gitdot df"

# programming
abbr dc "docker compose"
abbr tf terraform
