function gcp --description "git commit and push"
    argparse u/set-upstream -- $argv

    git commit -m $argv[1]
    git push $_flag_u $argv[2..3]
end
