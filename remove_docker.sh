#!/bin/bash
set -o errexit

apt-get remove docker docker-engine docker.io docker-ce -y
apt autoremove -y
rm -rf /etc/docker/daemon.json