FROM hadoop:base

MAINTAINER senbong <senbong87@gmail.com>

ENV SPARK_VER=2.0.0

# install spark
RUN wget https://archive.apache.org/dist/spark/spark-2.0.0/spark-${SPARK_VER}-bin-hadoop${HADOOP_VER}.tgz && \
    tar -xf spark-${SPARK_VER}-bin-hadoop${HADOOP_VER}.tgz && \
    mv spark-${SPARK_VER}-bin-hadoop${HADOOP_VER} /opt && \
    rm spark-${SPARK_VER}-bin-hadoop${HADOOP_VER}.tgz && \
    ln -s /opt/spark-${SPARK_VER}-bin-hadoop${HADOOP_VER} /usr/local/spark

ENV SPARK_HOME=/usr/local/spark \
    PATH=$PATH:/usr/local/spark/bin:/usr/local/spark/sbin

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
