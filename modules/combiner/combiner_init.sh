#!/bin/sh

sudo apt update -y
sudo apt install -y docker-compose git-lfs

cd ~

git clone https://github.com/scaleoutsystems/fedn.git
cp ~/settings-combiner.yaml ~/fedn/config/
#COPY TEMPLATED FILES HERE
cd fedn/
cp config/combiner.yaml docker-compose.yaml
#PWD= $(pwd)
sudo -E docker network create fedn_default
sudo -E docker-compose -f ./docker-compose.yaml -f config/private-network.yaml up -d
