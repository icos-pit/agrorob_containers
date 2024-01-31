FROM osrf/ros:humble-desktop

WORKDIR /workspaces
# install ros package

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ros-humble-rtcm-msgs \
    ros-humble-nmea-msgs \
    # ros-humble-xacro \
    # ros-humble-controller-interface \
    # ros-humble-realtime-tools \
    # ros-humble-ros2-control-test-assets \
    # ros-humble-controller-manager \
    # ros-humble-joint-state-publisher-gui \
    # ros-humble-control-msgs \
    # ros-humble-gazebo-ros \
    net-tools\
    ros-humble-control-toolbox \
    ros-humble-ackermann-msgs \
    ros-humble-ament-cmake \
    ros-humble-ament-cmake-clang-format \
    ros-humble-tf2-eigen \
    ros-humble-gps-umd \
    # ros-humble-joint-state-broadcaster \
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
# RUN echo "source /workspaces/ws/install/setup.bash" >> ~/.bashrc
RUN . /workspaces/ws/install/local_setup.bash

RUN git clone https://github.com/icos-pit/agrorob_server 

RUN echo "source /workspaces/ws/install/setup.bash" >> ~/.bashrc
RUN echo "source /workspaces/ws/install/local_setupsetup.bash" >> ~/.bashrc

RUN . /workspaces/ws/install/local_setup.sh 
RUN . /workspaces/ws/install/setup.sh
RUN . /opt/ros/$ROS_DISTRO/setup.sh
# # # play ros bag
CMD ["ros2", "bag", "play", "agrorob_server/bags/rosbag2_2023_11_30-09_27_02/rosbag2_2023_11_30-09_27_02_0.db3","--loop"]

