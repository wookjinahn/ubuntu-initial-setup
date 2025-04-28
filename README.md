# How to use  

Shell script for initial setting for Ubuntu 20.04.  
There are **Essential + Raisim** setup file & realsense setup file.  
You have to reboot your system after run "initial_setup.sh"

## Contains
- desktop.sh 
  + Graphic Card Driver
  + Essential Package (GNU, git, wget, curl, make, CMake, htop ...)
  + Docker
  + CLion 
  + VSCode
  + Slack  
  + Google Chrome  
  + Python3  
  + terminator  
  + simplescreenrecorder
  + VLC Video Player
  + Hancom HWP
  + **Raisim** (with Eigen, RBDL, Qt5)


- upboard.sh 
  + Essential Package (GNU, git, wget, curl, make, CMake ...)
  + CLion  
  + VSCode
  + Slack  
  + Google Chrome  
  + Python3  
  + terminator  
  + simplescreenrecorder  
  + Eigen
  + RBDL
  
  
- jetson_xavier_nx.sh 
  + Essential Package (GNU, git, wget, curl, make, CMake, htop ...)
  + Docker
  + CLion
  + VSCode
  + Chromium
  + Python3
  + terminator
  + simplescreenrecorder
  + VLC Video Player
  
  
- realsense_setup.sh  
  + realsense sdk  
  + realsense-ros  
  + d435 post processing  

## How to get  
if you have git package already.  

```bash
cd <YOUR_PATH>
git clone https://github.com/wookjinahn/ubuntu-initial-setup.git
cd ubuntu-initial-setup
```

else,  
Click Code button and **Download ZIP file** and **extract.**   
Then run by termianl  


## How to run  

```bash
cd <INITIAL_SETUP_DIR>
./desktop.sh    # upboard, jetson_xavier_nx
```

**you need to enter GPU driver during processing.**

### GPU driver
- You have to enter what is marked recommended. If you don't have an external graphics card, enter and move on.   
  _ex) nvidia-driver-470_ ( BEFORE - distro ... )   
