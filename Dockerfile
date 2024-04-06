FROM ubuntu:latest

WORKDIR /cs2d_server

COPY download_cs2d_server.sh /cs2d_server

RUN dpkg --add-architecture i386

RUN apt-get update -y

RUN apt-get install -y curl unzip lib32z1 libc6:i386

RUN /bin/bash download_cs2d_server.sh

ENTRYPOINT ["./cs2d_dedicated"]
