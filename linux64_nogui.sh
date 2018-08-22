#!/bin/sh
sudo make clean
chmod 777 -R *
sudo apt-get update
sudo apt-get -y upgrade
cd `pwd`/depends
sudo make -j2
cd ..
sudo ./autogen.sh
mkdir `pwd`/db4
wget -c 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
tar -xzvf db-4.8.30.NC.tar.gz
cd `pwd`/db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx --disable-shared --with-pic --prefix=/usr/local/bin/`pwd`/db4
sudo make install
cd ../../
sudo ./autogen.sh
./configure LDFLAGS="-L`pwd`/db4/lib/" CPPFLAGS="-I`pwd`/db4/include/" --prefix=`pwd`/depends/x86_64-pc-linux-gnu
sudo make -j2
echo "Remember to strip the daemon, cli, and tx files!"
