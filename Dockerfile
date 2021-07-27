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

RUN python3 -m pip install --upgrade poetry==1.1.7

ADD pyproject.toml poetry.lock /show_segmentation/

RUN poetry export \
      --without-hashes > requirements.txt && \
    python3 -m pip install -r requirements.txt && \
    rm requirements.txt && \
    rm -rf /root/.cache

RUN echo "/show_segmentation" > \
    /usr/local/lib/python3.8/dist-packages/show_segmentation.pth

RUN ln -sf /usr/bin/python3 /usr/bin/python

RUN R -e 'install.packages(c("dplyr", "tidyr", "readr", "purrr"))'

ADD . /show_segmentation/