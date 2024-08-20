# Stage 1: Build Stage
FROM rust:alpine AS builder

# [1.1]: install dependencies
RUN apk add --no-cache \
    build-base \
    cmake \
    musl-dev \
    llvm15-dev \
    clang15-dev

# [1.2]: zenoh router build
COPY ./zenoh /zenoh

# set workdir to /zenoh
WORKDIR /zenoh

# build Zenoh in release mode
RUN cargo build --release \
    && cp target/release/zenohd /usr/local/bin/zenohd

# [1.3]: zenoh ros2dds plugin build
# COPY /zenoh-plugin-ros2dds /zenoh-plugin-ros2dds

# set workdir to /zenoh-plugin-ros2dds
# WORKDIR /zenoh-plugin-ros2dds

# build Zenoh plugin in release
# RUN cargo build --release 

# Stage 2: Run Stage
FROM alpine:latest

# [2.1]: install dependencies
RUN apk add --no-cache \
    libgcc \
    libstdc++ \
    curl 

# [2.2]: copy the built binary from the builder stage
COPY --from=builder /zenoh/target/release/zenohd /usr/local/bin/zenohd

RUN mkdir -p /zenoh/target/release
# RUN mkdir -p /zenoh-plugin-ros2dds/target/release

# [2.3]: copy the built debug artifacts from the builder stage (plugins)
COPY --from=builder /zenoh/target/release/libzenoh_plugin_storage_manager.so /zenoh/target/release/libzenoh_plugin_storage_manager.so
COPY --from=builder /zenoh/target/release/libzenoh_plugin_rest.so /zenoh/target/release/libzenoh_plugin_rest.so
# COPY --from=builder /zenoh-plugin-ros2dds/target/release/libzenoh_plugin_ros2dds.so /zenoh-plugin-ros2dds/target/release/libzenoh_plugin_ros2dds.so
