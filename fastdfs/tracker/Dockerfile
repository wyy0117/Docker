FROM centos:7
RUN yum install -y git gcc make

#创建数据存储目录
RUN mkdir /home/{dfs,scripts}

RUN cd /usr/local/src && git clone https://gitee.com/fastdfs100/libfastcommon.git --depth 1 \
&& cd libfastcommon/ \
&& ./make.sh && ./make.sh install

RUN cd /usr/local/src && git clone https://gitee.com/fastdfs100/fastdfs.git --depth 1 \
&& cd fastdfs/ \
&& ./make.sh && ./make.sh install

COPY entrypoint.sh /home/scripts/.

VOLUME ["/home/dfs"]

ENTRYPOINT ["/home/scripts/entrypoint.sh"]
