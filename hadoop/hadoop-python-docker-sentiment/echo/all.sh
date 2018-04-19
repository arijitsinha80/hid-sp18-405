#!/bin/bash

if [ $# -ne 1 ]; then
    ./scale.sh 1
else ./scale.sh $1
fi

./run.sh

docker-compose down