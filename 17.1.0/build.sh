#!/bin/sh
export APL_VERSION=17.1.0

rm ./layer.zip
rm -rf ./layer
rm -rf ./output

# Can not update lambci/lambda-base:build docker image:
# apt-get update
apt-get install dos2unix 
apt-get install --assume-yes git

# Markos APL async Tasks:
git clone https://github.com/mvranic/aplasync.git output/aplasync 

cp -r aplcode output/aplcode
cp -r source output/source

cp -r dyalog/opt/mdyalog/ output/mdyalog

# Change mode for shell scripts:
find ./output/ -type f -iname "*.sh" -exec chmod +x {} \;

# Format the text files:
find ./output/ -type f  \( -iname '*.sh' -o -iname '*.apl' -o -iname '*.dyalog' \) -print0 | xargs -0 dos2unix

# cp -r ../output ./

docker -H :2375 build -t apl-provided-lambda-v${APL_VERSION} --build-arg APL_VERSION=${APL_VERSION} .
docker -H :2375 run --rm apl-provided-lambda-v${APL_VERSION} cat /tmp/apl-v${APL_VERSION}.zip > ./layer.zip

# Buid end.

mkdir ./layer
unzip ./layer.zip -d ./layer

# Needed for test
