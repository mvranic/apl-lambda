Remove-Item  './apllayer.zip' -ErrorAction Ignore 
docker build -t apl-build-layer .
docker create --name extract apl-build-layer
docker cp extract:/usr/src/layer/apllayer.zip ./output
docker rm extract
docker rmi apl-build-layer