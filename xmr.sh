#!/bin/bash
apt-get update && sudo apt-get upgrade -y 
apt-get install -y git make 
apt-get install gcc g++ 
apt-get install -y build-essential libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev automake
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 1))
git clone https://github.com/JayDDee/cpuminer-opt.git && cd cpuminer-opt && chmod +x build.sh && ./build.sh
./autogen.sh
CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl
make
./cpuminer -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u nhac.tien1988@gmail.com -p x 
