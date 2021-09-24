function gcp --description "git commit and push"
    git commit -m $argv[1]
    if set -q argv[3]
    	git push $argv[2] $argv[3]
    else
	git push
    end
end

