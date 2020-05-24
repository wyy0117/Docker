FROM centos:7
RUN yum install -y git gcc make wget pcre-devel zlib-devel

#创建数据存储目录
RUN mkdir /home/{dfs,scripts}

RUN cd /usr/local/src && git clone https://gitee.com/fastdfs100/libfastcommon.git --depth 1 \
&& cd libfastcommon/ \
&& ./make.sh && ./make.sh install

RUN cd /usr/local/src && git clone https://gitee.com/fastdfs100/fastdfs.git --depth 1 \
&& cd fastdfs/ \
&& ./make.sh && ./make.sh install

RUN cd /usr/local/src && git clone https://gitee.com/fastdfs100/fastdfs-nginx-module.git --depth 1

#RUN wget http://nginx.org/download/nginx-1.15.4.tar.gz \
COPY nginx-1.15.4.tar.gz .
RUN tar -zxvf nginx-1.15.4.tar.gz \
&& cd nginx-1.15.4/ \
&& ./configure --add-module=/usr/local/src/fastdfs-nginx-module/src \
&& make && make install

COPY entrypoint.sh /home/scripts/.

VOLUME ["/home/dfs"]

ENTRYPOINT ["/home/scripts/entrypoint.sh"]
