#
# Base Ubuntu image for foodjunky applications.
#
# docker-build properties:
# TAG=foodjunky/base:latest

FROM ubuntu:xenial
MAINTAINER Jeremy Jongsma "jjongsma@foodjunky.com"

ENV DEBIAN_FRONTEND noninteractive

# Update base packages
RUN apt-get --yes update && \
	apt-get --yes install wget tar unzip git python python-setuptools software-properties-common && \
	apt-get clean && \
	wget https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py && \
	pip install crypter boto awscli

ADD root/ /root/

# Logging volume for export to log aggregator by host
VOLUME ["/var/log/ext"]
