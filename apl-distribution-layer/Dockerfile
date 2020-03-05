FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y unzip
RUN apt-get install -y zip
ADD apl-distribution/*.zip /usr/src/project/apl-distribution/ 
RUN mkdir /usr/src/dyalog-deb
RUN unzip /usr/src/project/apl-distribution/*.zip -d /usr/src/dyalog-deb
RUN mkdir /usr/src/dyalog
RUN dpkg-deb -R /usr/src/dyalog-deb/*.deb /usr/src/dyalog
RUN ls -la /usr/src/dyalog/opt
RUN mkdir /usr/src/layer
RUN zip -r /usr/src/layer/layer  /usr/src/dyalog/opt/mdyalog
RUN ls -la /usr/src/layer
