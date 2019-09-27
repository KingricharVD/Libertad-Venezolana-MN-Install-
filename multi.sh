#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"Welcome to the Libertad Venezolana Automated Install, Durring this Process Please Hit Enter or Input What is Asked."${NC}
echo
echo -e ${YELLOW}"You Will See alot of code flashing across your screen, don't be alarmed it's supposed to do that. This process can take up to an hour and may appear to be stuck, but I can promise you it's not."${NC}
echo
echo -e ${GREEN}"Are you sure you want to install a Libertad Venezolana Masternode? type y/n followed by [ENTER]:"${NC}
read AGREE

if [[ $AGREE =~ "y" ]] ; then
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the first node:"${NC}
read privkey
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for second node:"${NC}
read privkey2
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the third node:"${NC}
read privkey3
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 4th node:"${NC}
read privkey4
echo "Creating 4 Libertad system users with no-login access:"
sudo adduser --system --home /home/Libertad Libertad
sudo adduser --system --home /home/Libertad2 Libertad2
sudo adduser --system --home /home/Libertad3 Libertad3
sudo adduser --system --home /home/Libertad4 Libertad4
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common 
sudo apt-get -y install build-essential  
sudo apt-get -y install libtool autotools-dev autoconf automake  
sudo apt-get -y install libssl-dev 
sudo apt-get -y install libevent-dev 
sudo apt-get -y install libboost-all-dev 
sudo apt-get -y install pkg-config  
sudo add-apt-repository ppa:bitcoin/bitcoin 
sudo apt-get update 
sudo apt-get -y install libdb4.8-dev 
sudo apt-get -y install libdb4.8++-dev 
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5 
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
#sudo apt install git 
cd /var 
sudo touch swap.img 
sudo chmod 600 swap.img 
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000 
sudo mkswap /var/swap.img 
sudo swapon /var/swap.img 
sudo echo ' /var/swap.img none swap sw 0 0 ' >> /etc/fstab
cd ~ 
sudo mkdir /root/Libertad
cd /root/Libertad
wget https://github.com/KingricharVD/Libertad-Venezolana/releases/download/1.0.0/Libertadwallet.tar.gz
tar -xzvf Libertadwallet.tar.gz
sudo mv /root/Libertad/Libertadd /root/Libertad/Libertad-cli /root/Libertad/Libertad-tx /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/Libertad*
sudo mkdir /home/Libertad/.Libertad
sudo touch /home/Libertad/.Libertad/Libertad.conf
echo -e "${GREEN}Configuring Wallet for first node${NC}"
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/Libertad/.Libertad/Libertad.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/Libertad/.Libertad/Libertad.conf
echo "rpcallowip=127.0.0.1" >> /home/Libertad/.Libertad/Libertad.conf
echo "server=1" >> /home/Libertad/.Libertad/Libertad.conf
echo "daemon=1" >> /home/Libertad/.Libertad/Libertad.conf
echo "maxconnections=250" >> /home/Libertad/.Libertad/Libertad.conf
echo "masternode=1" >> /home/Libertad/.Libertad/Libertad.conf
echo "rpcport=9734" >> /home/Libertad/.Libertad/Libertad.conf
echo "listen=0" >> /home/Libertad/.Libertad/Libertad.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9735" >> /home/Libertad/.Libertad/Libertad.conf
echo "masternodeprivkey=$privkey" >> /home/Libertad/.Libertad/Libertad.conf
echo "addnode=155.138.218.214" >> /home/Libertad/.Libertad/Libertad.conf
echo "addnode=45.63.10.68" >> /home/Libertad/.Libertad/Libertad.conf
echo "addnode=178.62.93.143" >> /home/Libertad/.Libertad/Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> /home/Libertad/.Libertad/Libertad.conf
echo 
sleep 5
echo -e "${GREEN}Configuring Wallet for second node${NC}"
sudo mkdir /home/Libertad2/.Libertad
sudo touch /home/Libertad2/.Libertad/Libertad.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/Libertad2/.Libertad/Libertad.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/Libertad2/.Libertad/Libertad.conf
echo "rpcallowip=127.0.0.1" >> /home/Libertad2/.Libertad/Libertad.conf
echo "server=1" >> /home/Libertad2/.Libertad/Libertad.conf
echo "daemon=1" >> /home/Libertad2/.Libertad/Libertad.conf
echo "maxconnections=250" >> /home/Libertad2/.Libertad/Libertad.conf
echo "masternode=1" >> /home/Libertad2/.Libertad/Libertad.conf
echo "rpcport=9736" >> /home/Libertad2/.Libertad/Libertad.conf
echo "listen=0" >> /home/Libertad2/.Libertad/Libertad.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9735" >> /home/Libertad2/.Libertad/Libertad.conf
echo "masternodeprivkey=$privkey2" >> /home/Libertad2/.Libertad/Libertad.conf
echo "addnode=155.138.218.214" >> /home/Libertad2/.Libertad/Libertad.conf
echo "addnode=45.63.10.68" >> /home/Libertad2/.Libertad/Libertad.conf
echo "addnode=178.62.93.143" >> /home/Libertad2/.Libertad/Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> /home/Libertad2/.Libertad/Libertad.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for third node${NC}"
sudo mkdir /home/Libertad3/.Libertad
sudo touch /home/Libertad3/.Libertad/Libertad.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/Libertad3/.Libertad/Libertad.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/Libertad3/.Libertad/Libertad.conf
echo "rpcallowip=127.0.0.1" >> /home/Libertad3/.Libertad/Libertad.conf
echo "server=1" >> /home/Libertad3/.Libertad/Libertad.conf
echo "daemon=1" >> /home/Libertad3/.Libertad/Libertad.conf
echo "maxconnections=250" >> /home/Libertad3/.Libertad/Libertad.conf
echo "masternode=1" >> /home/Libertad3/.Libertad/Libertad.conf
echo "rpcport=9737" >> /home/Libertad3/.Libertad/Libertad.conf
echo "listen=0" >> /home/Libertad3/.Libertad/Libertad.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9735" >> /home/Libertad3/.Libertad/Libertad.conf
echo "masternodeprivkey=$privkey3" >> /home/Libertad3/.Libertad/Libertad.conf
echo "addnode=155.138.218.214" >> /home/Libertad3/.Libertad/Libertad.conf
echo "addnode=45.63.10.68" >> /home/Libertad3/.Libertad/Libertad.conf
echo "addnode=178.62.93.143" >> /home/Libertad3/.Libertad/Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> /home/Libertad3/.Libertad/Libertad.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 4th node${NC}"
sudo mkdir /home/Libertad4/.Libertad
sudo touch /home/Libertad4/.Libertad/Libertad.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/Libertad4/.Libertad/Libertad.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/Libertad4/.Libertad/Libertad.conf
echo "rpcallowip=127.0.0.1" >> /home/Libertad4/.Libertad/Libertad.conf
echo "server=1" >> /home/Libertad4/.Libertad/Libertad.conf
echo "daemon=1" >> /home/Libertad4/.Libertad/Libertad.conf
echo "maxconnections=250" >> /home/Libertad4/.Libertad/Libertad.conf
echo "masternode=1" >> /home/Libertad4/.Libertad/Libertad.conf
echo "rpcport=9738" >> /home/Libertad4/.Libertad/Libertad.conf
echo "listen=0" >> /home/Libertad4/.Libertad/Libertad.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9735" >> /home/Libertad4/.Libertad/Libertad.conf
echo "masternodeprivkey=$privkey4" >> /home/Libertad4/.Libertad/Libertad.conf
echo "addnode=155.138.218.214" >> /home/Libertad4/.Libertad/Libertad.conf
echo "addnode=45.63.10.68" >> /home/Libertad4/.Libertad/Libertad.conf
echo "addnode=178.62.93.143" >> /home/Libertad4/.Libertad/Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> /home/Libertad4/.Libertad/Libertad.conf
sleep 5 
fi
echo "Syncing first node, please wait...";
Libertadd -datadir=/home/Libertad/.Libertad -daemon
sleep 10 
until Libertad-cli -datadir=/home/Libertad/.Libertad mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. You 1st masternode is running!"${NC}
sleep 10
echo "Syncing second node, please wait...";
Libertadd -datadir=/home/Libertad2/.Libertad -daemon
sleep 10 
until Libertad-cli -datadir=/home/Libertad2/.Libertad mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. You second masternode is running!"${NC}
sleep 10
echo "Syncing third node, please wait...";
Libertadd -datadir=/home/Libertad3/.Libertad -daemon
sleep 10 
until Libertad-cli -datadir=/home/Libertad3/.Libertad mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. You third masternode is running!"${NC}
sleep 10
echo "Syncing fourth node, please wait...";
Libertadd -datadir=/home/Libertad4/.Libertad -daemon
sleep 10 
until Libertad-cli -datadir=/home/Libertad4/.Libertad mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You fourth masternode is running!"${NC}
echo ""
echo -e ${GREEN}"Congrats! Your LVEN Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "The END. You can close now the SSH terminal session";
