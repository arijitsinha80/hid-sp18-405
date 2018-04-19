#!/bin/bash

./compose-pull-image.sh

if [ $# -ne 1 ]; then
    ./compose-scale.sh 1
else ./compose-scale.sh $1
fi

./compose-run.sh

docker-compose down