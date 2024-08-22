#!/bin/bash

echo "Sourcing ROS env: source /opt/ros/humble/setup.bash"

# Source the ROS environment
source /opt/ros/humble/setup.bash

echo "Starting ROS2 talker demo: ros2 run demo_nodes_cpp talker &"
# Start ROS 2 talker node
ros2 run demo_nodes_cpp talker &

echo "Starting ROS2 bridge: ros2 launch rosbridge_server rosbridge_websocket_launch.xml port:=8080 &"
# Start the rosbridge server
ros2 launch rosbridge_server rosbridge_websocket_launch.xml port:=8080 &

echo "Starting Zenoh Router with ros2 bridge: zenohd -c /zenoh/CUSTOM_CONFIG.json5 "$@""
# Start the Zenoh daemon with the provided configuration file
exec zenohd -c /zenoh/CUSTOM_CONFIG.json5 "$@"
