#!/bin/bash

TYPE=$1
ICONSDIR=$2
ICNST="AwOken"
HOMEDIR="$HOME/.icons/$ICNST"

if [ "$TYPE" = "leaf" ] || [ "$TYPE" = "snowsabre" ] || [ "$TYPE" = "classy" ]; then
	TYPE="$TYPE/$3"
fi

cd $ICONSDIR/clear/128x128/places/$TYPE/

for f in *; do
	cd $HOMEDIR/clear/128x128/places
	ln -fs $TYPE/$f $f
	cd $ICONSDIR/clear/128x128/places/$TYPE/
done

cd $ICONSDIR/clear/24x24/places/$TYPE/

for f in *; do
	cd $HOMEDIR/clear/24x24/places
	ln -fs $TYPE/$f $f
	cd $ICONSDIR/clear/24x24/places/$TYPE/
done

if [ "$TYPE" = "s11" ] || [ "$TYPE" = "s11-original" ]; then
    cd $HOMEDIR/clear/128x128/places/$TYPE
	ln -fs ../s11-folders/$3".png" "folder.png"
	cd $HOMEDIR/clear/24x24/places/$TYPE
	ln -fs ../s11-folders/$3".png" "folder.png"
fi

if [ "$TYPE" = "sonetto" ]; then
		cd $HOMEDIR/clear/128x128/places/$TYPE
		ln -fs folder/$3".png" "folder.png"
		cd $HOMEDIR/clear/24x24/places/$TYPE
		ln -fs folder/$3".png" "folder.png"
fi
