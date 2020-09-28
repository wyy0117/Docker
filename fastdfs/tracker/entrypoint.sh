#!/usr/bin/env bash

/etc/init.d/fdfs_trackerd start

sleep 10

tail -f /home/dfs/logs/trackerd.log
