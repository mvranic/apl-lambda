#!/bin/sh
rm -f ./apllayer.zip
dockerport=
#dockerport="-H:2375"
docker $dockerport build -t apl-build-layer .
docker $dockerport create --name extract apl-build-layer
docker $dockerport cp extract:/usr/src/layer/apllayer.zip ./output
docker $dockerport rm extract
docker $dockerport rmi apl-build-layer
