#!/bin/bash

# Author: Nathan Sanchiz-Viel
# Example of a script to install and run the whole system.


echo -e "--- \e[94mTest du système Obstacle Detection\e[0m ---"

# Clone github repo
echo -e "[\e[92m#\e[0m] Clone github repository ..."
git clone --recurse-submodules https://github.com/nsviel/Obstacle_detection_system

# Copy file to server
echo -e "[\e[92m#\e[0m] Copy file to edge server ..."
echo -e "[\e[92m#\e[0m] Password: \e[92mje\e[0m"
scp -r -o ConnectTimeout=3 Obstacle_detection_system/Edge_server_module je@10.201.20.24:/home/je/

# Start Edge orchestrator component on a new terminal
xterm -e sshpass -p "je" ssh -t je@10.201.20.24 'cd Edge_server_module/Edge_orchestrator_component/docker; ./build.sh; ./run.sh; bash -l'

# Start Processing component on a new terminal
xterm -e sshpass -p "je" ssh -t je@10.201.20.24 'cd Edge_server_module/Data_processing_component; ./run.sh; bash -l'

# Copy file to fixe
echo -e "[\e[92m#\e[0m] Copy file to train capture computer ..."
echo -e "[\e[92m#\e[0m] Password: \e[92mje\e[0m"
scp -r -o ConnectTimeout=3 Obstacle_detection_system/Data_acquisition_module je@10.201.20.131:/home/je/

# Start module on a new terminal
xterm -e sshpass -p "je" ssh -t je@10.201.20.131 'cd Edge_server_module/Data_acquisition_module; ./run.sh; bash -l'

# Run control interface
cd Obstacle_detection_system/Control_interface_module
./run.sh
