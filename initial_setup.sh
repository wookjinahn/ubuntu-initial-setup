#!/bin/bash

HOME_DIR=/home/$USER/
CURRENT_DIR=$(pwd)
LIB_INSTALL_DIR=$HOME_DIR/Library
CODES_DIR=$HOME_DIR/Desktop/Codes
RAI_INSTALL_DIR=$LIB_INSTALL_DIR/raisimLib/install

# red color
COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_END="\033[0m"

default()
{
  echo "."
  echo "."
  echo "."
  echo "Library install directory : $LIB_INSTALL_DIR"
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
  echo -e "$COLOR_GREEN |    INSTALL 00/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |   start installing  | $COLOR_END"
  echo -e "$COLOR_GREEN --------------------- $COLOR_END"

  mkdir -p $LIB_INSTALL_DIR
  sudo apt-get update -y
  sudo apt-get upgrade -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 01/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |      GPU driver     | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  if [ $GPU_DRIVER ]
  then
    sudo apt-get install $GPU_DRIVER -y
  else
    echo "$COLOR_GREEN Skip this process. $COLOR_END"
  fi

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 02/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |      Essential      | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install build-essential git wget gpg curl htop pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 03/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        Cmake        | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  cd $LIB_INSTALL_DIR
  sudo apt-get install libssl-dev -y
  wget https://github.com/Kitware/CMake/releases/download/v3.21.0/cmake-3.21.0.tar.gz
  tar -xvf cmake-3.21.0.tar.gz
  cd cmake-3.21.0
  ./bootstrap && make && sudo make install
  cd .. && sudo rm -rf cmake-3.21.0 && sudo rm -rf cmake-3.21.0.tar.gz

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 04/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        Docker       | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get update -y
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
  sudo apt-get update -y
  sudo apt-get install docker-ce docker-ce-cli containerd.io -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 05/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        CLion        | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo snap install clion --classic

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 06/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        VSCode       | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo snap install code --classic

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 07/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        Slack        | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo snap install slack --classic

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 08/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        Chrome       | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb -y
  sudo rm -rf ./google-chrome-stable_current_amd64.deb

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 09/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |       Python3       | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install python3 python3-pip -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 10/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |      terminator     | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install terminator -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 11/16    | $COLOR_END"
  echo -e "$COLOR_GREEN | simplescreenrecorder| $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install simplescreenrecorder -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 12/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |  VLC Video Player   | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo snap install vlc

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 13/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        Eigen        | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install libeigen3-dev

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 14/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |         RBDL        | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  cd $LIB_INSTALL_DIR
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
  echo -e "$COLOR_GREEN |    INSTALL 15/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |         Qt5         | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install qtcreator -y
  sudo apt-get install qt5-default -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 16/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        Raisim       | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  cd $LIB_INSTALL_DIR
  git clone https://github.com/raisimTech/raisimLib.git
  cd raisimLib
  mkdir build
  mkdir -p $RAI_INSTALL_DIR
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$RAI_INSTALL_DIR -DRAISIM_EXAMPLE=ON
  make install -j4
  sudo apt-get install minizip ffmpeg -y
  sudo apt-get install vulkan-utils -y
  echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIB_INSTALL_DIR/raisimLib/raisim/linux/lib" >> ~/.bashrc
  echo "export PYTHONPATH=$PYTHONPATH:$LIB_INSTALL_DIR/raisimLib/raisim/linux/lib" >> ~/.bashrc
  echo " --------------------------------------------------------------------------------------------------- "
  echo " |     For link raisim, cmake option : -DCMAKE_PREFIX_PATH=$LIB_INSTALL_DIR/raisimLib/raisim/linux     | "
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
  echo "" >> ~/.bashrc
  source ~/.bashrc
}

remove()
{
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
}

wj()
{
  mkdir -p $CODES_DIR

  USERNAME="wookjinahn"
  TOKEN=$(sed -n '1p' $HOME_DIR/test.txt)

  CAMEL_GIT="github.com/PNUxCAMEL"
  REPO_1="camel-euclid"
  REPO_2="camel-perception-heightmap"
  REPO_3="camel-canine"

  cd $LIB_INSTALL_DIR
  git clone https://${USERNAME}:${TOKEN}@"$CAMEL_GIT/$REPO_1.git"
  git clone https://${USERNAME}:${TOKEN}@"$CAMEL_GIT/$REPO_2.git"
  cd $REPO_1 && mkdir build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make && sudo make install && cd $LIB_INSTALL_DIR
  cd $REPO_2 && ./install.sh

#  cd $CODES_DIR
#  git clone https://${USERNAME}:${TOKEN}@"$CAMEL_GIT/$REPO_3.git"

  echo "alias cl='cd $LIB_INSTALL_DIR'" >> ~/.bashrc
  echo "alias cc='cd $CODES_DIR'" >> ~/.bashrc
  echo "alias bi='make && sudo make install'" >> ~/.bashrc
  echo "alias rr='cd $LIB_INSTALL_DIR/raisimLib/raisimUnity/linux && ./raisimUnity.x86_64'" >> ~/.bashrc
  echo "alias rrg='cd $LIB_INSTALL_DIR/raisimLib/raisimUnityOpengl/linux && ./raisimUnity.x86_64'" >> ~/.bashrc
  echo "alias rcs='cd $CODES_DIR/camel-canine/cmake-build-release && cmake --build . --target camel-canine-simul -- -j4 && ./camel-canine-simul'" >> ~/.bashrc
  echo "alias rtc='cd $CODES_DIR/camel-canine/cmake-build-debug/canine_ui && ./QtTCPClient'" >> ~/.bashrc
  echo "alias brcs='cd $LIB_INSTALL_DIR/camel-perception-heightmap/build && make && sudo make install && cd $CODES_DIR/camel-canine/cmake-build-release && cmake --build . --target camel-canine-simul -- -j4 && ./camel-canine-simul'" >> ~/.bashrc
}

if [ $# -eq 0 ]; then
  default
  remove
fi

while getopts 'a' flag; do
  case "${flag}" in
    a)default
      wj
      remove
      ;;
  esac
done