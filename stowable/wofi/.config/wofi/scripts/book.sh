#!/bin/bash
find $(xdg-user-dir DOCUMENTS)/books -not -path '*/.*' | tail -n +2 | sed 's|/home/borab/docs/books/||g;' | wofi --show=dmenu --insensitive --no-actions --hide-scroll --lines=10 --width=30% --cache-file=/dev/null --prompt="Search for Books" | sed 's|\ |\\ |g' | xargs -I{dir_or_file} exo-open ${HOME}/docs/books/{dir_or_file}
