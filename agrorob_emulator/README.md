# ICOS UC - Agriculture Operational Robotic Platform Emulator (agrorob_emu)

Docker image for agrorob emulator with bag version: `rosbag2_2023_11_30-09_27_02`

## Configuration

Agrorob emulator can be run from Dockerfile source code:

```yaml
robot:
  build: .
```

or as image pull from registry:

```yaml
robot:
  image: registry.paas.psnc.pl/icos/agrorob_emu:latest
```

## Entrypoint file: `r_entrypoint.sh`

To override entrypoint copy custom `r_entrypoint.sh` file to `/r_entrypoint.sh`.

Base setup structure:

```bash
#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/$ROS_DISTRO/setup.bash" --
exec "$@"
source "/workspaces/ws/install/setup.bash" --
exec "$@"
source "/workspaces/ws/install/local_setup.bash" --
exec "$@"

# other commands...

```

## Agrorob emulator communication using Zenoh

`entrypoint.sh` - Zenoh Bridge for ROS2DDS entrypoint
`config.json5` - Zenoh Bridge configuration file
`enviroment.env` - variables

### Enviroment variables

```env
ZENOH_ROUTER_TCP_ADDR="tcp/<zenoh_router_ip>:<zenoh_router_port>"
ZENOH_BRIDGE_MODE=client
ROS_DISTRO=humble
```

## Docker Compose

```bash
docker compose up --build
```
