#!/usr/bin/env bash
mkdir -p ~/docker/data/fastdfs/tracker1/data \
&& docker run -itd --name fastdfs-tracker1 -p 22122:22122 -v ~/docker/data/fastdfs/tracker1/data:/fastdfs/tracker/data season/fastdfs tracker \
&& mkdir -p ~/docker/data/fastdfs/tracker2/data \
&& docker run -itd --name fastdfs-tracker2 -p 22123:22122 -v ~/docker/data/fastdfs/tracker2/data:/fastdfs/tracker/data season/fastdfs tracker


