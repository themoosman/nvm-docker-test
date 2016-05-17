FROM docker.io/java:7

MAINTAINER themoosman

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install pre-reqs
RUN apt-get update
RUN apt-get -y install curl build-essential

ENV WORKDIR=/tmp/git

RUN mkdir -p ${WORKDIR} && cd ${WORKDIR}

#Copy the local conf to the image
COPY .nvm ${WORKDIR}/

RUN chmod -R 777 /tmp/git/*

#RUN source /tmp/git/.nvm/nvm.sh;

ADD sleep.sh /tmp/sleep.sh
WORKDIR /tmp
ENTRYPOINT ["/tmp/sleep.sh"]
