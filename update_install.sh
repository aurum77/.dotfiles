#!/bin/bash

if [ -f "install.sh" ]; then
  lines_before=`cat install.sh | wc -l`
  rm install.sh
else
  lines_before=0
  touch install.sh
fi

head -n 1 fedora.txt | awk '{print $1}' | xargs -I{first_pkg} echo "dnf install {first_pkg} \\" > install.sh
tail -n +2 fedora.txt | awk '{print $1}' | xargs -I{pkgs} echo {pkgs} \\ >> install.sh

lines_after=`cat install.sh | wc -l`
diff=`expr $lines_after - $lines_before`

if [ $diff -gt 0 ];
then
  echo -e "Added $diff line(s)"
else
  echo -e "Removed ${diff#-} line(s)"
fi
