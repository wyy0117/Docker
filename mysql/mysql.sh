mkdir -p ~/docker/data/mysql5.7/{conf,dbdata} \
&& echo '[mysql]
default-character-set=utf8

[mysqld]
character-set-server=utf8
lower_case_table_names=1

skip-host-cache
skip-name-resolve
default-time-zone = '+08:00'
max_allowed_packet=1024M
max_connections=1000'>~/docker/data/mysql5.7/conf/config-file.cnf \
&& docker run --name mysql -p 3306:3306 -v ~/docker/data/mysql5.7/conf:/etc/mysql/conf.d -v ~/docker/data/mysql5.7/dbdata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
