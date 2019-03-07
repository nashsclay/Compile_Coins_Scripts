#!/bin/sh
sudo make clean
sudo apt-get update
sudo apt-get -y upgrade
PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g')
cd `pwd`/depends
sudo make -j2 HOST=x86_64-w64-mingw32
cd ..
sudo ./autogen.sh
sudo mkdir db4
sudo wget -c 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
sudo tar -xzvf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix/
sudo ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=`pwd`/db4
sudo make install
cd ../../
sudo ./autogen.sh
sudo ./configure LDFLAGS="-L`pwd`/db4/lib/" CPPFLAGS="-I`pwd`/db4/include/" --prefix=`pwd`/depends/x86_64-w64-mingw32
sudo make -j2
echo "Remember to strip the QT file!"
