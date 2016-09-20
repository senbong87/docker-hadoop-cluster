#!/bin/bash

# check the hadoop settings
if [ -z ${HADOOP_CONF_DIR+x} ]; then
    echo "[$HOSTNAME] HADOOP_CONF_DIR has not been set."
    exit 1
else
    echo "[$HOSTNAME] HADOOP_CONF_DIR is set to $HADOOP_CONF_DIR."
    if [ -f $HADOOP_CONF_DIR/hdfs-site.xml ]; then
        datanode_dir=`hdfs getconf -confKey dfs.datanode.data.dir | sed 's/^file:\/\///g'`
        if [ -z $datanode_dir ]; then
            echo "[$HOSTNAME] Datanode directory value is empty."
            exit 1
        fi

        if [ ! -d $datanode_dir ]; then
            echo "[$HOSTNAME] Creating datanode directory $datanode_dir."
            if ! mkdir -p $datanode_dir; then
                echo "[$HOSTNAME] Failed to create directory."
                exit 1
            fi
        fi
    else
        echo "[$HOSTNAME] hdfs-site.xml not found in $HADOOP_CONF_DIR."
        exit 1
    fi
fi

exec "$@"
