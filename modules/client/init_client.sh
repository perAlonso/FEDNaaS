#!/bin/sh

sudo apt update -y
sudo apt install -y docker-compose git-lfs

cd ~

git clone https://github.com/scaleoutsystems/examples.git


cd examples/mnist-keras/
cp ~/extra-hosts-client.yaml ./extra-hosts.yaml
cp ~/Dockerfile ./Dockerfile
curl -k "https://${reducer_ip}:8090/config/download" > client.yaml

sudo docker build --network=host . -t mnist-client:latest

sudo cp data/mnist.npz data/clients/1/
sudo cp data/mnist.npz data/clients/0/

sudo -E docker network create fedn_default
sudo -E docker-compose -f docker-compose.yaml -f private-network.yaml -f extra-hosts.yaml up --scale client0=4 -d
