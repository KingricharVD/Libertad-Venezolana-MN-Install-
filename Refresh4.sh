#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

echo -e ${YELLOW}"Welcome to the Libertad-Venezolana Automated Update 2.6.1 (4in1)."${NC}
echo "Please wait while updates are performed..."
sleep 5
echo "Stopping first node, please wait...";
Libertad-cli -datadir=/home/Libertad/.Libertad stop
echo "Stopping second node, please wait...";
Libertad-cli -datadir=/home/Libertad2/.Libertad stop
echo "Stopping third node, please wait...";
Libertad-cli -datadir=/home/Libertad3/.Libertad stop
echo "Stopping fourth node, please wait...";
Libertad-cli -datadir=/home/Libertad4/.Libertad stop
sleep 10
echo "Removing binaries..."
cd /usr/local/bin
rm -rf Libertadd Libertad-cli Libertad-tx
echo "Downloading latest binaries"
wget https://github.com/KingricharVD/Libertad-Venezolana/raw/master/Libertadwallet.tar.gz
tar -xzf Libertadwallet.tar.gz
sudo chmod 755 -R  /usr/local/bin/northern*
rm -rf Libertadwallet.tar.gz
echo "Deleting old nodes from node config files"
sed -i '/addnode/d' /home/Libertad/.Libertad/Libertad.conf
sed -i '/addnode/d' /home/Libertad2/.Libertad/Libertad.conf
sed -i '/addnode/d' /home/Libertad3/.Libertad/Libertad.conf
sed -i '/addnode/d' /home/Libertad4/.Libertad/Libertad.conf

echo "Adding new nodes..."
echo "addnode=155.138.218.214" >> /home/Libertad/.Libertad/Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> /home/Libertad/.Libertad/Libertad.conf

echo "addnode=155.138.218.214" >> /home/Libertad2/.Libertad/Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> /home/Libertad2/.Libertad/Libertad.conf

echo "addnode=155.138.218.214" >> /home/Libertad3/.Libertad/Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> /home/Libertad3/.Libertad/Libertad.conf

echo "addnode=155.138.218.214" >> /home/Libertad4/.Libertad/Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> /home/Libertad4/.Libertad/Libertad.conf

echo "Syncing first node, please wait...";
Libertadd -datadir=/home/Libertad/.Libertad -daemon
until Libertad-cli -datadir=/home/Libertad/.Libertad mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing second node, please wait...";
Libertadd -datadir=/home/Libertad2/.Libertad -daemon
until Libertad-cli -datadir=/home/Libertad2/.Libertad mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing third node, please wait...";
Libertadd -datadir=/home/Libertad3/.Libertad -daemon
until Libertad-cli -datadir=/home/Libertad3/.Libertad mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing fourth node, please wait...";
Libertadd -datadir=/home/Libertad4/.Libertad -daemon
until Libertad-cli -datadir=/home/Libertad4/.Libertad mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Fourth node is fully synced. Your masternode is running!"${NC}
sleep 5
cd ~
echo "The END. You can close now the SSH terminal session";

