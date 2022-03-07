function up
    if test -z $argv[1]
        set n 1
    else
        set n $argv[1]
    end

    cd (string repeat -N -n $n "../")
end
