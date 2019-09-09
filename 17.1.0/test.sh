#!/bin/sh

rm -rf layer && unzip layer.zip -d layer

cd test

# Create zipfile for uploading to Lambda – we don't use this here
rm -f lambda.zip && zip -qyr lambda.zip index

docker -H :2375 run --rm -v "$PWD":/var/task -v "$PWD"/../layer:/opt lambci/lambda:provided index.aplHandler
# powersehll
# docker run  --rm -v C:\apl-lambda\17.1.0\test:/var/task -v C:\apl-lambda\17.1.0/layer:/opt  lambci/lambda:provided  index.aplHandler
# docker run  --rm -v C:\apl-lambda\17.1.0\test:/var/task -v C:\apl-lambda\17.1.0/layer:/opt  lambci/lambda:provided  index.aplHandler '{\"some\": \"event\"}'