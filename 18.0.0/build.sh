#!/bin/sh
# You might need to dos2unix this file to run as sudo from bash.
export APL_VERSION=18.0.0

export DOCKER_PORT=
# To use docker in Windows:
export DOCKER_PORT=-H:2375

rm ./layer.zip
rm -rf ./layer
rm -rf ./output
rm -rf ./dyalog
rm -rf ./tmp


# Can not update lambci/lambda-base:build docker image:
# apt-get update
apt-get install --assume-yes dos2unix 
apt-get install --assume-yes git
apt-get install --assume-yes unzip

#apt-get update
#apt-get install apt-transport-https
#apt-get update
#apt-get install dotnet-sdk-3.1

dotnet build src/AplAwsRuntime.sln

mkdir tmp
unzip  apl-distribution/*.zip -d tmp
mkdir dyalog
dpkg-deb -R tmp/*.deb dyalog
export mnt_prefix="/mnt"
export pwdwithoutmnt=$(pwd) 
export pwdwithoutmnt=${pwdwithoutmnt#$mnt_prefix}
docker ${DOCKER_PORT} run -it --rm --privileged --name build-apl-sln -v  $pwdwithoutmnt:/usr/src/project mcr.microsoft.com/dotnet/core/sdk:3.1-bionic /bin/sh -c "cd /usr/src/project/src; dotnet build"

# Todo: remove this:
# Markos APL async Tasks:
git clone https://github.com/mvranic/aplasync.git output/aplasync 

cp -r aplcode output/aplcode
cp -r source output/source

cp -r dyalog/opt/mdyalog/ output/mdyalog

# Change mode for shell scripts:
find ./output/ -type f  \( -iname '*.sh' -o -iname '*.dll' \)  -exec chmod +x {} \;

# Format the text files:
find ./output/ -type f  \( -iname '*.sh' -o -iname '*.apl' -o -iname '*.dyalog' \) -print0 | xargs -0 dos2unix

# cp -r ../output ./

docker ${DOCKER_PORT} build -t apl-provided-lambda-v${APL_VERSION} --build-arg APL_VERSION=${APL_VERSION} .
docker ${DOCKER_PORT} run --rm apl-provided-lambda-v${APL_VERSION} cat /tmp/apl-v${APL_VERSION}.zip > ./layer.zip

# Buid end.

mkdir ./layer
unzip ./layer.zip -d ./layer

# Needed for test
