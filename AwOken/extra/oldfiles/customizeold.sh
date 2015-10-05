#!/bin/bash

#CURDIR=`pwd`

#echo $CURDIR

CONFIG_FILE="$HOME/.AwOkenrc"
ICONSET="AwOken"
HOMEDIR="$HOME/.icons/$ICONSET"

if [ $2 ]; then
	ICONSDIR=$2
else
	cd ../
	ICONSDIR=`pwd`
	cd extra/
fi

echo "*************************************************************************"
echo "CUSTOMIZATION SCRIPT"

#------------------Creating folder in home/.icons directory if it doesn't exist-----------------------#		

if [ $ICONSDIR = "/usr/share/icons/$ICONSET" ];then
	if [ ! -d $HOMEDIR ]; then
		cp -dpRf $ICONSDIR "$HOME/.icons"
	fi
fi

cd $HOMEDIR

case $1 in
#--------------------------------------6 Different Folder Types----------------------------------------#		
	folder-*)

		TIPO=${1:7}
		TARGET_KEY="folder_type"

		echo "Changing folder type to $TIPO $3..."

		bash $ICONSDIR/extra/changefolder.sh $TIPO $ICONSDIR $3
	;;

#--------------------------------- 61 Different Distributor-Logos-----------------------#	
	start-here*)

		TIPO=${1:11}
		TARGET_KEY="start_here"

		echo "Changing start here logo to $TIPO..."

		cd clear/128x128/places
		ln -fs ../start-here/$1.png start-here.png
		cd ../../../	
	
		cd clear/24x24/places
		ln -fs ../start-here/$1.png start-here.png
		cd ../../../	
	;;	
	
#---------------------------------4 Different Trash Types----------------------------------------#
	trash*)

		TIPO=$1
		TARGET_KEY="trash_type"

		echo "Changing trash icon to $TIPO..."

		cd clear/128x128/places
		ln -fs user-$1.png user-trash.png
		ln -fs user-$1-full.png user-trash-full.png
		cd ../../../
		cd clear/24x24/places
		ln -fs user-$1.png user-trash.png
		ln -fs user-$1-full.png user-trash-full.png
		cd ../../../
	;;
	
#-----------------------------------Miscellaneous ----------------------------------#
	misc)
		echo Please provide root password

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="misc"

		echo "Changing misc icons..."

		if [ -f /usr/share/covergloobus/images/covergloobus.png ]; then 
			echo "I will modify cooverglobus icon"
			sudo cp /usr/share/covergloobus/images/covergloobus.png /usr/share/covergloobus/images/covergloobus.bk
			sudo cp clear/192x192/covergloobus.png /usr/share/covergloobus/images/covergloobus.png
		fi
#		if [ -f /usr/share/pixmaps/texmaker.png ]; then 
#			echo "I will modify texmaker icon"
#			sudo cp /usr/share/pixmaps/texmaker.png /usr/share/pixmaps/texmaker.bk
#			sudo cp clear/32x32/texmaker.png /usr/share/pixmaps/texmaker.png
#		fi
		if [ -f /usr/local/share/enroll/enroll-icon.png ]; then 
			echo "I will modify enroll icon"
			sudo cp /usr/local/share/enroll/enroll-icon.png /usr/local/share/enroll/enroll-icon.png.bk
			sudo cp clear/48x48/apps/enroll.png /usr/local/share/enroll/enroll-icon.png
		fi
		if [ -f /usr/share/icons/hicolor/scalable/apps/screenlets.svg ]; then 
			echo "I will modify screenlets icon; if something goes wrong with this, please tell me!"
			sudo mv /usr/share/icons/hicolor/scalable/apps/screenlets.svg /usr/share/icons/hicolor/scalable/apps/screenlets-backup.svg
			sudo cp extra/screenlets/screenlets.png /usr/share/icons/hicolor/scalable/apps
		fi
		echo DONE
	;;

	misc-restore)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="misc"

		echo "Restoring misc icons..."

		echo Please provide root password
		if [ -f /usr/share/pixmaps/covergloobus.png ]; then 
			echo "I will restore covergloobus icon"
			sudo mv /usr/share/covergloobus/images/covergloobus.bk /usr/share/covergloobus/images/covergloobus.png
		fi
