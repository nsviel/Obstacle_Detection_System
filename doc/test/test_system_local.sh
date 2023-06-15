#!/bin/bash

# Author: Nathan Sanchiz-Viel
# Example of a script to install and run the whole system.


echo -e "--- \e[94mObstacle Detection System test\e[0m ---"

# 1/ Download codes from github
###############################
echo -e "[\e[92m#\e[0m] Clone github repository ..."
if cd Obstacle_detection_system; 
then cd .. && echo -e "[\e[92m#\e[0m] Github repository already cloned"; 
else git clone --recurse-submodules https://github.com/nsviel/Obstacle_detection_system; 
fi

# 2/ Run one terminal per system component and run installation and run scripts
###############################
# Start Edge orchestrator component on a new terminal
gnome-terminal --title="Edge Orchestrator component" -- bash -c \
"cd Obstacle_detection_system/Edge_server_module/Edge_orchestrator_component; ./install.sh; ./run.sh; exec bash"

# Start Processing component on a new terminal
gnome-terminal --title="Data processing component" -- bash -c \
"cd Obstacle_detection_system/Edge_server_module/Data_processing_component; ./install.sh; ./run.sh; exec bash"

# Start Capture module on a new terminal
gnome-terminal --title="Capture module" -- bash -c \
"cd Obstacle_detection_system/Data_acquisition_module; ./install.sh; ./run.sh; exec bash"

# Start Control interface module on a new terminal
gnome-terminal --title="Control interface module" -- bash -c \
"cd Obstacle_detection_system/Control_interface_module; ./install.sh; ./run.sh; exec bash"

# 3/ End
###############################
echo -e "[\e[92m#\e[0m] Done"
