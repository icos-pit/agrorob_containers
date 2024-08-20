#!/bin/ash
echo "Starting Zenho Router: zenohd --config /zenoh/config.json5 $*"
exec zenohd --config /zenoh/config.json5 $*