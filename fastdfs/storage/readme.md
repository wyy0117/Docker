#### storage.conf
固定修改 
1. 数据和日志文件存储根目录    
    ```
    base_path=/home/dfs
    ```
1. 第一个存储目录
    ```
    store_path0=/home/dfs
    ```    

自定义修改
1. storage服务端口（默认23000,一般不修改）
    ```
    port=23000
    ```
1. tracker服务器IP和端口
    ```
    tracker_server=192.168.52.1:22122 
    ```
1. 集群的分组
    ```
    group_name = group1
    ``` 
配合nginx使用     
1. http.conf
1. mime.types  
1. store.conf修改http访问文件的端口(默认8888,看情况修改,和nginx中保持一致)
    ```
    http.server_port=8888
    ```  
1. nginx.conf修改监听端口  
#### mod_fastdfs.conf
固定修改  
1. mod_fastdfs.conf数据存储路径
    ```
    store_path0=/home/dfs
    ```   
1. 基础路径
    ```
    base_path=/home/dfs
    ```
自定义修改      
1. tracker_server的地址  
    ```
    tracker_server=192.168.31.50:22122
    ```
1. url中是否包含group
    ```
    url_have_group_name=true
    ```
1. group_name与storage的group_name保持一致
    ```
    group_name=group1
    ```                
