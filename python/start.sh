#!/usr/bin/env bash

cd /opt

if [ -f requirements.txt ]; then
 echo 'pip install --no-cache-dir -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com'
 pip install --no-cache-dir -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
fi

python *.py
