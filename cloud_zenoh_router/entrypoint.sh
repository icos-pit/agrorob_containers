#!/bin/ash
echo " * Starting: /zenohd --config /etc/zenoh/router-config.json5 $*"
exec /zenohd --config /etc/zenoh/router-config.json5 $*