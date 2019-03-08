#!/bin/sh
sudo make clean
sudo apt-get update
sudo apt-get -y upgrade
cd `pwd`/depends
sudo mkdir SDKs
cd SDKs
sudo wget -c https://github.com/phracker/MacOSX-SDKs/releases/download/MacOSX10.11.sdk/MacOSX10.11.sdk.tar.xz
sudo tar -xf MacOSX10.11.sdk.tar.xz
cd ..
sudo make -j2 HOST=x86_64-apple-darwin14
cd ..
sudo ./autogen.sh
sudo mkdir db4
sudo wget -c 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
sudo tar -xzvf db-4.8.30.NC.tar.gz
cd `pwd`/db-4.8.30.NC/build_unix/
sudo ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=`pwd`/db4
sudo make install
cd ../../
sudo ./autogen.sh
sudo ./configure --prefix=`pwd`/depends/x86_64-apple-darwin14
sudo make -j2
sudo make deploy
echo "No strip required for this file! DMG file is located in the same folder as this script."
