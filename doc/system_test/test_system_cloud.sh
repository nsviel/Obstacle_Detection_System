#!/bin/bash

# Author: Nathan Sanchiz-Viel
# Example of a script to install and run the whole system.


echo -e "--- \e[92mObstacle Detection System start\e[0m ---"

# 1/ Network Configuration
###############################

echo -e "[\e[92m#\e[0m] Network parameters"
echo -------------------------

# Edge server
ip_edge_server=10.201.20.24
user_edge_server=user
echo -e "IP Edge server: \e[92m"$ip_edge_server"\e[0m"
echo -e "User Edge server: \e[92m"$user_edge_server"\e[0m"
echo

# Sensor server
ip_sensor_server=10.201.20.131
user_sensor_server=user

echo -e "IP sensor server: \e[92m"$ip_sensor_server"\e[0m"
echo -e "User sensor server: \e[92m"$user_sensor_server"\e[0m"
echo -------------------------


# 2/ Download codes from github
###############################
echo -e "[\e[92m#\e[0m] Clone github repository in local if no present ..."
if cd ../../../Obstacle_detection_system; 
then cd .. && echo -e "[\e[92m#\e[0m] Github repository already cloned"; 
else git clone --recurse-submodules https://github.com/nsviel/Obstacle_detection_system; 
fi


# 3/ Copy Edge module to Edge server and run associated terminals
###############################
echo -e "[\e[92m#\e[0m] Copy file to \e[94mEdge\e[0m server ..."
scp -r -o ConnectTimeout=3 Obstacle_detection_system/Edge_server_module $user_edge_server@$ip_edge_server:/home/$user_edge_server/

# Start a new local terminal, connect to the server and run Edge orchestrator component
gnome-terminal --title="Edge Orchestrator component" -- bash -c \
sshpass -p "je" ssh -t $user_edge_server@$ip_edge_server \
"cd Edge_server_module/Edge_orchestrator_component/docker; ./build.sh; ./run.sh; exec bash"

# Start a new local terminal, connect to the server and run Data processing component
gnome-terminal --title="Data processing component" -- bash -c \
sshpass -p "je" ssh -t $user_edge_server@$ip_edge_server \
"cd Edge_server_module/Data_processing_component/docker; ./build.sh; ./run.sh; exec bash"


# 4/ Copy Data acquisition module to sensor server
###############################
echo -e "[\e[92m#\e[0m] Copy file to \e[94mtrain capture\e[0m server ..."
scp -r -o ConnectTimeout=3 Obstacle_detection_system/Data_acquisition_module $user_edge_server@$ip_sensor_server:/home/$user_edge_server/

# Start Capture module on a new terminal
gnome-terminal --title="Capture module" -- bash -c \
sshpass -p "je" ssh -t $user_edge_server@$ip_sensor_server \
"cd Data_acquisition_module/docker; ./build.sh; ./run.sh; exec bash"

# Start Control interface module on a new terminal
gnome-terminal --title="Control interface module" -- bash -c \
"cd Obstacle_detection_system/Control_interface_module; ./install.sh; ./run.sh; exec bash"


# 5/ End
###############################
echo -e "[\e[92m#\e[0m] Done"