#		if [ -f /usr/share/pixmaps/texmaker.png ]; then 
#			echo "I will restore texmaker icon"
#			sudo mv /usr/share/pixmaps/texmaker.bk /usr/share/pixmaps/texmaker.png
#		fi
		if [ -f /usr/local/share/enroll/enroll-icon.png ]; then 
			echo "I will restore enroll icon"
			sudo mv /usr/local/share/enroll/enroll-icon.png.bk /usr/local/share/enroll/enroll-icon.png
		fi
		if [ -f /usr/share/icons/hicolor/scalable/apps/screenlets.png ]; then 
			echo "I will restore screenlets icon; if something goes wrong with this, please tell me!"
			sudo rm /usr/share/icons/hicolor/scalable/apps/screenlets.png
			sudo mv /usr/share/icons/hicolor/scalable/apps/screenlets-backup.svg /usr/share/icons/hicolor/scalable/apps/screenlets.svg
		fi
		echo DONE
	;;
#--------------------------------- COLOR ----------------------------------------#
	color)

		TIPO=$1
		TARGET_KEY="color_type"

		echo "Changing color type to $TIPO..."
		
		for dim in 128x128 24x24; do
		  echo $dim
  		cd clear/$dim/actions
	  	for i in *1.png; do
	  		if [ $i != viewmag1.png ] && [ $i != stock_zoom-1.png ]; then
	  			ln -fs $i ${i%1.*}.png
	  		fi
	  	done
	  	
	  	cd ../apps
	  	for i in *1.png; do
	  		if [ $i != config-date1.png ] && [ $i != glippy1.png ] && [ $i != it.vodafone* ] && [ $i != nm-stage01-connecting01.png ] && [ $i != nm-stage01-connecting11.png ] && [ $i != nm-stage02-connecting01.png ] && [ $i != nm-stage02-connecting11.png ] && [ $i != nm-stage03-connecting01.png ] && [ $i != nm-stage03-connecting11.png ] && [ $i != ubuntuone-client1.png ]; then
	  			ln -fs $i ${i%1.*}.png
	  		fi
	  	done
	  	cd ../
	  	
	  	for fld in categories devices; do
  	  	cd $fld
	    	for i in *1.png; do
	    		ln -fs $i ${i%1.*}.png
	    	done
	    	cd ../
	  	done
	  	
	  	cd places
	  	for i in *1.png; do
	  		if [ $i != folder-linux1.png ] && [ $i != user-trash1.png ]; then
	  			ln -fs $i ${i%1.*}.png
	  		fi
	  	done
	  	cd ../../../
    done
    
    cd clear/22x22/actions
    echo 22x22
		for i in *1.png; do
  		if [ $i != viewmag1.png ] && [ $i != stock_zoom-1.png ]; then
  			ln -fs $i ${i%1.*}.png
  		fi
  	done
  	cd ../../../
	;;

	no-color)

		TIPO=$1
		TARGET_KEY="color_type"

		echo "Changing color type to $TIPO..."

		for dim in 128x128 24x24; do
		  echo $dim
  		cd clear/$dim/
		
	  	for fld in actions categories devices; do
  	  	cd $fld
  	  	for i in *2.png; do
	    			ln -fs $i ${i%2.*}.png
	    	done
	    	cd ../
      done
	  	
	  	cd apps
	  	for i in *2.png; do
	  		if [ $i != wincloser32.png ] && [ $i != texmaker32x32.png ] && [ $i != texmaker22x22.png ] && [ $i != quake2.png ] && [ $i != netbeans2.png ] && [ $i != glade-2.png ] && [ $i != gnome-robots2.png ] && [ $i != kexi-2.png ] && [ $i != kexi2.png ] && [ $i != glade2.png ] && [ $i != gnobots2.png ] && [ $i != config-date2.png ] && [ $i != blueclock32.png ] && [ $i != glippy2.png ] && [ $i != it.vodafone* ] && [ $i != nm-stage01-connecting02.png ] && [ $i != nm-stage01-connecting12.png ] && [ $i != nm-stage02-connecting02.png ] && [ $i != nm-stage02-connecting12.png ] && [ $i != nm-stage03-connecting02.png ] && [ $i != nm-stage03-connecting12.png ] && [ $i != ubuntuone-client2.png ] && [ $i != onboard2.png ] && [ $i != kmail2.png ]; then
	  			ln -fs $i ${i%2.*}.png
	  		fi
	  	done
	  	cd ../
	  	
	  	cd places
	  	for i in *2.png; do
	  		if [ $i != folder-linux2.png ] && [ $i != user-trash2.png ]; then
	  			ln -fs $i ${i%2.*}.png
	  		fi
	  	done
	  	cd ../../../
		done
		
    cd clear/22x22/actions
    echo 22x22
		for i in *2.png; do
  			ln -fs $i ${i%1.*}.png
  	done
  	cd ../../../
	;;

	gedit*)

		TIPO=$1
		TARGET_KEY="gedit_type"

		echo "Changing gedit icon to $TIPO..."

		cd clear/128x128/apps
		ln -fs $TIPO.png gedit.png
		cd ../../../
		cd clear/24x24/apps
		ln -fs $TIPO.png gedit.png
	;;
	computer*)

		TIPO=$1
		TARGET_KEY="computer_type"
		NOME=${1:8}

		echo "Changing computer icon to $TIPO..."

		cd clear/128x128/places
		ln -fs user-desktop$NOME.png user-desktop.png
		cd ../../../
		cd clear/24x24/places
		ln -fs user-desktop$NOME.png user-desktop.png
	;;
	home*)

		TIPO=$1
		TARGET_KEY="home_type"

		echo "Changing home icon to $TIPO..."

		cd clear/128x128/places
		ln -fs user-$TIPO.png user-home.png
		cd ../../../
		cd clear/24x24/places
		ln -fs user-$TIPO.png user-home.png
	;;
