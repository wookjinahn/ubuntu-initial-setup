# How to use

Shell script for initial setting for Ubuntu.  
There are essential setup file and ros + realsense file.  
You choose one of ros version and use it. 


## contains
- essential_setup.sh  
  + CLion    
  + VSCode  
  + Slack    
  + Google Chrome    
  + terminator    
  + C++    
  + Python3    
  + ROS  
  
- realsense_setup.sh  
  + realsense sdk    
  + realsense-ros    
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
sudo chmod +x essential_setup_melodic.sh   # sudo chmod +x essential_setup_melodic.sh
sudo chmod +x realsense_setup.sh   

mv essential_setup_melodic.sh ~/
mv realsense_setup.sh ~/           # mv realsense_setup.sh ~/

cd
./essential_setup_melodic.sh
./realsense_setup.sh               #./realsense_setup.sh
```

![Screenshot from 2022-04-21 20-29-52](https://user-images.githubusercontent.com/79748805/164449366-0033cd0d-21aa-4c2d-9c3d-83437b37e869.png)
