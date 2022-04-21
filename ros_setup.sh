sudo apt-get update -y 
sudo apt-get upgrade -y

echo -e "\e[31m=======================\e[0m"
echo -e "\e[31m| Install ROS melodic |\e[0m"
echo -e "\e[31m=======================\e[0m"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update -y
sudo apt install ros-noetic-desktop-full -y

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
sudo rosdep init
rosdep update

# realsense sdk
echo -e "\e[31m========================\e[0m"
echo -e "\e[31m| Install librealsense |\e[0m"
echo -e "\e[31m========================\e[0m"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
sudo apt-get install librealsense2-dkms -y
sudo apt-get install librealsense2-utils -y
sudo apt-get install librealsense2-dev -y
sudo apt-get install librealsense2-dbg -y


# realsense-ros
sudo apt-get install ros-noetic-ddynamic-reconfigure
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src/
git clone https://github.com/IntelRealSense/realsense-ros.git
cd realsense-ros/
git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1`
cd ..
catkin_init_workspace
cd ~/catkin_ws
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "alias cs='cd ~/catkin_ws/src'" >> ~/.bashrc
echo "alias cw='cd ~/catkin_ws'" >> ~/.bashrc
echo "alias cm='cd ~/catkin_ws & catkin_make'" >> ~/.bashrc
source ~/.bashrc




