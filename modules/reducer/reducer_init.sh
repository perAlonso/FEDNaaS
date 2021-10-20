#!/bin/sh

sudo apt update -y
sudo apt install -y docker-compose git-lfs

cd ~

git clone https://github.com/scaleoutsystems/fedn.git
#COPY TEMPLATED FILES HERE
cd fedn/
docker network create fedn_default
docker-compose -f ./config/base-services.yaml -f ./config/private-network.yaml up -d
docker-compose -f ./config/reducer.yaml -f ./config/private-network.yaml up -d