#---------------------------------Extra--------------------------------------------------------#
	emesene)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="emesene"
		echo "This option will be deprecated, since from emesene2 $ICONSET icons will be included by default in emesene2."
		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/change-emesene-icon.sh
	;;
	
	emesene-restore)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="emesene"

		echo "This option will be deprecated, since from emesene2 $ICONSET icons will be included by default in emesene2."
		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/restore-emesene-icon.sh
	;;

	liferea)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="liferea"

		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/change-liferea-icon.sh
	;;
	
	liferea-restore)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="liferea"

		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/restore-liferea-icon.sh
	;;

	cpufreq)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="cpufreq"

		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/change-cpufreq-icon.sh
	;;
	
	cpufreq-restore)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="cpufreq"

		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/restore-cpufreq-icon.sh
	;;
	
	wicd)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="wicd"

		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/change-wicd-icon.sh
	;;
	
	wicd-restore)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="wicd"

		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/restore-wicd-icon.sh
	;;
	
	pidgin)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="pidgin"

		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/change-pidgin-icon.sh
	;;
	
	pidgin-restore)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="pidgin"

		echo "Changing $TARGET_KEY option to $TIPO..."

		./extra/restore-pidgin-icon.sh
	;;
	
	screenlets)
		echo "This option is deprecated. Use the misc option instead."
	;;
	
	screenlets-restore)
		echo "This option is deprecated. Use the misc-restore option instead."
	;;
	
	caffeine)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="caffeine"

		echo "Changing $TARGET_KEY option to $TIPO..."

		sudo mv /usr/share/caffeine/images/Empty_Cup.svg /usr/share/caffeine/images/Empty_Cup.svg.bk 
		sudo mv /usr/share/caffeine/images/Full_Cup.svg /usr/share/caffeine/images/Full_Cup.svg.bk
		sudo cp extra/caffeine/24x24/Empty_Cup.png /usr/share/caffeine/images/Empty_Cup.png
		sudo cp extra/caffeine/24x24/Full_Cup.png /usr/share/caffeine/images/Full_Cup.png
	;;
	
	caffeine-restore)

		#this option will be set to 'nothing', so re-running the script will not re-run this part
		TIPO="nothing"
		TARGET_KEY="caffeine"

		echo "Changing $TARGET_KEY option to $TIPO..."

		sudo mv /usr/share/caffeine/images/Empty_Cup.svg.bk /usr/share/caffeine/images/Empty_Cup.svg.
		sudo mv /usr/share/caffeine/images/Full_Cup.svg.bk /usr/share/caffeine/images/Full_Cup.svg
	;;
	
	dropbox)

		echo "This option is deprecated. Dropbox icons (in experimental version) now respect icon theme specifications, without any need to replace them manually."
		echo "For more informations, check this site: http://www.omgubuntu.co.uk/2010/08/dropbox-icons-now-respect-your-global.html "

		#TIPO="yes"
		#TARGET_KEY="dropbox"

		#echo "Changing $TARGET_KEY option to $TIPO..."

		#echo "WARNING: to use dropbox icons, you need experimental version of Dropbox!"
		#if [ -d ~/.dropbox-dist/icons ]; then 
			#echo "It seems you've installed Dropbox experimental version; I'll now change icons."
			#mv ~/.dropbox-dist/icons/x.png ~/.dropbox-dist/icons/x.png.bk
			#mv ~/.dropbox-dist/icons/blank.png ~/.dropbox-dist/icons/blank.png.bk
			#mv ~/.dropbox-dist/icons/busy.png ~/.dropbox-dist/icons/busy.png.bk
			#mv ~/.dropbox-dist/icons/busy2.png ~/.dropbox-dist/icons/busy2.png.bk
			#mv ~/.dropbox-dist/icons/idle.png ~/.dropbox-dist/icons/idle.png.bk
			#mv ~/.dropbox-dist/icons/logo.png ~/.dropbox-dist/icons/logo.png.bk
			
			#cp extra/dropbox/24x24/x.png ~/.dropbox-dist/icons/x.png
			#cp extra/dropbox/24x24/blank.png ~/.dropbox-dist/icons/blank.png
			#cp extra/dropbox/24x24/busy.png ~/.dropbox-dist/icons/busy.png
			#cp extra/dropbox/24x24/busy2.png ~/.dropbox-dist/icons/busy2.png
			#cp extra/dropbox/24x24/idle.png ~/.dropbox-dist/icons/idle.png
			#cp extra/dropbox/24x24/logo.png ~/.dropbox-dist/icons/logo.png
			
			#echo "DONE"
		#else
			#echo "It seems you haven't Dropbox experimental version. I cannot change icons."
			#echo "For more informations, check this site (kept at random from google): http://www.webupd8.org/2010/05/dropbox-experimental-finally-gets.html"
		#fi
	;;
	
	dropbox-restore)

		echo "This option is deprecated. Dropbox icons (in experimental version) now respect icon theme specifications, without any need to replace them manually."
		echo "For more informations, check this site: http://www.omgubuntu.co.uk/2010/08/dropbox-icons-now-respect-your-global.html "

		#TIPO="no"
		#TARGET_KEY="dropbox"

		#echo "Changing $TARGET_KEY option to $TIPO..."

		#echo "WARNING: to use dropbox icons, you need experimental version of Dropbox!"
		#if [ -d ~/.dropbox-dist/icons ]; then 
			#echo "It seems you've installed Dropbox experimental version; I'll now restore icons."
			#mv ~/.dropbox-dist/icons/x.png.bk ~/.dropbox-dist/icons/x.png
			#mv ~/.dropbox-dist/icons/blank.png.bk ~/.dropbox-dist/icons/blank.png
			#mv ~/.dropbox-dist/icons/busy.png.bk ~/.dropbox-dist/icons/busy.png
			#mv ~/.dropbox-dist/icons/busy2.png.bk ~/.dropbox-dist/icons/busy2.png
			#mv ~/.dropbox-dist/icons/idle.png.bk ~/.dropbox-dist/icons/idle.png
			#mv ~/.dropbox-dist/icons/logo.png.bk ~/.dropbox-dist/icons/logo.png

			#echo "DONE"
		#else
			#echo "It seems you haven't Dropbox experimental version."
			#echo "For more informations, check this site (kept at random from google): http://www.webupd8.org/2010/05/dropbox-experimental-finally-gets.html"
		#fi
	;;
esac

#---------------------------------Added------------------------------------------------#

#if [ -f $CONFIG_FILE ]; then
#  echo "Reading user config...." >&2
#  source $CONFIG_FILE
#else
#  echo "There is not user configuration file; it will be created one using default options."
#  echo "The file will be stored in $CONFIG_FILE; take a look on this file!"
#  cp $ICONSDIR/.AwOkenrc $CONFIG_FILE
#  source $CONFIG_FILE
#fi

#echo "Changing option in the configuration file..."
#sed -i "s/\($TARGET_KEY *=*\).*/\1'$TIPO'/" $CONFIG_FILE
echo "The set is changed according to the $1 option."
