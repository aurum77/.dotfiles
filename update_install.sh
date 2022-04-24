#!/bin/bash
lines_before=`cat install.sh | wc -l`

if [ -f "install.sh" ]; then
  rm install.sh
else
  touch install.sh
fi

head -n 1 arch.txt | awk '{print $1}' | xargs -I{first_pkg} echo "paru -Syu {first_pkg} \\" > install.sh
tail -n +2 arch.txt | awk '{print $1}' | xargs -I{pkgs} echo {pkgs} \\ >> install.sh

lines_after=`cat install.sh | wc -l`
diff=`expr $lines_after - $lines_before`

if [ $diff -gt 0 ];
then
  echo -e "Added $diff line(s)"
else
  echo -e "Removed ${diff#-} line(s)"
fi
