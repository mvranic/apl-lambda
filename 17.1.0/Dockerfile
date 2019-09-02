FROM lambci/lambda-base:build

ARG APL_VERSION

COPY bootstrap.c /opt/
COPY Distribution/ /opt/apllambda/Distribution/
COPY output/ /opt/


#RUN curl -sSL https://nodejs.org/dist/v${APL_VERSION}/apl-v${APL_VERSION}-linux-x64.tar.xz | \
#  tar -xJ -C /opt --strip-components 1 -- apl-v${APL_VERSION}-linux-x64/bin/node && \
#  strip /opt/bin/node

RUN cd /opt && \
  export APL_MAJOR=$(echo $APL_VERSION | awk -F. '{print "\""$1"\""}') && \
  clang -Wall -Werror -s -O2 -D APL_MAJOR="$APL_MAJOR" -o bootstrap bootstrap.c && \
  rm bootstrap.c && \
  zip -yr /tmp/apl-v${APL_VERSION}.zip ./*
