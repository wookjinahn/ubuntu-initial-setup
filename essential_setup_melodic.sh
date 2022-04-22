#!/bin/bash

sudo apt-get update -y 
sudo apt-get upgrade -y

echo "install VGA driver"
apt-get install nvidia-driver-470 -y

echo "install essential"
sudo apt-get install build-essential git wget curl pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y

echo "install cmake"
sudo apt-get install libssl-dev -y
wget https://github.com/Kitware/CMake/releases/download/v3.21.0/cmake-3.21.0.tar.gz
tar -xvf cmake-3.21.0.tar.gz
cd cmake-3.21.0
./bootstrap && make && sudo make install

echo "install CLion IDE"
sudo snap install clion --classic 

echo "install VSCode"
sudo snap install --classic code

echo "install Slack"
sudo snap install slack --classic 

echo "install Google Chrome"
wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm -rf ./google-chrome-stable_current_amd64.deb

echo "install python3"
sudo apt-get install python3 python3-pip -y

echo "install terminator"
sudo apt-get install terminator -y

echo "install ROS melodic"
sudo apt update -y
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update -y
sudo apt install ros-melodic-desktop-full -y
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo rosdep init
rosdep update

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin_make

echo "setup bash"
echo "alias gb='gedit ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
source ~/.bashrc

echo "NEED TO REBOOT !"
