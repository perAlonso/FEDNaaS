#!/bin/sh

sudo apt update -y
sudo apt install -y docker-compose git-lfs

cd ~

git clone https://github.com/scaleoutsystems/fedn.git
#COPY TEMPLATED FILES HERE
cd fedn/
cp config/combiner.yaml docker-compose.yaml
docker network create fedn_default
docker-compose -f ./docker-compose.yaml -f config/private-network.yaml up
