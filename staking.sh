#/bin/bash

cd ~
  
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install -y nano htop git
sudo apt-get install -y software-properties-common
sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libevent-dev
sudo apt-get install -y libminiupnpc-dev
sudo apt-get install -y autoconf
sudo apt-get install -y automake unzip
sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
sudo apt-get install libzmq3-dev

cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd

wget https://github.com/KingricharVD/Libertad-Venezolana/releases/download/1.0.0/Libertadwallet.tar.gz
tar -xzf Libertadwallet.tar.gz
rm -rf Libertadwallet.tar.gz

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sudo ufw allow 9734/tcp
  
cd
mkdir -p .Libertad
echo "staking=1" >> Libertad.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> Libertad.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> Libertad.conf
echo "rpcallowip=127.0.0.1" >> Libertad.conf
echo "listen=1" >> Libertad.conf
echo "server=1" >> Libertad.conf
echo "daemon=1" >> Libertad.conf
echo "logtimestamps=1" >> Libertad.conf
echo "maxconnections=256" >> Libertad.conf
echo "addnode=155.138.218.214" >> Libertad.conf
echo "addnode=45.63.10.68" >> Libertad.conf
echo "addnode=178.62.93.143" >> Libertad.conf
echo "addnode=2001:19f0:5401:2f68:5400:02ff:fe3e:9af2" >> Libertad.conf
echo "port=9734" >> Libertad.conf
mv Libertad.conf .Libertad

  
cd
./Libertadd -daemon
sleep 30
./Libertad-cli getinfo
sleep 5
./Libertad-cli getnewaddress
echo "Use the address above to send your LVEN coins to this server"
