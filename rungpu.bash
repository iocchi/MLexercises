#!/bin/bash

docker run \
  --name mlnotebook --rm  \
  --net host \
  --runtime nvidia \
  -p 8888:8888 \
  mlnotebook

