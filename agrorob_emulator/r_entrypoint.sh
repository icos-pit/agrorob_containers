#!/bin/bash

echo "source /workspaces/ws/install/setup.bash$*"
echo "source /workspaces/ws/install/local_setup.bash$*"
echo "source /opt/ros/humble/setup.bash$*"
exec ros2 bag play agrorob_server/bags/rosbag2_2023_11_30-09_27_02/rosbag2_2023_11_30-09_27_02_0.db3 --loop $*
# exec ros2 pkg list$*
# source /workspaces/ws/install/setup.bash$*
# source /workspaces/ws/install/local_setup.bash$*
# source /opt/ros/humble/setup.bash$*
# ros2 bag play agrorob_server/bags/rosbag2_2023_11_30-09_27_02/rosbag2_2023_11_30-09_27_02_0.db3 --loop 
