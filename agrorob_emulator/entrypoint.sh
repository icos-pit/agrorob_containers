#!/bin/ash
echo " * Starting: /zenoh-bridge-ros2dds -c /config.json5 -m $ZENOH_BRIDGE_MODE -e $ZENOH_ROUTER_TCP_ADDR $*"
exec /zenoh-bridge-ros2dds -c /config.json5 -m $ZENOH_BRIDGE_MODE  -e $ZENOH_ROUTER_TCP_ADDR$* 

