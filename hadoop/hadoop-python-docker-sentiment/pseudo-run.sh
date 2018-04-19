#!/bin/bash
DESTDIR=Results-pseudo

echo "Pull the image"
docker pull minchen57/hadoop-docker-python-sentiment-pseudo:latest

echo "Run the container with sentiment analysis on hadoop"
docker run -it --name pseudo-hadoop minchen57/hadoop-docker-python-sentiment-pseudo:latest 

echo "Get the results"
rm -rf $DESTDIR
mkdir -p $DESTDIR
docker cp pseudo-hadoop:/cloudmesh/python/output_pos_tagged ./$DESTDIR
docker cp pseudo-hadoop:/cloudmesh/python/output_neg_tagged ./$DESTDIR
docker cp pseudo-hadoop:/cloudmesh/python/log.txt ./$DESTDIR


echo "Stop the container"
docker stop pseudo-hadoop
docker rm pseudo-hadoop
