#!/bin/bash
find ~/books -not -path '*/.*' -type f \
| sed 's|^/home/[^/]*/books/||' \
| wofi --show=dmenu --insensitive --no-actions --hide-scroll --lines=10 --width=20% \
  --prompt=" Search for Books" \
| xargs -r -I{} exo-open "$HOME/books/{}"
