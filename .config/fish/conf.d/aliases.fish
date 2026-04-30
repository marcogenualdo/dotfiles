# system
alias xclip="xclip -selection clipboard"
abbr xi "xclip -i"
abbr xo "xclip -o"

abbr bd "base64 --decode"

if command -v exa >/dev/null
    alias ls "exa -1"
    alias ll "exa -l"
    alias la "exa -la"
end
if command -v bat >/dev/null
    alias cat bat
end

# utils
alias ter "tee /dev/stderr"

# lock screen
alias lkk='xdg-screensaver lock'

# eye pause
alias rest="systemctl --user start break-reminder.timer"
alias norest="systemctl --user stop break-reminder.timer"

# ranger leaves you in the directory you exit it from
alias lf="ranger --choosedir=$HOME/.rangerdir; cd (cat $HOME/.rangerdir)"

# use git bare repo to manage dotfiles
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME'

# output
abbr czf "fzf --no-sort --height 40% --border --bind 'enter:become(echo {1})'"

# editor
alias nvim lvim
abbr vi lvim

# zip-like tar extraction
abbr untar "tar -xzf"

# easy configs
abbr confish "nvim -c 'cd ~/.config/fish/' ~/.config/fish/config.fish && source ~/.config/fish/config.fish && source ~/.config/fish/conf.d/*.fish"
abbr convim "nvim -c 'cd ~/.config/lvim/' ~/.config/lvim/config.lua"
abbr conwm "nvim -c 'cd ~/.config/sway/' ~/.config/sway/config"

# git
abbr g git
abbr gs "git s"
abbr ga "git add"
abbr gc "git commit -m"
abbr gck "git checkout"
abbr gr  "git restore --staged"
abbr gac "git add --all && git commit -m"
abbr gsd "git df"
alias glg "git lg"

abbr gd gitdot
abbr gds "gitdot s"
abbr gdca "gitdot commit --all -m"
abbr gdsd "gitdot df"

# programming
abbr dc "docker compose"

abbr k kubectl
abbr ka "kubectl apply -f"
abbr kk "kubectl apply -k"
abbr kc "kubectl config"
abbr ku "kubectl config use-context"
abbr kn "kubectl config set-context --current --namespace"
abbr kl "kubectl logs"
abbr ke "kubectl events"
abbr kg "kubectl get"
abbr kd "kubectl delete"
abbr kD "kubectl describe"
abbr kdp "kubectl delete pods"
abbr kp "kubectl get pods"
abbr kwp "kubectl get pods --watch"
abbr kpn "kubectl get pods -o custom-columns=Name:.metadata.name,Node:spec.nodeName"
abbr ksc "kubectl get secrets"
abbr ksv "kubectl get services"
abbr dekrypt "kubectl get secret -o go-template='{{range \$k,\$v := .data}}{{printf \"%s: \" \$k}}{{if not \$v}}{{\$v}}{{else}}{{\$v | base64decode}}{{end}}{{\"\n\"}}{{end}}'"

abbr tf terraform
abbr tfa "terraform apply"
abbr tg terragrunt
abbr tga "terragrunt apply"

abbr py python

abbr certinfo "openssl x509 -in /dev/stdin -text -noout"
