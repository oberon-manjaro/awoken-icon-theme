#!/bin/bash


for i in *
do
	if [ $i = uscriptino.sh ]; then
		echo "Qui non farò niente";
	else
		cd $i
		echo	cd $i
		for e in *
		do
			convert $e -resize 24x24 $e
		done
		cd ../
	fi
done
