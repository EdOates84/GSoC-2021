FROM ubuntu:20.04
RUN apt-get update -y \
# RUN apt-get update -qq -y && \
#     DEBIAN_FRONTEND=noninteractive apt-get install -y \
#     	build-essential \
#         libgtk-3-dev \
#         libboost-all-dev \
#         python3 \
#         python3-pip \

# RUN pip3 install -qq -y && \
#     DEBIAN_FRONTEND=noninteractive pip3 install -y \
#     	numpy \
#         scikit-learn \
#         pandas \
#         dlib \
#         opencv-python \
#         face_recognition \
#         matplotlib \
#         wikipedia \
