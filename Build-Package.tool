#!/bin/bash
# Wimlib-Imagex-Package
# By chris1111
# Copyright (c) 2022, chris1111. All Right Reserved
# Credit: wimlib https://wimlib.net/ 
# Vars
dir="$HOME/WimlibDev/Wimlib-Imagex-Package"
install_log="$HOME/WimlibDev/Wimlib-Imagex-Package/Build-Package.txt"
rm -rf $install_log
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
apptitle="Wimlib-Imagex-Package"
version="1.0"
# Set Icon directory and file 
iconfile="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/com.apple.imac-aluminum-20.icns"
Sleep 1
# ---------------------------------------------
# Creating log file
# ---------------------------------------------
echo "" > "$install_log"
echo "======================================================" >> "$install_log"
echo "Wimlib-Imagex-Package log - $( date )" >> "$install_log"
echo "======================================================" >> "$install_log"

response=$(osascript -e 'tell app "System Events" to display dialog "
Welcome Wimlib-Imagex-Package
You are about to install

/usr/local/lib/wimlib
/usr/local/bin/wimlib-imagex
/usr/local/share/man/man1

Please make a choice\nCancel for Exit" buttons {"Cancel", "Wimlib-Imagex-Package"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')


answer=$(echo $response | grep "Wimlib-Imagex-Package")


# Cancel is user does not select Wimlib-Imagex-Package
if [ ! "$answer" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
  exit 0
fi

echo "Wimlib-Imagex-Package"
Sleep 2
# Build if select Wimlib-Imagex-Package


{
  if [ "$action" == "Wimlib-Imagex-Package" ] ; then
    echo "Start Wimlib-Imagex-Package"
    echo " "
    fi
    Sleep 1
    cd $dir
    echo " "
    echo "Prepare --> Install wimlib"
    Sleep 1
    ./configure --without-ntfs-3g --without-fuse
    make
    echo "⬇︎ Type your password to continue"
    sudo make install
    echo "============================================="
    wimlib-imagex --version
    echo "============================================="
    echo " "
    echo "=============================================" 
    echo "Your path --> /usr/local/bin ➤ wimlib-imagex" 
    echo "=============================================" 

} | tee "${install_log}"



while true; do

read -p "Do you want to see the Log file? yes/no --> (y/n) " yn

case $yn in 
	[yY] ) h=$(date +"%H")
               if [ $h -gt 6 -a $h -le 12 ]
               then
               echo good morning
               elif [ $h -gt 12 -a $h -le 16 ]
               then 
               echo good afternoon
               elif [ $h -gt 16 -a $h -le 20 ]
               then
               echo good evening
               else
               echo good night
               fi;
		break;;
        [nN] ) h=$(date +"%H")
               if [ $h -gt 6 -a $h -le 12 ]
               then
               echo good morning
               elif [ $h -gt 12 -a $h -le 16 ]
               then 
               echo good afternoon
               elif [ $h -gt 16 -a $h -le 20 ]
               then
               echo good evening
               else
               echo good night
               fi;
		exit;;
	* ) echo invalid response;;
esac

done

Open $install_log

