#!/bin/sh
rm -f ./layer.zip
dockerport=
#dockerport="-H:2375"
docker $dockerport build -t apl-build-layer .
docker $dockerport create --name extract apl-build-layer
docker $dockerport cp extract:/usr/src/layer/apllayer.zip .
docker $dockerport rm extract
docker $dockerport rmi apl-build-layer
