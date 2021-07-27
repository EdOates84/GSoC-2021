import requests

url = "https://www.wikidata.org/w/api.php"


while True:
    query = input("Enter name : ")
    if query == "quit":
        break
    else:
        params = {
        "action" : "wbsearchentities",
        "language" : "en",
        "format" : "json",
        "search" : query 
        }
        try:
            data = requests.get(url,params=params)
            print(data.json()["search"])
        except:
            print("Invalid Input try again !!!")

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