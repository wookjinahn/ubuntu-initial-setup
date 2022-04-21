# How to use

Shell script for initial setting for Ubuntu.
There are essential setup file and ros + realsense file.
You choose one of ros version and use it.


## contains
- essential_setup.sh

  + Clion
  
  + Slack
  
  + Google Chrome
  
  + terminator
  
  + C++
  
  + Python3
  
  
- ros_noetic_setup.sh

  + ros noetic
  
  + realsense sdk
  
  + ealsense-ros
  
  + d435 post processing


## how to get

```bash
cd <YOUR_PATH>
git clone https://github.com/wookjinAhn/ubuntu-initial-setup.git
cd ubuntu-initial-setup
```


## how to run

```bash
sudo chmod +x essential_setup.sh
sudo chmod +x ros_noetic_setup.sh   # sudo chmod +x ros_melodic_setup.sh

mv essential_setup.sh ~/
mv ros_noetic_setup.sh ~/           # mv ros_melodic_setup.sh ~/

./essential_setup.sh
./ros_noetic_setup.sh               #./ros_noetic_setup.sh
```
