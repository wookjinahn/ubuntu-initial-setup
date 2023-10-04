#!/bin/bash

HOME_DIR=/home/$USER/
CURRENT_DIR=$(pwd)

# red color
COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_END="\033[0m"

echo
echo
echo
echo -e "$COLOR_RED ------------------------------------------------------------------------ $COLOR_END"
echo -e "$COLOR_RED |                  | Type package install directory |                  | $COLOR_END"
echo -e "$COLOR_RED ------------------------------------------------------------------------ $COLOR_END"
echo " ex) /home/wj or /home/wj/Library ..."
read INSTALL_DIR
echo "Check install directory : $INSTALL_DIR"
echo "."
echo "."
echo "."
echo "."
echo -e "$COLOR_GREEN --------------------- $COLOR_END"
echo -e "$COLOR_GREEN |   INSTALL 00/12   | $COLOR_END"
echo -e "$COLOR_GREEN |  start installing | $COLOR_END"
echo -e "$COLOR_GREEN --------------------- $COLOR_END"

sudo apt-get update -y
sudo apt-get upgrade -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 01/12    | $COLOR_END"
echo -e "$COLOR_GREEN |      Essential      | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install build-essential git wget gpg curl pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 02/12    | $COLOR_END"
echo -e "$COLOR_GREEN |        Cmake        | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
cd $INSTALL_DIR
sudo apt-get install libssl-dev -y
wget https://github.com/Kitware/CMake/releases/download/v3.21.0/cmake-3.21.0.tar.gz
tar -xvf cmake-3.21.0.tar.gz
cd cmake-3.21.0
./bootstrap && make && sudo make install
cd .. && sudo rm -rf cmake-3.21.0 && sudo rm -rf cmake-3.21.0.tar.gz

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 03/12    | $COLOR_END"
echo -e "$COLOR_GREEN |        CLion        | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo snap install clion --classic

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 04/12    | $COLOR_END"
echo -e "$COLOR_GREEN |        Slack        | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo snap install slack --classic

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 05/12    | $COLOR_END"
echo -e "$COLOR_GREEN |        Chrome       | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm -rf ./google-chrome-stable_current_amd64.deb

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 06/12    | $COLOR_END"
echo -e "$COLOR_GREEN |       Python3       | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install python3 python3-pip -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 07/12    | $COLOR_END"
echo -e "$COLOR_GREEN |      terminator     | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install terminator -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 08/12    | $COLOR_END"
echo -e "$COLOR_GREEN | simplescreenrecorder| $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install simplescreenrecorder -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 09/12    | $COLOR_END"
echo -e "$COLOR_GREEN |        Eigen        | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install libeigen3-dev

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 10/12    | $COLOR_END"
echo -e "$COLOR_GREEN |         RBDL        | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
cd $INSTALL_DIR
sudo apt-get install libboost-all-dev -y
git clone https://github.com/rbdl/rbdl.git
cd rbdl
git submodule init
git submodule update
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DRBDL_BUILD_ADDON_URDFREADER=ON
make
sudo make install

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 11/12    | $COLOR_END"
echo -e "$COLOR_GREEN |         Qt5         | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install qtcreator -y
sudo apt-get install qt5-default -y
echo
echo
echo -e "$COLOR_GREEN --------------------- $COLOR_END"
echo -e "$COLOR_GREEN |   INSTALL 12/12   | $COLOR_END"
echo -e "$COLOR_GREEN |     installed     | $COLOR_END"
echo -e "$COLOR_GREEN --------------------- $COLOR_END"

echo -e "$COLOR_GREEN -------------- $COLOR_END"
echo -e "$COLOR_GREEN | setup bash | $COLOR_END"
echo -e "$COLOR_GREEN -------------- $COLOR_END"
echo "alias gb='gedit ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
source ~/.bashrc

cd $CURRENT_DIR
cd ..
sudo rm -rf ubuntu-initial-setup-upboard.sh

echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
