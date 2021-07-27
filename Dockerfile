FROM ubuntu:20.04

RUN apt-get update -qq -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    	build-essential \
        wget \
        python3-dev \
        python3-pip \
        git \
        unrar \
        r-base \
        default-libmysqlclient-dev \
        default-jre && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /show_segmentation/