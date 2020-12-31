#!/bin/bash

VAR="Y"
read -p "Do you want to build the package? (Y/n) :" VARIABLE
if [ "$VARIABLE" = "$VAR" ]; then
   catkin_make && sleep 5 && source devel/setup.bash
else
   source devel/setup.bash
fi

echo "Launching the RP_Lidar package ..."
roslaunch rplidar_ros rplidar.launch && sleep 2 

echo "Launching the SLAM package ..."
gnome-terminal & disown && roslaunch hector_slam_launch tutorial_tif.launch && sleep 2
