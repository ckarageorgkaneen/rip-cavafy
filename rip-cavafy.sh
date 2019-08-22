#!/usr/bin/env bash
if [ $# -ne 1 ] 
then
    echo "Error: No download dir supplied"
	exit 1
else
	if [ ! -d "$1" ]
	then
		echo "Error: $1 is not a dir"
		exit 1
	fi
fi
max=500
for i in `seq 0 $max` 
do
	lynx -dump -nonumbers http://www.kavafis.org/lections/content.asp?id=$i \
		| grep .mp3 \
		| sed -r 's/gr\//org\//g' \
		| xargs wget -P $1
done
