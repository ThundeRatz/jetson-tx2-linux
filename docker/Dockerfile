FROM ubuntu:14.04
MAINTAINER Tiago Koji Castro Shibata

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV MAKEFLAGS -j4

RUN apt-get update \
    && apt-get install --no-install-recommends -y ca-certificates gcc git libc6-dev make wget \
    && rm -rf /var/lib/apt/lists/*

COPY ./default-cmd.sh /
CMD ["/default-cmd.sh"]
