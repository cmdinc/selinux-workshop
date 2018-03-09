#!/bin/bash -e

time=`ls -l --time-style="+%x %X" web.te | awk '{ printf "%s %s", $6, $7 }'`
rules=`ausearch --start $time -m avc --raw -se web`
if [ x"$rules" != "x" ] ; then
	echo "Found avc's to update policy with"
	echo -e "$rules" | audit2allow -R
	echo "Do you want these changes added to policy [y/n]?"
	read ANS
	if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
		echo "Updating policy"
		echo -e "$rules" | audit2allow -R >> web.te
		# Fall though and rebuild policy
	else
		exit 0
	fi
else
	echo "No new avcs found"
	exit 0
fi
