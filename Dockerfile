FROM ubuntu:20.04

RUN apt-get update -qq -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    	build-essential \
        python3-dev \
        python3-pip \
        libgtk-3-dev \
        python3 \

WORKDIR /show_segmentation/

RUN python3 -m pip install numpy

RUN python3 -m pip install scikit-learn

RUN python3 -m pip install pandas

RUN python3 -m pip install dlib

RUN python3 -m pip install opencv-python

RUN python3 -m pip install face_recognition

RUN python3 -m pip install matplotlib

RUN python3 -m pip install wikipedia