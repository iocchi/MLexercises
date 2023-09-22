#!/bin/bash

# -u $(id -u):$(id -g) \

docker run \
  --name mlnotebook --rm  \
  --net host \
  -p 8888:8888 \
  mlnotebook

