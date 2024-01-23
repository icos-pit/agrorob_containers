FROM osrf/ros:humble-desktop

SHELL ["/bin/bash", "-c"] 

ARG DEBIAN_FRONTEND=noninteractive

ARG USER_UID=1001
ARG USER_GID=1001
ARG USERNAME=user

WORKDIR /workspaces

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir -p -m 0700 /run/user/"${USER_UID}" \
    && mkdir -p -m 0700 /run/user/"${USER_UID}"/gdm \
    && chown user:user /run/user/"${USER_UID}" \
    && chown user:user /workspaces \
    && chown user:user /run/user/"${USER_UID}"/gdm \
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

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

ENV XDG_RUNTIME_DIR=/run/user/"${USER_UID}"

RUN mkdir -p ws/src
WORKDIR /workspaces/ws/src

RUN git clone https://github.com/icos-pit/agrorob_packages \
    && cd agrorob_packages \
    && git submodule init \
    && git submodule update

WORKDIR /workspaces/ws
RUN rosdep install --from-paths src -y --ignore-src
RUN source /opt/ros/humble/setup.bash && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release --symlink-install
RUN echo "source /workspaces/ws/install/setup.bash" >> ~/.bashrc
RUN . /workspaces/ws/install/local_setup.bash
# set the default user to the newly created user
USER $USERNAME

RUN echo 'source "/opt/ros/humble/setup.bash"' >>~/.bashrc
RUN . /workspaces/ws/install/local_setup.bash
RUN source /workspaces/ws/install/local_setup.bash

# Environment setup
# RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc
# RUN echo '#!/usr/bin/env bash' > /ros_entrypoint.sh
# RUN echo 'source /opt/ros/humble/setup.bash' >> /ros_entrypoint.sh
# RUN echo "source /workspaces/ws/install/setup.bash" >> /ros_entrypoint.sh
# RUN echo 'exec "$@"' >> /ros_entrypoint.sh
# RUN chmod +x /ros_entrypoint.sh

# ENTRYPOINT ["/ros_entrypoint.sh"]
# # Run bash
# CMD ["bash"]