#!/bin/bash
apt-get update -y
apt-get install -y unzip
apt-get install -y zip
mkdir /usr/src/dyalog-deb
unzip /usr/src/project/apl-distribution/*.zip -d /usr/src/dyalog-deb
mkdir /usr/src/dyalog
dpkg-deb -R /usr/src/dyalog-deb/*.deb /usr/src/dyalog
rm -rf /usr/src/dyalog/opt/mdyalog/18.0/64/unicode/help
rm -rf /usr/src/dyalog/opt/mdyalog/18.0/64/unicode/Samples
mkdir /usr/src/layer
cd  /usr/src/dyalog/opt
zip -r /usr/src/layer/apllayer  mdyalog