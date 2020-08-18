备份依赖Python的环境  
脚本接收参数如下，可以使用`python backupall.py --help`查看帮助说明
- ip：本地ip地址，备份出来的文件名会包含ip地址，非必填，可以通过代码获取到  
- dest：备份导出的文件的存储路径，非必填，默认在脚本的当前路径下  
- backup-all: 是否要备份所有的文件，包含大文件，默认为false，如果为true，bigfile参数会无效  
- bigfile：对大文件的定义，超过该定义的文件和文件夹不回备份
```
python backupall.py --ip=192.168.1.1 --dest=/Volumes/cache/temp/dockerbak
```
