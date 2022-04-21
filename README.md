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
if you have git package already.  

```bash
cd <YOUR_PATH>
git clone https://github.com/wookjinAhn/ubuntu-initial-setup.git
cd ubuntu-initial-setup
```

else.  
Click Code button and Download ZIP file and decompress. 
then access the file by termianl  


## how to run  

```bash
sudo chmod +x essential_setup_melodic.sh
sudo chmod +x ros_noetic_setup.sh   # sudo chmod +x realsense_setup.sh

mv essential_setup_melodic.sh ~/
mv ros_noetic_setup.sh ~/           # mv realsense_setup.sh ~/

cd
./essential_setup_melodic.sh
./ros_noetic_setup.sh               #./ros_noetic_setup.sh
```
