#!/bin/bash

HOME_DIR=/home/$USER/
CURRENT_DIR=$(pwd)
LIB_INSTALL_DIR=$HOME_DIR/Library
CODES_DIR=$HOME_DIR/Desktop/Codes

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
  echo -e "$COLOR_GREEN |      Essential      | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install build-essential git wget gpg curl htop pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 02/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        Cmake        | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  cd $LIB_INSTALL_DIR
  sudo apt-get install libssl-dev -y
  wget https://github.com/Kitware/CMake/releases/download/v3.26.0/cmake-3.26.0.tar.gz
  tar -xvf cmake-3.26.0.tar.gz
  cd cmake-3.26.0
  ./bootstrap && make && sudo make install
  cd .. && sudo rm -rf cmake-3.26.0 && sudo rm -rf cmake-3.26.0.tar.gz

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 03/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        CLion        | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo snap install clion --classic

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 04/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |        VSCode       | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  # sudo snap install code --classic

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 05/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |       Chromium      | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install chromium-browser -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 06/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |       Python3       | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install python3 python3-pip -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 07/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |      terminator     | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install terminator -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 08/16    | $COLOR_END"
  echo -e "$COLOR_GREEN | simplescreenrecorder| $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo apt-get install simplescreenrecorder -y

  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  echo -e "$COLOR_GREEN |    INSTALL 09/16    | $COLOR_END"
  echo -e "$COLOR_GREEN |  VLC Video Player   | $COLOR_END"
  echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
  sudo snap install vlc

  echo "."
  echo "."
  echo "."
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
