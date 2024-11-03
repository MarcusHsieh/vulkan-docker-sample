# Vulkan Docker Sample with Xserver Setup

This guide explains how to run Vulkan applications in a Docker container with display forwarding. It includes instructions for both Windows (with VcXsrv) and Linux systems.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Instructions](#instructions)
  - [For Windows](#for-windows)
  - [For Linux](#for-linux)
- [Troubleshooting](#troubleshooting)

## Prerequisites
- Docker with GPU support enabled.
- For Windows: [VcXsrv](https://sourceforge.net/projects/vcxsrv/).
- For Linux: No additional X11 server is needed as X11 forwarding is native to Linux.

---

## Instructions

### For Windows

#### 1. Launch Xserver (VcXsrv, xlaunch.exe)

- **Configuration Options:**
  - Select **One large window**.
  - Set **Display** to `0`.
  - Choose **Start no client**.
  - **Uncheck** `Native OpenGL` (since Vulkan is used, not OpenGL).
  - **Check** `Disable access control`.

#### 2. Build and Run Vulkan Docker Sample

##### Build the Docker Image
Run the following command to build the Docker image:

```bash
docker build -t vulkan-docker-test .
```
##### Run the Docker Container
Use the following command to run the container, allowing it to display via VcXsrv:
```bash
xhost +local:docker && docker run --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix --gpus all vulkan-docker-test
```

> Note: Ensure VcXsrv is running before executing the Docker container command.

---

### For Linux

#### 1. Set Up X11 Display Permissions
Grant Docker access to your X11 display by running:
```bash
xhost +local:docker
```
#### 2. Build and Run Vulkan Docker Sample
##### Build the Docker Image
Use the following command to build the Docker image:
```bash
docker build -t vulkan-docker-test .
```
##### Run the Docker Container
Use the following command to run the container, allowing it to display via VcXsrv:
```bash
docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --gpus all vulkan-docker-test
```

---

## Troubleshooting
- On Linux, if there are display issues, ensure that xhost +local:docker has been executed to allow display access.
- On Windows, verify VcXsrv is running and that the settings are correct.
- Ensure Docker has GPU support enabled.

