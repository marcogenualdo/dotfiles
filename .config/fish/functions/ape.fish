function ape --description "Activate Python environment (.venv unless stated)"
    if set -q argv[1]
	set envName $argv[1]
    else
	set envName ".venv"
    end
    source $envName/bin/activate.fish
end

