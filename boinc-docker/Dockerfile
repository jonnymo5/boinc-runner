FROM ubuntu:16.04

MAINTAINER John Moberly <jonnymo5@gmail.com>

LABEL Description="A BOINC container to contain the insanity." \
      Base_Image="ubuntu:16.04"


RUN apt-get update &&                  \
    apt-get install -y boinc-client && \
    apt-get clean &&                   \
    rm -rf /var/lib/apt/lists/*

USER boinc

EXPOSE  31416 \
        80    \
        443

WORKDIR /var/lib/boinc-client

ENTRYPOINT ["boinc"]
