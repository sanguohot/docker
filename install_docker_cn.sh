#!/bin/bash
set -o errexit

source etc/docker_config
apt-get update --fix-missing
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
apt-get update --fix-missing
apt install -y docker-ce=$DOCKER_CE_VERSION
mkdir -p /etc/docker
tee /etc/docker/daemon.json << EOF
{
  "registry-mirrors": ["${DOCKER_SPEED_UP_ADDRESS}"]
}
EOF
systemctl daemon-reload
systemctl restart docker
