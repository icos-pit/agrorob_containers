FROM osrf/ros:humble-desktop

WORKDIR /workspaces

# install ros package
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
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ws/src
WORKDIR /workspaces/ws/src

# copy packages
COPY ./src/agrorob_msgs-main /workspaces/ws/src/agrorob_packages/agrorob_msgs-main
COPY ./src/farmbot_interfaces-main /workspaces/ws/src/agrorob_packages/farmbot_interfaces-main
COPY ./src/ublox_ubx_msgs /workspaces/ws/src/agrorob_packages/ublox_ubx_msgs 

WORKDIR /workspaces/ws

# install packages
RUN rosdep install --from-paths src -y --ignore-src
RUN . /opt/ros/humble/setup.sh && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release --symlink-install

# copy agrorob server
COPY ./src/agrorob_server /workspaces/ws/agrorob_server

RUN echo "source /workspaces/ws/install/setup.bash" >> ~/.bashrc
RUN echo 'source "/workspaces/ws/install/setup.bash" --' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh
RUN echo 'source "/workspaces/ws/install/local_setup.bash" --' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh

# entrypoint file
COPY ./r_entrypoint.sh /r_entrypoint.sh
ENTRYPOINT [ "bash", "/r_entrypoint.sh" ]

