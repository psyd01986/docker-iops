#!/bin/bash

USERNAME=$1
PASSWORD=$2

IMAGE=docker-iops:1.0
HUB=psyd01986

SCRIPT_DIR=$(cd $(dirname ${0}); pwd)

docker build -f Dockerfile.alp318 -t $IMAGE ${SCRIPT_DIR} 

if [[ -n ${1} ]]; then
	docker login -u $USERNAME -p $PASSWORD $HUB
fi

docker tag $IMAGE $HUB/$IMAGE
docker push $HUB/$IMAGE
