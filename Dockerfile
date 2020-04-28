FROM centos:8 as builder

RUN yum -y update \
 && yum -y install gcc make

WORKDIR /usr/local/src

RUN curl -L -O https://github.com/darold/squidclamav/archive/v7.1.tar.gz

RUN rm -rf /usr/local/src/*

FROM centos:8

COPY --from=builder /usr/local /usr/local

# RUN c-icap -VV

EXPOSE 1344
