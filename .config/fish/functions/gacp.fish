function gacp --description "git add --all, commit and push"
    git add --all
    git commit -m $argv[1]
    if set -q argv[2] 
    	git push $argv[2]
    else
	git push
    end
end

