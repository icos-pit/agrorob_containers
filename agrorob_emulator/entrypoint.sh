#!/bin/ash
# echo " * Starting: /zenoh-bridge-dds --connect -e tcp/57.129.16.234:8447 $*"
# exec /zenoh-bridge-dds --connect -e tcp/57.129.16.234:8447$*
echo " * Starting: /zenoh-bridge-dds -m $ZENOH_BRIDGE_MODE -e $ZENOH_ROUTER_TCP_ADDR $*"
exec /zenoh-bridge-dds -m $ZENOH_BRIDGE_MODE  -e $ZENOH_ROUTER_TCP_ADDR$* 