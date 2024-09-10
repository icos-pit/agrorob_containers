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

RUN git clone https://github.com/icos-pit/agrorob_packages \
    && cd agrorob_packages \
    && git submodule init \
    && git submodule update

WORKDIR /workspaces/ws
RUN rosdep install --from-paths src -y --ignore-src
RUN . /opt/ros/humble/setup.sh && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release --symlink-install

RUN git clone https://github.com/icos-pit/agrorob_server 

RUN echo "source /workspaces/ws/install/setup.bash" >> ~/.bashrc

RUN echo 'source "/workspaces/ws/install/setup.bash" --' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh
RUN echo 'source "/workspaces/ws/install/local_setup.bash" --' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh
