#!/bin/bash

ICNST="AwOken"
ICNSTP="awoken"
ICNSTG="AWOKEN"
ICNSTCNF=".AwOkenrc"
DIR=$1/$ICNST
ICNS="$HOME/.icons"
VER="2.5"

# Checks if zenity is installed, if not continue with the old fashioned script.
if [ -x /usr/bin/zenity ]; then 
  ZEN="1"
else
  ZEN="0"
fi

clear

echo "*************************************************************************"
echo "COLORIZATION SCRIPT"
echo "This part is still under testing, so it's more than welcome any detection of any bug you'd find."
echo "My mail is 'alecive87@gmail.com'"
echo "*************************************************************************"
if [ -x /usr/bin/zenity ]; then 
  QST="Be aware that it is strongly recommended\nto check the README pdf file,\n in order to use this script properly.\nDo you want to read the PDF file?"
  RISP=`zenity --title="$ICNSTG $VER Customization script" --list --text="$QST" --radiolist --column "" --column "" TRUE "Yes" FALSE "No" --width="310" --height="250"`
  if [ "$RISP" != "No" ];then
    RISP="Yes"
  fi
else
  echo "Be aware that it is recommended to check the README pdf file, in order to use this script properly. Do you want to read the PDF file? ([y]/n)"
  read RISP
  if [ "$RISP" != "n" ];then
    RISP="Yes"
  fi
fi
echo "Your choice was $RISP."
if [ "$RISP" == "Yes" ]; then
	echo "Now I'll open readme file (if xdg-open exists)."
    if [ -f $DIR/Installation_and_Instructions.pdf ]; then
		xdg-open $DIR/Installation_and_Instructions.pdf &
		sleep 2
		echo " "
		echo " "
	else
		echo "Sorry, I cannot find the file, or xdg-open doesn't exist on your pc."
	fi
fi
if [ $DIR != "$ICNS/$ICNST" ]; then
    echo "*************************************************************************"
    echo "Colorization process needs the latest release of $ICNST icon theme located in $ICNS. So, if is present the configuration file called $ICNSTCNF in your home directory, I'll simply run the recovery process of $ICNSTP-icon-theme-customization. If not, I'll run the configuration process and I'll ask you to configure the iconset."
    if [ -f $HOME/$ICNSTCNF ]; then
	    echo "Configuration file already exists. I'll run the recovery script."
        bash $DIR/extra/recovercolor.sh $DIR
    else
	    echo "Configuration file doesn't exist. I'll run the recovery script with default options."
	    cp $DIR/extra/colorscripts/$ICNSTCNF $HOME
	    bash $DIR/extra/recovercolor.sh $DIR
    fi
fi
echo "*************************************************************************"
if ! [ -x /usr/bin/zenity ]; then
  echo "How do you want to colorize the iconset? You have to choose a value for each RGB channel (check the PDF file for further informations). For each channel, type the number of choice and press 'Enter'."
  echo "Quick suggestions: the number must be in the range [0 255]; lower is the number, more contrasted is the result (and, generally, less details in icons you'll get); you can't obtain an iconset clearer than AwOken classic. Type now the numbers as specified earlier:"
fi

f="0"
while [  $f == "0" ]; do
  if [ -x /usr/bin/zenity ]; then 
    R=`zenity --title="$ICNSTG $VER Customization script" --entry --text="How do you want to colorize the iconset?\nYou have to choose a value for each RGB channel (check the PDF file for info).\nFor each channel, type the number of choice and press 'OK'.\n\nQuick suggestions:\n1. the number must be in the range [0 255];\n2. lower is the number, more contrasted is the result (and less details you'll get);\n3. The clearest color you can obtain (ie R=255, G=255, B=255) will never be\nclearer than AwOken classic.\n\nType now the R channel as specified earlier:" --width=100`
  else
    read R
  fi
  if [ ! $(echo "$R" | grep -E "^[0-9]+$") ]; then
    echo "$R is not a valid integer. Type a correct number for R channel."
  else
    if ! [ $R -ge 0 ] || ! [ $R -le 255 ]; then
      echo "$R is an invalid value, because range is [0 255]. Type a correct number for R channel."
    else
      f="1"
    fi
  fi
done

f="0"
while [  $f = "0" ]; do
  if [ -x /usr/bin/zenity ]; then 
    G=`zenity --title="$ICNSTG $VER Customization script" --entry --text="How do you want to colorize the iconset?\nYou have to choose a value for each RGB channel (check the PDF file for info).\nFor each channel, type the number of choice and press 'OK'.\n\nQuick suggestions:\n1. the number must be in the range [0 255];\n2. lower is the number, more contrasted is the result (and less details you'll get);\n3. The clearest color you can obtain (ie R=255, G=255, B=255) will never be\nclearer than AwOken classic.\n\nType now the G channel as specified earlier:" --width=100`
  else
    read G
  fi
  if [ ! $(echo "$G" | grep -E "^[0-9]+$") ]; then
    echo "$G is not a valid integer. Type a correct number for G channel."
  else
    if ! [ $G -ge 0 ] || ! [ $G -le 255 ]; then
      echo "$G is an invalid value, because range is [0 255]. Type a correct number for G channel."
    else
      f="1"
    fi
  fi
done

