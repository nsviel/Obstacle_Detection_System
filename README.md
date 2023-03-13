# Obstacle Detection System
We present a full implementation of an Edge computing system using LiDAR capture for automotive use case. Basically, a simple Python program (Data acquisition module) receive data from a LiDAR installed inside the train cokpit or car cabin and resend it, via wireless network, to an Edge server where the data will be processed. Here, these processes comprise convertion from raw data to exploitable PLY binary point clouds, a SLAM ego-localization and AI obstacle detection algorithm. If a potential obstacle is detected along the train rails (e.g, abandonned car, cattle), a warning is sent to the local train operator.

![system](https://user-images.githubusercontent.com/80487132/224792706-490c0671-9a5d-467d-a583-57ae77e06f9e.png)

## Modules

The proposed system is composed of 3 modules:
- **Data acquisition module (1)** ( [link](https://github.com/nsviel/-Obstacle-Data_acquisition_module) ) This module is in charge of receiving the LiDAR output data, transmiting it to an Edge server and assuring inter-communication between up-level modules and the LiDAR in order to remotly command the LiDAR parameters (e.g, motor activation, speed). 

- **Edge server module (2)**
  - **Edge orchestrator component** ( [link](https://github.com/nsviel/-Obstacle-Edge_orchestrator_component) ) Installed on the Edge server, it receives the data sent by the Data acquisition module. It is also reponsible of info and data transmission amongst the other components and the Control interface module.
  - **Data processing component** ( [link](https://github.com/nsviel/-Obstacle-Data_processing_component) ) It computes the raw LiDAR data into ego-localized full-frame point clouds in PLY binary format.
  - **Artificial Intelligence component** Ensure the obstacle detection with geo-localized full-frame point clouds as input.

- **Control interface module (3)** ( [link](https://github.com/nsviel/-Obstacle-Control_interface_module) ) A GUI which allows to control the entire system parameters and LiDAR state. A visual data and module representation which colored connection links permits to get a constant overall indicator of the system correct functioning.



