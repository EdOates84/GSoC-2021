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