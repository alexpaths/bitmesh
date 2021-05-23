#!/usr/bin/env sh

#
# PRE-ALPHA - Incomplete; basically untested
#
# Author: Alexander Athougies KJ6FEC
# Purpose: 
#   1. Installs a Wifi Mesh network on a RPI 3B+ or newer
#   2. Installs a pruned Bitcoin Core node which operates over the network
#   3. Serve the Bitcoin Core package torrent over the mesh
#   4. Provide internet connectivity to the mesh through ethernet connection
# Requirements:
#   1. RPI 64 bit running Ubuntu headless
#   2. ssh enabled or keyboard & monitor
#   3. Filesystem expanded
#   4. cd ~ && git clone https://github.com/alexpaths/bitmesh
#

set -e

if [ "$(id -u)" = "0" ]
  then echo "Please do not run as root"
  exit 1
fi

PROJECT_HOME=${HOME}/bitmesh

cd ${HOME}


# with internet

# Update list of packages
sudo apt update
sudo apt upgrade -y

# Install dependencies
sudo apt install -y \
    docker \
    docker-compose \
    gpsd \
    ntp \
    build-essentials \
    gpg \
    screen

# Remove ifplugd if present, as it interferes with olsrd
sudo apt remove -y ifplugd
sudo apt autoremove -y

# get signing keys
wget https://stepansnigirev.com/ss-specter-release.asc
gpg --import ss-specter-release.asc
gpg --receive-keys 01EA5486DE18A882D4C2684590C8019E36C2E964
gpg --receive-keys 85547FD97CD205F779D37076B03184B406859373

# download bitcoin core
wget https://bitcoincore.org/bin/bitcoin-core-0.21.1/bitcoin-0.21.1-aarch64-linux-gnu.tar.gz
wget https://bitcoincore.org/bin/bitcoin-core-0.21.1/SHA256SUMS.asc

# unpack core
tar -zxf bitcoin-0.21.1-aarch64-linux-gnu.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin bitcoin-0.21.1/bin/*


# get pruned blockchain
wget https://prunednode.today/latest.signed.txt
wget https://prunednode.today/latest.zip
gpg --verify latest.signed.txt latest.zip

# unpack blockchain
unzip latest.zip -d ~/.bitcoin -o

# set core start on startup
crontab -l > cronbackup
echo "@reboot bitcoind -daemon" >> cronbackup
crontab cronbackup
rm cronbackup






# reboot to start everything
sudo reboot
