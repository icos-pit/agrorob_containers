#!/bin/bash

# Source the ROS environment
echo "Sourcing ROS env: source /opt/ros/humble/setup.bash"
source /opt/ros/humble/setup.bash

set -e

# setup ros2 environment
source "/opt/ros/humble/setup.bash" --
exec "$@"
source "/workspaces/ws/install/setup.bash" --
exec "$@"
source "/workspaces/ws/install/local_setup.bash" --
exec "$@"


# echo "Starting ROS2 talker demo: ros2 run demo_nodes_cpp talker &"
# Start ROS 2 talker node
# ros2 run demo_nodes_cpp talker &

# Start the rosbridge server
echo "Starting ROS2 bridge: ros2 launch rosbridge_server rosbridge_websocket_launch.xml port:=8080 &"
ros2 launch rosbridge_server rosbridge_websocket_launch.xml port:=8080 &

# Start the Zenoh daemon with the provided configuration file
echo "Starting Zenoh Router with ros2 bridge: zenohd -c /zenoh/CUSTOM_CONFIG.json5 "$@""
exec zenohd -c /zenoh/CUSTOM_CONFIG.json5 "$@"
