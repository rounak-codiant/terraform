#!/bin/bash

sudo apt update

# Install CloudWatch Agent
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E amazon-cloudwatch-agent.deb
sudo mkdir -p /usr/share/collectd/
sudo touch /usr/share/collectd/types.db
sudo apt install python3-pip -y
sudo pip3 install collectd
sudo systemctl enable amazon-cloudwatch-agent
sudo systemctl start amazon-cloudwatch-agent
sudo rm -rf amazon-cloudwatch*

# Install Code Deploy Agent
sudo apt-get install ruby-full ruby-webrick wget -y
sudo wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/releases/codedeploy-agent_1.3.2-1902_all.deb
sleep 5
mkdir codedeploy-agent_1.3.2-1902_ubuntu22
dpkg-deb -R codedeploy-agent_1.3.2-1902_all.deb codedeploy-agent_1.3.2-1902_ubuntu22
sudo sed 's/Depends:.*/Depends:ruby3.0/' -i ./codedeploy-agent_1.3.2-1902_ubuntu22/DEBIAN/control
sudo dpkg-deb -b codedeploy-agent_1.3.2-1902_ubuntu22/
sudo apt --fix-broken install
sudo dpkg -i codedeploy-agent_1.3.2-1902_ubuntu22.deb
sudo rm -rf codedeploy*
sudo apt --fix-broken install -y
sudo systemctl start codedeploy-agent.service
sudo systemctl enable codedeploy-agent.service

# Install Supervisor
sudo apt-get install supervisor -y
sudo systemctl enable supervisor
sudo rm -rf *.sh