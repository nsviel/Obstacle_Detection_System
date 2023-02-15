# Obstacle System



## Description

<details><summary>General</summary>

The present system proposes an implementation of an Edge computing with LiDAR data use case. The idea here if to capture a moving train environment with a LiDAR sensor, send the data to an Edge server able to compute some AI algorithmes to detect potential obstacles along the train rails (e.g, abandonned car, cattle) and, if any obstacle is deteced, send a warning to the localtrain operator.

The proposed system is composed of 3 blocks or modules:
- Data acquisition module [link](https://github.com/nsviel/Obstacle-Data_Acquisition_Module), which receive the LiDAR output data and resent them to an Edge server
- Edge orchestrator module: [link](https://github.com/nsviel/Obstacle-Edge_Orchestration_Module), installed on the Edge server, it receives the data sent by the Data acquisition module. It is also the reponsible software part of data transmission amongst several sub-modules or components:
  - Data processing component: [link](https://github.com/nsviel/Velodium), which computes the raw LiDAR data into egolocalized full frame point clouds
  - Artificial Intelligence algorithms
- Control Interface module: [link](https://github.com/nsviel/Obstacle-Control_Interface_Module), which allows to control the entire system parameters and the overall correct functioning

</details>


