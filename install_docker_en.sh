#!/bin/bash
set -o errexit

source etc/docker_config
apt-get update --fix-missing
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-cache policy docker-ce
apt install -y docker-ce=$DOCKER_CE_VERSION
systemctl daemon-reload
systemctl restart docker