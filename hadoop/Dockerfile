FROM debian:jessie

MAINTAINER senbong <senbong87@gmail.com>

WORKDIR /root

ENV HADOOP_VER=2.7 \
    HADOOP_MINOR_VER=3

# install openjdk wget
RUN apt-get update && apt-get install -y openssh-server openjdk-7-jdk wget

# install hadoop
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-${HADOOP_VER}.${HADOOP_MINOR_VER}.tar.gz && \
    tar -xf hadoop-${HADOOP_VER}.${HADOOP_MINOR_VER}.tar.gz && \
    mv hadoop-${HADOOP_VER}.${HADOOP_MINOR_VER} /opt && \
    rm hadoop-${HADOOP_VER}.${HADOOP_MINOR_VER}.tar.gz && \
    ln -s /opt/hadoop-${HADOOP_VER}.${HADOOP_MINOR_VER} /usr/local/hadoop

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \
    HADOOP_HOME=/usr/local/hadoop \
    HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop \
    PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin
