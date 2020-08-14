备份使用Python3的环境，Python2请自行测试  
脚本接收2个参数：  
ip：本地ip地址，备份出来的文件名会包含ip地址，非必填，可以通过代码获取到  
dest：备份导出的文件的存储路径，非必填，默认在脚本的当前路径下
```
python3 backupall.py --ip=192.168.1.1 --dest=/Volumes/cache/temp/dockerbak
```
