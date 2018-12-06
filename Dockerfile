FROM hseeberger/scala-sbt:11.0.1_2.12.7_1.2.6

# Env variables
ENV SCALA_VERSION 2.12.7
ENV SBT_VERSION 1.2.6

LABEL maintainer="oscarvarto@protonmail.com"

RUN apt install -y netselect-apt
RUN \
    netselect-apt -t 15 -a amd64 -n sid && \
    cp /etc/apt/sources.list /etc/apt/sources.list_backup && \
    mv sources.list /etc/apt/sources.list

RUN apt update
RUN apt upgrade -y
RUN apt install -y jekyll

ENV PANDOC_VERSION=2.4

RUN curl -fsL https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb --output pandoc-${PANDOC_VERSION}-1-amd64.deb
RUN apt install ./pandoc-${PANDOC_VERSION}-1-amd64.deb

EXPOSE 35729
EXPOSE 4000