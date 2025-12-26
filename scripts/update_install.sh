#!/bin/bash
if [ -f "install_packages.sh" ]; then
	lines_before=`cat install_packages.sh | wc -l`
	rm install_packages.sh
else
	lines_before=0
	touch install_packages.sh
fi

head -n 1 ./arch.txt | awk '{print $1}' | xargs -I{first_pkg} echo "yay -Syu {first_pkg} \\" > install_packages.sh
tail -n +2 ./arch.txt | awk '{print $1}' | xargs -I{pkgs} echo {pkgs} \\ >> install_packages.sh

lines_after=`cat install_packages.sh | wc -l`
diff=`expr $lines_after - $lines_before`

if [ $diff -gt 0 ];
then
	echo -e "Added $diff line(s)"
else
	echo -e "Removed ${diff#-} line(s)"
fi
