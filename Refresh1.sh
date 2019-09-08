#/bin/bash

cd ~
cd /usr/local/bin
./Libertad-cli stop
rm -rf Libertadd Libertad-cli Libertad-tx
wget https://github.com/KingricharVD/Libertad-Venezolana/raw/master/Libertadwallet.tar.gz
tar -xzf Libertadwallet.tar.gz
rm -rf Libertadwallet.tar.gz
./Libertadd -daemon
sleep 30
./Libertad-cli getinfo
