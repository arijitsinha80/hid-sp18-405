#!/bin/bash
DESTDIR=Results-pseudo
rm -rf $DESTDIR
mkdir -p $DESTDIR

echo "Pull the image"
docker pull minchen57/hadoop-docker-python-sentiment-pseudo:latest

for i in $(seq 1 $1)
do
TAG=`date +%Y%m%d%H%M%S`
echo "Run the container with sentiment analysis on hadoop"
docker run -it --name pseudo-hadoop minchen57/hadoop-docker-python-sentiment-pseudo:latest 

echo "Get the results"
#docker cp pseudo-hadoop:/cloudmesh/python/output_pos_tagged ./$DESTDIR/output_pos_tagged_$TAG
#docker cp pseudo-hadoop:/cloudmesh/python/output_neg_tagged ./$DESTDIR/output_neg_tagged_$TAG
docker cp pseudo-hadoop:/cloudmesh/python/log.txt ./$DESTDIR/log_$TAG.txt
echo "Stop the container"
docker stop pseudo-hadoop
docker rm pseudo-hadoop
done




