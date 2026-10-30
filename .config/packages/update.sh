#!/bin/sh
# Regenerate package lists from explicitly installed packages (repo + AUR).
# Every *.txt except base.txt is a hand-curated category: the script only drops
# uninstalled entries from it. Anything uncategorised lands in base.txt, so to
# reclassify a package just move its line into another file.
# Reinstall with: yay -S --needed - < <file>.txt
set -eu
cd "$(dirname "$0")"
all=$(mktemp)
trap 'rm -f "$all"' EXIT
pacman -Qqe | sort >"$all"

# GNOME group members are categorised automatically
pacman -Qqg gnome gnome-extra 2>/dev/null >>gnome.txt || true

for f in *.txt; do
    [ "$f" = base.txt ] && continue
    sort -u "$f" | comm -12 - "$all" >"$f.tmp"
    mv "$f.tmp" "$f"
done

touch base.txt
cat $(ls *.txt | grep -vx base.txt) | sort -u | comm -23 "$all" - >base.txt.tmp
sort base.txt | comm -13 - base.txt.tmp | sed 's/^/new in base.txt: /'
mv base.txt.tmp base.txt
