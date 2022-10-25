#!/bin/bash

set -e
set -x 

set
echo "Running ES installer; will be accessing ${build_ip} during build"

# prereqs
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install curl wget gnupg libterm-readline-gnu-perl console-data

# repo
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get -y install elasticsearch kibana

#enable
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch
sudo /bin/systemctl enable kibana

echo "server.host: 0.0.0.0" | sudo tee -a /etc/kibana/kibana.yml
curl http://${build_ip}:${PACKER_HTTP_PORT}/issue_net | sudo tee /etc/issue
