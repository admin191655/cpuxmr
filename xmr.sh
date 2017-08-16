#!/bin/bash
apt-get update && sudo apt-get upgrade -y 
apt-get install -y git make 
apt-get install -y gcc g++ 
apt-get install -y build-essential libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev automake
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 16))
git clone https://github.com/JayDDee/cpuminer-opt && cd cpuminer-opt && chmod +x build.sh && ./build.sh || true && sudo make install
./cpuminer -a cryptonight -o stratum+tcp://us-east.cryptonight-hub.miningpoolhub.com:20580 -u nvt191655320.tien -p x
