#!/bin/bash
var = 0
trap ctrl_c INT

function ctrl_c() {
	clear
        exit
}

if ! [ -x "$(command -v figlet)" ]; then
  echo 'Error: figlet is not installed.'
  echo 'Installing figlet'
  sudo apt-get install figlet
  clear
fi
if ! [ -x "$(command -v lolcat)" ]; then
  echo 'Error: lolcat is not installed.'
  echo 'Installing lolcat'
  sudo apt-get install lolcat
  clear
fi
if ! [ -x "$(command -v gnome-terminal)" ]; then
  echo 'Error: GNOME terminal is not installed.'
  echo 'Instal and try again !'
  exit
fi

clear
echo
figlet -w 180 -c -f Fonts/3d.flf -x  "elefante" | lolcat
echo
read -p "Do you want to turn on geofence (Y/N) " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
    gnome-terminal --geometry=260x25-0+0 --tab -e "python3 GeoFence/geofence.py" --tab -e "python3 main.py " --tab -e "python3 iot.py"
    clear
elif [[ $REPLY =~ ^[Nn]$ ]]
then
    gnome-terminal --geometry=260x25-0+0 --tab -e "python3 main.py " --tab -e "python3 iot.py"
    clear
else
    echo "Not a valid option. Try again"
    exit
fi

