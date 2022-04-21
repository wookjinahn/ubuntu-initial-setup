#!/bin/bash

sudo apt-get update -y 
sudo apt-get upgrade -y

echo "install CLion IDE"
sudo snap install clion --classic 

echo "install Slack"
sudo snap install slack --classic 

echo "install Google Chrome"
wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm -rf ./google-chrome-stable_current_amd64.deb

echo "install essential"
sudo apt-get install build-essential cmake git wget curl pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y

echo "install python3"
sudo apt-get install python3 python3-pip -y

echo "install terminator"
sudo apt-get install terminator -y

echo "setup bash"
echo "alias gb='gedit ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
source ~/.bashrc

echo "NEED TO REBOOT !"
