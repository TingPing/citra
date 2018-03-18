#!/bin/bash -ex

docker pull fedora:latest
docker run --privileged -e ENABLE_COMPATIBILITY_REPORTING -v $(pwd):/citra fedora:latest /bin/bash -ex /citra/.travis/linux-flatpak/docker.sh
