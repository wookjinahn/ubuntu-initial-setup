#!/bin/bash

HOME_DIR=/home/$USER/

# red color
COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_END="\033[0m"

echo "."
echo "."
echo "."
echo -e "$COLOR_RED ------------------------------------------------------------------------ $COLOR_END"
echo -e "$COLOR_RED |                  | Type package install directory |                  | $COLOR_END"
echo -e "$COLOR_RED ------------------------------------------------------------------------ $COLOR_END"
echo " ex) /home/wj or /home/wj/Library ..."
read INSTALL_DIR
echo "install directory : $INSTALL_DIR"

sudo apt-get update -y
sudo apt-get upgrade -y

echo -e "$COLOR_GREEN install GPU driver $COLOR_END"
ubuntu-drivers devices
echo -e "$COLOR_RED ----------------------------------------------------------------------- $COLOR_END"
echo -e "$COLOR_RED |                   | Type recommended GPU driver |                   | $COLOR_END"
echo -e "$COLOR_RED ----------------------------------------------------------------------- $COLOR_END"
echo -e " ex) nvidia-driver-470  $COLOR_RED ( BEFORE - distro ... )  $COLOR_END"
echo -e " PLEASE JUST ENTER and SKIP, if you don't have external graphic card."
read GPU_DRIVER
echo "gpu driver : $GPU_DRIVER"
if [ $GPU_DRIVER ]
then
  sudo apt-get install $GPU_DRIVER -y
else
  echo "Skip this process."
fi

echo -e "$COLOR_GREEN install essential $COLOR_END"
sudo apt-get install build-essential git wget gpg curl pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y

echo -e "$COLOR_GREEN install cmake $COLOR_END"
cd $INSTALL_DIR
sudo apt-get install libssl-dev -y
wget https://github.com/Kitware/CMake/releases/download/v3.21.0/cmake-3.21.0.tar.gz
tar -xvf cmake-3.21.0.tar.gz
cd cmake-3.21.0
./bootstrap && make && sudo make install
cd .. && sudo rm -rf cmake-3.21.0 && sudo rm -rf cmake-3.21.0.tar.gz

echo -e "$COLOR_GREEN install Docker $COLOR_END"
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo -e "$COLOR_GREEN install CLion IDE $COLOR_END"
sudo snap install clion --classic

echo -e "$COLOR_GREEN install Slack $COLOR_END"
sudo snap install slack --classic

echo -e "$COLOR_GREEN install Google Chrome $COLOR_END"
wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm -rf ./google-chrome-stable_current_amd64.deb

echo -e "$COLOR_GREEN install python3 $COLOR_END"
sudo apt-get install python3 python3-pip -y

echo -e "$COLOR_GREEN install terminator $COLOR_END"
sudo apt-get install terminator -y

echo -e "$COLOR_GREEN install simplescreenrecorder $COLOR_END"
sudo apt-get install simplescreenrecorder -y

echo -e "$COLOR_GREEN install eigen $COLOR_END"
sudo apt-get install libeigen3-dev

echo -e "$COLOR_GREEN install rbdl with urdf reader $COLOR_END"
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

echo -e "$COLOR_GREEN install qt5 $COLOR_END"
sudo apt-get install qtcreator -y
sudo apt-get install qt5-default -y

echo -e "$COLOR_GREEN install raisim $COLOR_END"
cd $INSTALL_DIR
echo -e "$COLOR_RED ------------------------------------------------------------------------- $COLOR_END"
echo -e "$COLOR_RED |                   | Type Raisim install directory |                   | $COLOR_END"
echo -e "$COLOR_RED ------------------------------------------------------------------------- $COLOR_END"
echo "ex) /home/wj/raisimLib/install or /home/wj/Library/raisimLib/build/install"
read RAI_INSTALL_DIR
echo "Raisim install directory : $RAI_INSTALL_DIR"
cd $INSTALL_DIR
cd raisimLib
mkdir build
mkdir install
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

echo -e "$COLOR_GREEN setup bash $COLOR_END"
echo "alias gb='gedit ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
source ~/.bashrc

echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
echo -e "$COLOR_RED NEED TO REBOOT ! $COLOR_END"
