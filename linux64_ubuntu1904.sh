#!/bin/sh
sudo make clean
sudo apt-get update
sudo apt-get -y upgrade
cd `pwd`/depends
sudo make -j2
cd ..
sudo ./autogen.sh
# Realized below was already in depends folder so not needed
# sudo mkdir `pwd`/db4
# sudo wget -c 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
# sudo tar -xzvf db-4.8.30.NC.tar.gz
# cd `pwd`/db-4.8.30.NC/build_unix/
# sudo wget https://raw.githubusercontent.com/nashsclay/Compile_Coins_Scripts/master/berkeley-db-4.8.30.nc.patch
# sudo patch ../dbinc/atomic.h > ./berkeley-db-4.8.30.nc.patch
# sudo ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=`pwd`/db4
# sudo make install
# cd ../../
# sudo ./autogen.sh
sudo ./configure --prefix=`pwd`/depends/x86_64-pc-linux-gnu
sudo make -j2
echo "Remember to strip the daemon, cli, and tx files!"
