# Stage 1: Build Stage
FROM rust:1.66-slim-buster AS builder

# [1.1]: Install dependencies and upgrade CMake
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    llvm-dev \
    libclang-dev \
    libssl-dev \
    pkg-config \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Upgrade CMake to version 3.16 or higher
RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.0/cmake-3.21.0-linux-x86_64.sh \
    && chmod +x cmake-3.21.0-linux-x86_64.sh \
    && ./cmake-3.21.0-linux-x86_64.sh --skip-license --prefix=/usr/local \
    && rm cmake-3.21.0-linux-x86_64.sh

# [1.2]: Prepare Zenoh
# Copy local Zenoh dir with modified code
COPY ./zenoh /zenoh

# Set /zenoh as working dir
WORKDIR /zenoh

# Build Zenoh in release mode
RUN cargo build --release \
    && cp target/release/zenohd /usr/local/bin/zenohd

# [1.3]: Prepare Zenoh plugin for ros2dds bridge
# Copy local Zenoh-plugin-ros2dds
COPY ./zenoh-plugin-ros2dds /zenoh-plugin-ros2dds

# Set /zenoh-plugin-ros2dds as working dir
WORKDIR /zenoh-plugin-ros2dds

# Build Zenoh plugin in release mode
RUN cargo build --release

# Stage 2: Final Image with ROS 2 and Zenoh
FROM osrf/ros:humble-desktop

WORKDIR /workspaces

# [2.1]: Install dependencies
# RUN apt-get update && \ 
#     apt-get install -y \
#     libclang-dev \
#     llvm-dev \
#     cmake \
#     build-essential \
#     curl \
#     libgcc-10-dev \
#     libstdc++-10-dev \
#     ros-humble-rosbridge-server \
#     && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \
    ros-humble-rtcm-msgs \
    ros-humble-nmea-msgs \
    net-tools\
    ros-humble-control-toolbox \
    ros-humble-ackermann-msgs \
    ros-humble-ament-cmake \
    ros-humble-ament-cmake-clang-format \
    ros-humble-tf2-eigen \
    ros-humble-gps-umd \
    ros-humble-teleop-twist-joy\
    ros-humble-can-msgs\
    ros-humble-sensor-msgs\
    libignition-gazebo6-dev \
    ros-humble-joint-trajectory-controller \
    libpoco-dev \
    libeigen3-dev \
    libasio-dev \
    ros-humble-mavros-msgs \
    ros-humble-diagnostic-updater \
    ament-cmake-clang-tidy \
    libclang-dev \
    llvm-dev \
    cmake \
    build-essential \
    curl \
    libgcc-10-dev \
    libstdc++-10-dev \
    ros-humble-rosbridge-server \
    && rm -rf /var/lib/apt/lists/*

# ROS2 =============================================================================================================== #
RUN mkdir -p ws/src
WORKDIR /workspaces/ws/src

COPY ./agrorob_msgs-main /workspaces/ws/src/agrorob_packages/agrorob_msgs-main
COPY ./farmbot_interfaces-main /workspaces/ws/src/agrorob_packages/farmbot_interfaces-main
COPY ./ublox_ubx_msgs /workspaces/ws/src/agrorob_packages/ublox_ubx_msgs 

WORKDIR /workspaces/ws
RUN rosdep install --from-paths src -y --ignore-src
RUN . /opt/ros/humble/setup.sh && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release --symlink-install

RUN echo "source /workspaces/ws/install/setup.bash" >> ~/.bashrc

RUN echo 'source "/workspaces/ws/install/setup.bash" --' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh
RUN echo 'source "/workspaces/ws/install/local_setup.bash" --' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh

# Zenoh ============================================================================================================== #
# [2.2]: Copy the built binary from the builder stage
COPY --from=builder /usr/local/bin/zenohd /usr/local/bin/zenohd

# [2.3]: Create dirs for Zenoh plugins
RUN mkdir -p /zenoh/target/release
RUN mkdir -p /zenoh-plugin-ros2dds/target/release

# [2.4]: Copy the built debug artifacts from the builder stage (plugins)
# Storage plugin
COPY --from=builder /zenoh/target/release/libzenoh_plugin_storage_manager.so /zenoh/target/release/libzenoh_plugin_storage_manager.so
# REST plugin
COPY --from=builder /zenoh/target/release/libzenoh_plugin_rest.so /zenoh/target/release/libzenoh_plugin_rest.so
# ROS 2 DDS plugin
COPY --from=builder /zenoh-plugin-ros2dds/target/release/libzenoh_plugin_ros2dds.so /zenoh-plugin-ros2dds/target/release/libzenoh_plugin_ros2dds.so

# CONFIG
COPY ./config.json5 /zenoh/CUSTOM_CONFIG.json5

# ENTRYPOINT
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "bash", "/entrypoint.sh" ]