FROM ubuntu:16.04
COPY ./build.sh /
COPY ./config.json /
RUN ./build.sh
