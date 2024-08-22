# ROS2 Env with Zenoh Router and ROS2 websocket bridge

## Ports

- 7447-`8447` - Zenoh Router
- `8000` - Zenoh REST
- `8080` - ROS2 bridge websocket

## Build

```bash
# entrypoint executable
chmod +x entrypoint.sh
```

```bash
# create from docker compose
docker compose up --build
```

## Demo

By default `ros2 run demo_nodes_cpp talker &` command is executed - ros2 demo talker.
