#!/bin/sh

sudo apt update -y
sudo apt install -y docker-compose git-lfs

cd ~

git clone https://github.com/scaleoutsystems/fedn.git
cp ~/settings-reducer.yaml ~/fedn/config/
cp ~/extra-hosts-reducer.yaml ~/fedn/config/
#COPY TEMPLATED FILES HERE
cd fedn/
sudo docker network create fedn_default
sudo -E docker-compose -f ./config/base-services.yaml -f ./config/private-network.yaml up -d
sudo -E docker-compose -f ./config/reducer.yaml -f ./config/extra-hosts-reducer.yaml -f ./config/private-network.yaml up -d
