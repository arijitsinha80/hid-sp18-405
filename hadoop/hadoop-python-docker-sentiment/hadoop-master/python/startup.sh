#!/bin/bash

/etc/bootstrap.sh
mkdir -p $HADOOP_PREFIX/logs
chmod 777 $HADOOP_PREFIX/logs
date > $HADOOP_PREFIX/logs/date.txt
/cloudmesh/python/runPythonMapReduce.sh


#cd /cloudmesh/python
#(time ./runPythonMapReduce.sh) 2>&1 | tee -a /cloudmesh/python/log.txt
#export PATH=$PATH:/$HADOOP_PREFIX/bin
#hadoop fs -put /cloudmesh/python/log.txt /
