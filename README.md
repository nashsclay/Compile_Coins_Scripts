# Compile Coins Scripts

## Instructions
Place this script file in the root directory of the coin. 
This ONLY works for coins with the depends folder in the root directory of the coin. 
Also place root directory in this directory below. 

```
/usr/local/bin
```


It MUST also be logged in as ROOT to avoid errors. 

```
sudo su root
```


The big list of Repos, there are more but start with these.

```
sudo apt install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git libboost-all-dev libssl-dev libboost-tools-dev libboost1.62-tools-dev libdb++-dev libevent-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libevent-dev libssl1.0-dev libboost-all-dev libdb++-dev libssl-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev lib32gcc-4.8-dev
sudo apt install g++-mingw-w64-x86-64
sudo apt install software-properties-common

```


### Linux 64 bit No GUI and QT files (Daemon, TX, CLI, and QT)
```
wget https://raw.githubusercontent.com/nashsclay/Compile_Coins_Scripts/master/linux64_nogui.sh
chmod +x linux64_nogui.sh
./linux64_nogui.sh
```


### Windows 64 bit QT Wallet
```
wget https://raw.githubusercontent.com/nashsclay/Compile_Coins_Scripts/master/win64QT_compile.sh
chmod +x win64QT_compile.sh
./win64QT_compile.sh
```


### Windows 32 bit QT Wallet
```
Coming Soon
```


### MacOSX QT Wallet
No strip needed after compile. This method makes the QT, daemon, cli, and tx files. Send to Mac then do chmod +x filename then run the file.

```
https://raw.githubusercontent.com/nashsclay/Compile_Coins_Scripts/master/MacOSX_allfiles_QT_compile.sh
chmod +x MacOSX_allfiles_QT_compile.sh
./MacOSX_allfiles_QT_compile.sh
```


### ARM Wallet (Raspberry Pi)
```
Coming Soon
```
