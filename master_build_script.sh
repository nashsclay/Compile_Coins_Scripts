#!/bin/bash
clear

NC=$'\e[0m'
RED=$'\e[31;01m'
GREEN=$'\e[32;01m'
YELLOW=$'\e[33;01m'
BLUE=$'\e[34;01m'
PURPLE=$'\e[35;01m'
CYAN=$'\e[36;01m'

echo ""
echo "Coin Script Builder"
echo ""
echo "Tested on Ubuntu 18.04 and 19.04"
echo ""
echo "1.  ARM32          - Raspberry Pi"
echo "2.  AARCH64        - Very few devices"
echo "3.  MacOSX Mojave  - Test"
echo "4.  MacOSX         - Standard build for Macs"
echo "5.  Linux 64 bit   - Linux 64 bit and for Masternodes"
echo "6.  Windows 32 bit - Windows 32 bit"
echo "7.  Windows 64 bit - Windows 64 bit"
echo "8.  Linux 64 bit 19- Linux 64 bit Ubuntu 19.04"
echo ""
read -p "What OS are you building for: " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
	echo "Enter only numbers. Exiting..."
	exit 1
elif [ "$choice" -gt "8" ] || [ "$choice" -le "0" ]; then
	echo "You need to enter a number above. Exiting..."
	exit 1
fi

if [ "$choice" -eq "1" ]; then
  FANCY_NAME='ARM32'
  SCRIPT_NAME='ARM32_compile'
fi
if [ "$choice" -eq "2" ]; then
  FANCY_NAME='AARCH64'
  SCRIPT_NAME='ARM64_compile'
fi
if [ "$choice" -eq "3" ]; then
  FANCY_NAME='MacOSX Mojave'
  SCRIPT_NAME='MacOSX_Mojave_test'
fi
if [ "$choice" -eq "4" ]; then
  FANCY_NAME='MACOSX'
  SCRIPT_NAME='MacOSX_allfiles_QT_compile'
fi
if [ "$choice" -eq "5" ]; then
  FANCY_NAME='Linux 64 bit'
  SCRIPT_NAME='linux64_compile'
fi
if [ "$choice" -eq "6" ]; then
  FANCY_NAME='Windows 32 bit'
  SCRIPT_NAME='win32QT_compile'
fi
if [ "$choice" -eq "7" ]; then
  FANCY_NAME='Windows 64 bit'
  SCRIPT_NAME='win64QT_compile'
fi
if [ "$choice" -eq "8" ]; then
  FANCY_NAME='Linux 64 bit Ubuntu 19.04'
  SCRIPT_NAME='linux64_ubuntu1904'
fi

echo ""
read -p "You are about to build ${RED}$FANCY_NAME${NC}, do you wish to continue? " -n 1 -r
if [[ ! $next_choice =~ ^[Yy]$ ]]; then
  echo -e "\n"
  clear
  echo "${RED}$FANCY_NAME${NC} Script starting, please wait..."
  clear
  sudo wget "https://raw.githubusercontent.com/nashsclay/Compile_Coins_Scripts/master/$SCRIPT_NAME.sh"
  chmod +x $SCRIPT_NAME.sh
  sudo ./$SCRIPT_NAME.sh
fi
