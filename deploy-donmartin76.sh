#!/bin/bash

pushd certs
source ./donmartin76.sh
popd

eval $(docker-machine env donmartin76)

export | grep DOCKER
# export | grep PORTAL 

docker-compose stop portal-api
docker-compose rm --force portal-api portal-api-data-static
#docker-compose pull
docker-compose build
docker-compose up -d portal-api-data-static
docker-compose up --force-recreate -d

exit
