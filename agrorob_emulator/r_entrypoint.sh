#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/$ROS_DISTRO/setup.bash" --
exec "$@"
source "/workspaces/ws/install/setup.bash" --
exec "$@"
source "/workspaces/ws/install/local_setup.bash" --
exec "$@"

ros2 bag play agrorob_server/bags/rosbag2_2023_11_30-09_27_02/rosbag2_2023_11_30-09_27_02_0.db3 --loop 
exec "$@"
