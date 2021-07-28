FROM ubuntu:20.04
RUN apt-get update -qq -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    	build-essential \
        libgtk-3-dev \
        libboost-all-dev \
        python3 \
        python3-pip \
RUN pip install -qq -y && \
    DEBIAN_FRONTEND=noninteractive pip install -y \
    	numpy \
        scikit-learn \
        pandas \
        dlib \
        opencv-python \
        face_recognition \
        matplotlib \
        wikipedia \
WORKDIR /show_segmentation/