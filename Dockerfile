ARG DEBIAN_FRONTEND=noninteractive
ARG BASE_DIST=ubuntu20.04
ARG CUDA_VERSION=11.4.3
FROM nvidia/cuda:${CUDA_VERSION}-base-${BASE_DIST}

# installations
RUN apt-get update && \
    apt-get install -y vulkan-tools mesa-utils pciutils && \
    rm -rf /var/lib/apt/lists/*

# env var for display
ENV DISPLAY=:0

# mount X11 socket and give access to GPU
RUN mkdir -p /tmp/.X11-unix

# runs test Vulkan application
CMD ["vkcube"]

# this doesn't work
# CMD ["sh", "-c", "nvidia-smi && lspci | grep ' VGA ' && vulkaninfo --summary && vkcube"]
