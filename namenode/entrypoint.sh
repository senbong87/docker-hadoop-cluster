#!/bin/bash

# check the hadoop settings
if [ -z ${HADOOP_CONF_DIR+x} ]; then
    echo "[$HOSTNAME] HADOOP_CONF_DIR has not been set."
    exit 1
else
    echo "[$HOSTNAME] HADOOP_CONF_DIR is set to $HADOOP_CONF_DIR."
    if [ -f $HADOOP_CONF_DIR/hdfs-site.xml ]; then
        namenode_dir=`hdfs getconf -confKey dfs.namenode.name.dir | sed 's/^file:\/\///g'`
        if [ -z $namenode_dir ]; then
            echo "[$HOSTNAME] Namenode directory value is empty."
            exit 1
        fi

        if [ ! -d $namenode_dir ]; then
            echo "[$HOSTNAME] Creating namenode directory $namenode_dir."
            if ! mkdir -p $namenode_dir; then
                echo "[$HOSTNAME] Failed to create directory."
                exit 1
            fi
        fi
        
        if [ ! -f $namenode_dir/current/VERSION ]; then
            echo "[$HOSTNAME] Formating namenode directory."
            hdfs namenode -format
        fi
    else
        echo "[$HOSTNAME] hdfs-site.xml not found in $HADOOP_CONF_DIR."
        exit 1
    fi
fi

exec "$@"
