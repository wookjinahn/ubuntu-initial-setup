# How to use  

Shell script for initial setting for Ubuntu 18.04.  
There are essential + ros setup file & realsense setup file.  
You have to reboot your system after run "essential_setup.sh"

# YOU MUST CHECK Nvidia Graphic Driver VERSION !
you can check you vga driver version by  
```bahs
ubuntu-drivers devices        # reference : https://www.oofbird.me/55  
```
then edit line 7. in your file essential_setup.sh ! 

## contains
- essential_setup.sh 
  + Graphic Card Driver 
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
# !!!!! check your graphic driver version !!!!!
./essential_setup_melodic.sh

# !!!!! you must reboot after essential setup !!!!!  

./realsense_setup.sh               #./realsense_setup.sh
```

![Screenshot from 2022-04-21 20-29-52](https://user-images.githubusercontent.com/79748805/164449366-0033cd0d-21aa-4c2d-9c3d-83437b37e869.png)
