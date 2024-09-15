#!/bin/bash
find ~/books -not -path '*/.*' | tail -n +2 | sed 's|/home/borab/books/||g;' |  wmenu -f "Noto Sans Mono 13" -b -i -p "books:" -N 282828 -N 282828 -n FBF1C7 -M 458588 -m 282828 -S 458588 -s 282828 | sed 's|\ |\\ |g' | xargs -I{dir_or_file} exo-open ${HOME}/docs/books/{dir_or_file}
