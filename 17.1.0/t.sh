#!/bin/sh

testpath="$PWD/test"
layerpath=$PWD

rm -rf layer && unzip layer.zip -d layer

cd test

docker -H:2375 run -it --entrypoint=/bin/bash --rm -v "$testpath":/var/task -v "$layerpath"/layer:/opt lambci/lambda:provided index.myFn

