#!/bin/bash

HOME_DIR=/home/$USER/
CURRENT_DIR=$(pwd)
INSTALL_DIR=$HOME_DIR/Library
RAI_INSTALL_DIR=INSTALL_DIR/raisimLib/install

# red color
COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_END="\033[0m"

echo "."
echo "."
echo "."
echo "Install directory : $INSTALL_DIR"
echo "Raisim install directory : $RAI_INSTALL_DIR"
echo "."
echo "."
echo "Load gpu drivers..."
ubuntu-drivers devices
echo -e "$COLOR_RED ----------------------------------------------------------------------- $COLOR_END"
echo -e "$COLOR_RED |                   | Type recommended GPU driver |                   | $COLOR_END"
echo -e "$COLOR_RED ----------------------------------------------------------------------- $COLOR_END"
echo -e " ex) nvidia-driver-470  $COLOR_RED ( BEFORE - distro ... )  $COLOR_END"
echo -e "$COLOR_GREEN PLEASE JUST ENTER and SKIP, if you don't have external graphic card. $COLOR_END"
read GPU_DRIVER
echo "Check gpu driver : $GPU_DRIVER"
echo "."
echo "."
echo "."
echo "."
echo -e "$COLOR_GREEN --------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 00/15    | $COLOR_END"
echo -e "$COLOR_GREEN |   start installing  | $COLOR_END"
echo -e "$COLOR_GREEN --------------------- $COLOR_END"

mkdir -p $INSTALL_DIR
sudo apt-get update -y
sudo apt-get upgrade -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 01/15    | $COLOR_END"
echo -e "$COLOR_GREEN |      GPU driver     | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
if [ $GPU_DRIVER ]
then
  sudo apt-get install $GPU_DRIVER -y
else
  echo "$COLOR_GREEN Skip this process. $COLOR_END"
fi

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 02/15    | $COLOR_END"
echo -e "$COLOR_GREEN |      Essential      | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install build-essential git wget gpg curl pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 03/15    | $COLOR_END"
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
echo -e "$COLOR_GREEN |    INSTALL 04/15    | $COLOR_END"
echo -e "$COLOR_GREEN |        Docker       | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 05/15    | $COLOR_END"
echo -e "$COLOR_GREEN |        CLion        | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo snap install clion --classic

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 06/15    | $COLOR_END"
echo -e "$COLOR_GREEN |        VSCode       | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo snap install code --classic

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 07/15    | $COLOR_END"
echo -e "$COLOR_GREEN |        Slack        | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo snap install slack --classic

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 08/15    | $COLOR_END"
echo -e "$COLOR_GREEN |        Chrome       | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm -rf ./google-chrome-stable_current_amd64.deb

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 09/15    | $COLOR_END"
echo -e "$COLOR_GREEN |       Python3       | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install python3 python3-pip -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 10/15    | $COLOR_END"
echo -e "$COLOR_GREEN |      terminator     | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install terminator -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 11/15    | $COLOR_END"
echo -e "$COLOR_GREEN | simplescreenrecorder| $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install simplescreenrecorder -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 12/15    | $COLOR_END"
echo -e "$COLOR_GREEN |        Eigen        | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install libeigen3-dev

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 13/15    | $COLOR_END"
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
echo -e "$COLOR_GREEN |    INSTALL 14/15    | $COLOR_END"
echo -e "$COLOR_GREEN |         Qt5         | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
sudo apt-get install qtcreator -y
sudo apt-get install qt5-default -y

echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN |    INSTALL 15/15    | $COLOR_END"
echo -e "$COLOR_GREEN |        Raisim       | $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
cd $INSTALL_DIR
git clone https://github.com/raisimTech/raisimLib.git
cd raisimLib
mkdir build
mkdir -p $RAI_INSTALL_DIR
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$RAI_INSTALL_DIR -DRAISIM_EXAMPLE=ON
make install -j4
sudo apt-get install minizip ffmpeg -y
sudo apt-get install vulkan-utils -y
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$INSTALL_DIR/raisimLib/raisim/linux/lib" >> ~/.bashrc
echo "export PYTHONPATH=$PYTHONPATH:$INSTALL_DIR/raisimLib/raisim/linux/lib" >> ~/.bashrc
echo " --------------------------------------------------------------------------------------------------- "
echo " |     For link raisim, cmake option : -DCMAKE_PREFIX_PATH=$INSTALL_DIR/raisimLib/raisim/linux     | "
echo " --------------------------------------------------------------------------------------------------- "
echo
echo
echo -e "$COLOR_GREEN --------------------- $COLOR_END"
echo -e "$COLOR_GREEN |     INSTALLED     | $COLOR_END"
echo -e "$COLOR_GREEN --------------------- $COLOR_END"

echo -e "$COLOR_GREEN -------------- $COLOR_END"
echo -e "$COLOR_GREEN | Setup bash | $COLOR_END"
echo -e "$COLOR_GREEN -------------- $COLOR_END"
echo "" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "alias gb='gedit ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
echo "alias cl='cd $INSTALL_DIR'" >> ~/.bashrc
echo "" >> ~/.bashrc
source ~/.bashrc

cd $CURRENT_DIR
cd ..
if [ -e ubuntu-initial-setup ]
then
  sudo rm -rf ubuntu-initial-setup
else
  sudo rm -rf ubuntu-initial-setup-master
  sudo rm -rf ubuntu-initial-setup-master.zip
fi

echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
