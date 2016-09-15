# Minimal OpenDroneMap Docker image

This assumes that you have successfully built
[`opendronemap/opendronemap`](https://github.com/opendronemap/opendronemap)
into an image named `opendronemap/opendronemap`.

## Building

This will copy `/code` from the previously built image into `staging/code` and
then build a Docker image containing only the runtime dependencies necessary to
run OpenDroneMap.

```bash
make
```

By default, the resulting image will be named `mojodna/opendronemap-minimal`.
If you'd like to push it to your own Docker repository, rename it using `docker
tag mojodna/opendronemap-minimal <image[:tag]>` and then push: `docker push
<image[:tag]>`.
