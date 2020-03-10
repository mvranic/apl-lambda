FROM ubuntu

ADD run-apl-build.sh /
RUN apt-get update
RUN apt-get install -y dos2unix
RUN dos2unix run-apl-build.sh 
ADD apl-distribution/*.zip /usr/src/project/apl-distribution/ 
RUN /run-apl-build.sh 