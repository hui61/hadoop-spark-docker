#!/bin/bash
$HADOOP_HOME/sbin/start-all.sh
# echo -e "\n"

# $HADOOP_HOME/sbin/start-dfs.sh

# echo -e "\n"

# $HADOOP_HOME/sbin/start-yarn.sh

# echo -e "\n"


hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -mkdir -p /user/hive/tmp
hdfs dfs -mkdir -p /user/hive/log
hdfs dfs -chmod -R 777 /user/hive/warehouse
hdfs dfs -chmod -R 777 /user/hive/tmp
hdfs dfs -chmod -R 777 /user/hive/log

