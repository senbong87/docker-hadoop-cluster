#!/bin/bash

# check the hadoop settings
if [ -z ${HADOOP_CONF_DIR+x} ]; then
    echo "[$HOSTNAME] HADOOP_CONF_DIR has not been set."
    exit 1
else
    echo "[$HOSTNAME] HADOOP_CONF_DIR is set to $HADOOP_CONF_DIR."
    if [ ! -f $HADOOP_CONF_DIR/yarn-site.xml ]; then
        echo "[$HOSTNAME] hdfs-site.xml not found in $HADOOP_CONF_DIR."
        exit 1
    fi
fi

exec "$@"
