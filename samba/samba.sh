#!/usr/bin/env bash

base_path=~/samba
container_name=samba
user=user
password=password

docker run -itd --name $container_name \
 -p 139:139 \
 -p 445:445 \
 -v $base_path:/mount\
  dperson/samba \
  -u "$user;$password" \
  -s "shared;/mount/;yes;no;no;all;none"
