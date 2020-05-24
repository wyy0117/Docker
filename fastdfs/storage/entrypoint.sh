#!/usr/bin/env bash

/etc/init.d/fdfs_storaged start

/usr/local/nginx/sbin/nginx

sleep 10

tail -f /home/dfs/logs/storaged.log
