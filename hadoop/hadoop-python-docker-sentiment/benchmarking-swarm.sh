#!/bin/bash

if [ $# -ne 2 ]; then
    echo 1>&2 Usage: [# of iteration][# of workers]
    echo "e.g. 5"
    exit -1
fi

worker=$2

DESTDIR=benchmark-swarm
mkdir -p $DESTDIR
./swarm-down.sh
sleep 20

for i in $(seq 1 $1)
do
    echo "Worker# =" $worker ", Iter :" $i
    echo "starting the containers in swarm mode"
    docker stack deploy --compose-file docker-swarm.yml hadoop-sentiment
    echo "scale up the service to $worker worker"
    docker service scale hadoop-sentiment_worker=$worker
    echo "running the sentiment analysis on movie reviews at backend..."
    echo "getting physical node that runs master"
    nodeID=$(docker stack ps  -f "name=hadoop-sentiment_master.1" --format "{{.Node}}" hadoop-sentiment)
    echo $nodeID
    s1=${nodeID: -1}
    s2=0
    if [ "$s1" == "$s2" ]; then
        host="http://149.165.150.80"
    else
        host="http://149.165.150.7${nodeID: -1}"
    fi

    echo "Please look for results at: "
    echo "$host:50070"
    echo "Please track jobs and resources at : "
    echo "$host:8088/cluster"

    echo "Please wait for results..."
    j=1
    until curl -f -s "$host:8088/logs/log.txt";
    do
        if [[ j -gt 12 ]]; then
            break
        fi
        echo "not yet, please wait"
        sleep 60
        j=$((j+1))
    done

    echo "getting the results..."
    curl "$host:8088/logs/time.txt" >> ./$DESTDIR/$2_worker.txt

    ./swarm-down.sh
    sleep 30
done



