### 注意
此教程为seata1.2.0版本,使用nacos作为配置中，server端存储模式为db，使用mysql。详细配置请参考[官网](http://seata.io/zh-cn/docs/ops/deploy-guide-beginner.html)  
1. 创建seata专用数据库,注意修改**账号密码**
   ```
   CREATE DATABASE IF NOT EXISTS seata DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
   
   grant all privileges on seata.* to 用户名@'%' identified by '密码';
   ```
1. 使用sql文件建表
   ```
   source client-mysql.sql;
   source server-mysql.sql
   ```
1. 修改config.txt中的数据库配置
   ```
   store.db.url=jdbc:mysql://192.168.3.26:3306/seata?useUnicode=true
   store.db.user=seata
   store.db.password=seata
   ```   
1. 修改registry.conf中registry的nacos的配置
   ```
   application = "seata-server"
   serverAddr = "192.168.3.26:8848"
   namespace = ""
   cluster = "default"
   username = "nacos"
   password = "nacos"
   ```
1. 修改registry.conf中config的nacos的配置
   ```
   serverAddr = "192.168.3.26:8848"
   namespace = ""
   group = "SEATA_GROUP"
   username = "nacos"
   password = "nacos"
   ```   
1. 修改seata.sh中的配置信息，执行    

