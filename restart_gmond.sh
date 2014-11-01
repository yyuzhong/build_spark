#!/bin/bash

scp /opt/cscloud/spark-1.1.0/conf/metrics.properties slave1:/opt/cscloud/spark-1.1.0/conf/
scp /opt/cscloud/spark-1.1.0/conf/metrics.properties slave2:/opt/cscloud/spark-1.1.0/conf/
scp /opt/cscloud/spark-1.1.0/conf/metrics.properties slave3:/opt/cscloud/spark-1.1.0/conf/
scp /opt/cscloud/spark-1.1.0/conf/metrics.properties slave4:/opt/cscloud/spark-1.1.0/conf/
scp /opt/cscloud/spark-1.1.0/conf/metrics.properties slave5:/opt/cscloud/spark-1.1.0/conf/
scp /opt/cscloud/spark-1.1.0/conf/metrics.properties slave6:/opt/cscloud/spark-1.1.0/conf/
scp /opt/cscloud/spark-1.1.0/conf/metrics.properties slave7:/opt/cscloud/spark-1.1.0/conf/

/opt/cscloud/hadoop-2.5.1/sbin/stop-all.sh
/opt/cscloud/spark-1.1.0/sbin/stop-all.sh

/opt/cscloud/hadoop-2.5.1/sbin/start-all.sh
/opt/cscloud/spark-1.1.0/sbin/start-all.sh

service gmond restart

ssh slave1 service gmond restart
ssh slave2 service gmond restart
ssh slave3 service gmond restart 
ssh slave4 service gmond restart 
ssh slave5 service gmond restart
ssh slave6 service gmond restart
ssh slave7 service gmond restart

service gmetad restart
service httpd restart
