#!/bin/sh
export APL_VERSION=17.1.0

rm ./layer.zip
rm -rf ./output

# Can not update lambci/lambda-base:build docker image:
# apt-get update
apt-get install dos2unix 
apt-get install --assume-yes git

# HttpCommand is needed with conga only. JSON server as such is not used.
git clone https://github.com/Dyalog/JSONServer.git output/opt/JSONServer

# Markos APL promises:
git clone https://github.com/mvranic/aplpromisies.git output/opt/aplpromisies 

cp -r aplcode output/opt/
cp -r init output/opt/

# Change mode for shell scripts:
find output/opt/ -type f -iname "*.sh" -exec chmod +x {} \;

# Format the text files:
find output/opt/ -type f  \( -iname '*.sh' -o -iname '*.apl' -o -iname '*.dyalog' \) -print0 | xargs -0 dos2unix

#. cp -r ../output ./

docker -H:2375 build --build-arg APL_VERSION -t apl-provided-lambda-${APL_VERSION}  -e APL_VERSION=${APL_VERSION} .
docker -H:2375 run --rm apl-provided-lambda-v17.1.x cat /tmp/apl-v${APL_VERSION}.zip > ./layer.zip

# Buid end.