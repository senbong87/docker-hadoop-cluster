#!/bin/bash

if [ -z ${HADOOP_CONF_DIR+x} ]; then
    echo "[$HOSTNAME] HADOOP_CONF_DIR has not been set."
    exit 1
else
    hdfs_path=`hdfs getconf -confKey fs.defaultFS`
    if ! hadoop fs -ls ${hdfs_path%/}/spark; then
        hadoop fs -mkdir -p ${hdfs_path%/}/spark
    fi
fi

exec "$@"