f="0"
while [  $f = "0" ]; do
  if [ -x /usr/bin/zenity ]; then 
    B=`zenity --title="$ICNSTG $VER Customization script" --entry --text="How do you want to colorize the iconset?\nYou have to choose a value for each RGB channel (check the PDF file for info).\nFor each channel, type the number of choice and press 'OK'.\n\nQuick suggestions:\n1. the number must be in the range [0 255];\n2. lower is the number, more contrasted is the result (and less details you'll get);\n3. The clearest color you can obtain (ie R=255, G=255, B=255) will never be\nclearer than AwOken classic.\n\nType now the B channel as specified earlier:" --width=100`
  else
    read B
  fi
  if [ ! $(echo "$B" | grep -E "^[0-9]+$") ]; then
    echo "$B is not a valid integer. Type a correct number for B channel."
  else
    if ! [ $B -ge 0 ] || ! [ $B -le 255 ]; then
      echo "$B is an invalid value, because range is [0 255]. Type a correct number for B channel."
    else
      f="1"
    fi
  fi
done

if [ $R = "000" ] ||  [ $R = "00" ]; then
  R="0"
fi
if [ $G = "000" ] ||  [ $G = "00" ]; then
  G="0"
fi
if [ $B = "000" ] ||  [ $B = "00" ]; then
  B="0"
fi

if [ $R -ge 0 ] && [ $R -le 9 ]; then
  R="00$R"
fi
if [ $G -ge 0 ] && [ $G -le 9 ]; then
  G="00$G"
fi
if [ $B -ge 0 ] && [ $B -le 9 ]; then
  B="00$B"
fi

if [ $R -ge 10 ] && [ $R -le 99 ]; then
  R="0$R"
fi
if [ $G -ge 10 ] && [ $G -le 99 ]; then
  G="0$G"
fi
if [ $B -ge 10 ] && [ $B -le 99 ]; then
  B="0$B"
fi

color=$R/$G/$B
COL=$R$G$B
WOKENCOL="$ICNST-$COL"
echo "The color of choice is: $color."
if [ -x /usr/bin/zenity ]; then 
  zenity --title="$ICNSTG $VER Customization script" --warning --text="Please wait a bit until colorization\nprocess will finish." &
fi
echo "*************************************************************************"
echo "Now I'll colorize the iconset according to your needs. It may take a while."
cd $ICNS/$ICNST/extra/colorscripts/
bash colorationscript.sh scratch $color
bash colorationscript.sh folder $color
echo "*************************************************************************"
echo "Now I have to modify customization script according to the new iconset."
cd $ICNS/$WOKENCOL/
#$ICNSTP-icon-theme-customization-col
echo "Modifying $ICNSTP-icon-theme-customization-$COL.."
sed -i 's/'$ICNST'/'$WOKENCOL'/g' $ICNSTP-icon-theme-customization-$COL
sed -i 's/'$ICNSTG'/'$ICNSTG'-'$COL'/g' $ICNSTP-icon-theme-customization-$COL
#index.theme
echo "Modifying index.theme.."
sed -i 's/'$ICNST'/'$WOKENCOL'/g' index.theme
sed -i 's/Awesome Token/Awesome Token (colored with '${color:0:3}'\/'${color:4:3}'\/'${color:8:3}')/g' index.theme
sed -i 's/Inherits=/Inherits='$ICNST',/g' index.theme
cd extra/
#changefolder
#echo "Modifying changefolder.sh.."
#sed -i 's/'$ICNST'/'$WOKENCOL'/g' changefolder.sh
#configure
echo "Modifying configure.sh.."
sed -i 's/'$ICNSTCNF'/'$ICNSTCNF'-'$COL'/g' configure.sh
sed -i '6s/'$ICNST'/'$WOKENCOL'/' configure.sh
#configurez
echo "Modifying configurez.sh.."
sed -i 's/'$ICNSTCNF'/'$ICNSTCNF'-'$COL'/g' configurez.sh
sed -i '6s/'$ICNST'/'$WOKENCOL'/' configurez.sh
#customize
echo "Modifying customize.sh.."
sed -i 's/'$ICNSTCNF'/'$ICNSTCNF'-'$COL'/g' customize.sh
sed -i '4s/'$ICNST'/'$WOKENCOL'/' customize.sh
#recover
echo "Modifying recover.sh.."
sed -i '4s/'$ICNST'/'$WOKENCOL'/' recover.sh
sed -i 's/'$ICNSTCNF'/'$ICNSTCNF'-'$COL'/g' recover.sh
#recovercolor
echo "Modifying recovercolor.sh.."
sed -i '4s/'$ICNST'/'$WOKENCOL'/' recovercolor.sh
sed -i 's/'$ICNSTCNF'/'$ICNSTCNF'-'$COL'/g' recovercolor.sh
echo "*************************************************************************"
echo "Configuring new iconset with default options.."
if [ ! -f "$HOME/$ICNSTCNF-$COL" ]; then
  cp ../"$ICNSTCNF-$COL" $HOME/$ICNSTCNF-$COL
fi
bash recovercolor.sh
echo "*************************************************************************"
if [ -x /usr/bin/zenity ]; then 
  QST="Colorization script has finished\nand the iconset is created according to your needs;\nyou can check it in $ICNS/$WOKENCOL."
  zenity --title="$ICNSTG $VER Customization script" --info --text="$QST"
else
  echo "Colorization script has finished and the iconset is created according to your needs; you can check it in $ICNS/$WOKENCOL."
fi
echo "DONE."
