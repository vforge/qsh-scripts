#!/bin/sh

# make sure we're up to date
sudo apt-get update

# install deps
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add docker repo's keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker repo
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# fetch updates
sudo apt-get update

# install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io
