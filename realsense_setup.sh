#!/bin/bash

sudo apt-get update -y 
sudo apt-get upgrade -y

echo "install realsense sdk"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
sudo apt-get install librealsense2-dkms -y
sudo apt-get install librealsense2-utils -y
sudo apt-get install librealsense2-dev -y
sudo apt-get install librealsense2-dbg -y

echo "install realsense-ros"
sudo apt-get install ros-melodic-ddynamic-reconfigure

cd ~/catkin_ws/src
git clone https://github.com/IntelRealSense/realsense-ros.git
cd realsense-ros
git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1`

# d435 post processing
cd ~/catkin_ws/src/realsense-ros/realsense2_camera/launch
sudo sed -i '26 i\      <arg name="filters" default="pointcloud,disparity,spatial,temporal,decimation"/>' demo_pointcloud.launch
sudo sed -i '130d' rs_camera.launch
sudo sed -i '130 i\      <arg name="filters" default="pointcloud,disparity,spatial,temporal,decimation"/>' rs_camera.launch

cd ~/catkin_ws/src/
catkin_init_workspace
cd ~/catkin_ws
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "alias cs='cd ~/catkin_ws/src'" >> ~/.bashrc
source ~/.bashrc




