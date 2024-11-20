ARG DEBIAN_FRONTEND=noninteractive
FROM ubuntu:20.04

# installations
RUN apt-get update && \
    apt-get install -y \
    vulkan-tools \
    mesa-utils \
    pciutils \
    x11-xserver-utils \
    libvulkan1 \
    mesa-vulkan-drivers \
    intel-gpu-tools && \
    rm -rf /var/lib/apt/lists/*

# env var for X11 display
ENV DISPLAY=:0

# mount X11 socket
RUN mkdir -p /tmp/.X11-unix

# run
CMD ["vkcube"]