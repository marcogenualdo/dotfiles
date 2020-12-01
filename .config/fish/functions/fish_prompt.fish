function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end

    set_color --bold $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    if not set -q __git_cb
        set __git_cb (set_color yellow)" (⚒ "(git branch ^/dev/null | grep \* | sed 's/* //')")"(set_color normal)
    end
    printf '%s' $__git_cb

    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    set_color --bold red
    printf '❯ '
    set_color normal
end
