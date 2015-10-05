#!/bin/bash

CONFIG_FILE="$HOME/.AwOkenrc"
ICONSET="AwOken"
VER="2.5"
HOMEDIR="$HOME/.icons"

echo "*************************************************************************"
echo "$ICONSET $VER - RECOVERY SCRIPT FOR COLORIZATION SCRIPT"
echo "*************************************************************************"

if [ $1 ]; then
	ICONSDIR=$1
	echo "I'm using this path for iconset in configuration process: $ICONSDIR"
else
	cd ../
	ICONSDIR=`pwd`
	echo "I'm using this path for iconset in configuration process: $ICONSDIR"
fi

echo "*************************************************************************"

if [ -f $CONFIG_FILE ]; then
  echo "Reading user config...." >&2

	if [ $ICONSDIR = "/usr/share/icons/$ICONSET" ];then
		rm  -rf $HOMEDIR/$ICONSET
		cp -dpRf $ICONSDIR $HOMEDIR
	fi

  source $CONFIG_FILE

	# bash $ICONSDIR/extra/customize.sh -c $color_type -F $folder_type -f $folder_sub_type -S $start_here -T $trash_type -C $computer_type -H $home_type $ICONSDIR
	bash $ICONSDIR/extra/customize.sh -c $color_type -F $folder_type -f $folder_sub_type -S $start_here $ICONSDIR

else
  echo "There is not user configuration file; it's impossible recovering previous options, because there are no previous options!"
fi

