#!/bin/sh
sudo make clean
sudo apt-get update
sudo apt-get -y upgrade
cd `pwd`/depends
sudo make -j2 HOST=arm-linux-gnueabihf
cd ..
sudo ./autogen.sh
sudo mkdir `pwd`/db4
sudo wget -c 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
sudo tar -xzvf db-4.8.30.NC.tar.gz
cd `pwd`/db-4.8.30.NC/build_unix/
sudo ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=`pwd`/db4
sudo make install
cd ../../
sudo ./autogen.sh
sudo ./configure LDFLAGS="-L`pwd`/db4/lib/" CPPFLAGS="-I`pwd`/db4/include/" --prefix=`pwd`/depends/arm-linux-gnueabihf --enable-glibc-back-compat --enable-reduce-exports LDFLAGS=-static-libstdc++
sudo make -j2
echo "Remember to strip the daemon, cli, and tx files!"
