fzf_configure_bindings --git_status=\cg --directory=\cf
# ctrl+f: include hidden and gitignored files, but skip .git internals
set -g fzf_fd_opts --hidden --no-ignore --exclude .git
