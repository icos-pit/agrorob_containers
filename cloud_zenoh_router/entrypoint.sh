#!/bin/ash
echo " * Starting: /zenohd --config /etc/zenoh/router.json5 $*"
exec /zenohd --config /etc/zenoh/router.json5 $*