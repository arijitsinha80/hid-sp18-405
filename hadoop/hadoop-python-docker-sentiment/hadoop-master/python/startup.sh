#!/bin/bash

/etc/bootstrap.sh
exec /cloudmesh/python/runPythonMapReduce.sh


#cd /cloudmesh/python
#(time ./runPythonMapReduce.sh) 2>&1 | tee -a /cloudmesh/python/log.txt
#export PATH=$PATH:/$HADOOP_PREFIX/bin
#hadoop fs -put /cloudmesh/python/log.txt /
