```bash
docker build -t vulkan-docker-test .
```

```bash
xhost +local:docker && docker run --rm -it -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix vulkan-docker-test
```