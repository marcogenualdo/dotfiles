#!/bin/sh
# Dump hand-tuned GNOME settings, one file per dconf path.
# Not `dconf dump /`: that also captures network ids, proxy and per-app state.
# Restore one with: dconf load /org/gnome/<name>/ < <name>.ini
set -eu
cd "$(dirname "$0")"
for p in desktop shell settings-daemon mutter; do
    # per-app notification toggles are noise
    dconf dump "/org/gnome/$p/" |
        awk '/^\[/ { skip = /^\[notifications\/application\// } !skip' >"$p.ini"
done
