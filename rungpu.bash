#!/bin/bash

nvidia-docker run \
  --name mlnotebook --rm  \
  --net host \
  -p 8888:8888 \
  mlnotebook

