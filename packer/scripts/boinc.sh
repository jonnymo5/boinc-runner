#!/bin/bash

# Install docker
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo touch /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee -a /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y apparmor
sudo apt-get install -y docker-engine

# Prepare the boinc upstart script
sed -i "s/<BOINC_URL>/$BOINC_URL/g" /tmp/boinc.service
sed -i "s/<BOINC_KEY>/$BOINC_KEY/g" /tmp/boinc.service

sudo mv /tmp/boinc.service /lib/systemd/system
sudo systemctl enable boinc.service
