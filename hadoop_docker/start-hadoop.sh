#!/bin/bash
/etc/init.d/ssh start
echo "Run namenode"
$HADOOP_HOME/bin/hdfs namenode -format
echo "Run startnode"
$HADOOP_HOME/sbin/start-dfs.sh
echo "Run StartManager"
$HADOOP_HOME/sbin/start-yarn.sh
echo "Run ResourceManager"
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver

#Permissions for marlabs user
hdfs dfs -mkdir /user/marlabs && hdfs dfs -chown marlabs:supergroup /user/marlabs
hdfs dfs -chown marlabs:supergroup /tmp

 
tail -f /dev/null 
