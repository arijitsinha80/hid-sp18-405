#!/bin/bash
if [ $# -ne 1 ]; then
worker=1
else worker=$1
fi

echo "starting the containers in swarm mode"
docker stack deploy --compose-file docker-swarm.yml hadoop-sentiment
echo "scale up the service to $worker worker"
docker service scale hadoop-sentiment_worker=$worker

echo "running the sentiment analysis on movie reviews at backend..."
echo "getting physical node that runs master"
nodeID=$(docker stack ps  -f "name=hadoop-sentiment_master.1" --format "{{.Node}}" hadoop-sentiment)
echo $nodeID
echo "Please look for results at: "
echo "http://149.165.150.7${nodeID: -1}:50070"
echo "Please track jobs and resources at : "
echo "http://149.165.150.7${nodeID: -1}:8088/cluster"
