import requests
import json
import re
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer

baseURL = "https://newsapi.org/v2/everything?"
total_requests=2
verbose=True

#WMATA

x = open('../data/WMATA-newapi-raw-data.json')
response = json.load(x)

def string_cleaner(input_string):
    try: 
        out=re.sub(r"""
                    [,.;@#?!&$-]+
                    \ * 
                    """,
                    " ",
                    input_string, flags=re.VERBOSE)

        out = re.sub('[’.]+', '', input_string)
        out = re.sub(r'\s+', ' ', out)
        out=out.lower()
    except:
        print("ERROR")
        out=''
    return out

article_list=response['articles']
article_keys=article_list[0].keys()
index=0
cleaned_data=[];  
for article in article_list:
    tmp=[]
    for key in article_keys:
        if(key=='source'):
            src=string_cleaner(article[key]['name'])
            tmp.append(src) 

        if(key=='author'):
            author=string_cleaner(article[key])
            if(src in author): 
                author='NA'
            tmp.append(author)

        if(key=='title'):
            tmp.append(string_cleaner(article[key]))

        if(key=='publishedAt'):
            ref = re.compile('.*-.*-.*T.*:.*:.*Z')
            date=article[key]
            if(not ref.match(date)):
                date="NA"
            tmp.append(date)

    cleaned_data.append(tmp)
    index+=1

df = pd.DataFrame(cleaned_data)
print(df.head())
df.to_csv('../data/cleaned_data/wmata_news_cleaned.csv', index=False)

corpus = df[2]
vectorizer=CountVectorizer()
word_counts  =  vectorizer.fit_transform(corpus)
print("vocabulary = ",vectorizer.vocabulary_)


## BART
x = open('../data/BART-newapi-raw-data.json')
response = json.load(x)

article_list=response['articles']
article_keys=article_list[0].keys()
index=0
cleaned_data=[];  
for article in article_list:
    tmp=[]
    for key in article_keys:
        if(key=='source'):
            src=string_cleaner(article[key]['name'])
            tmp.append(src) 

        if(key=='author'):
            author=string_cleaner(article[key])
            if(src in author): 
                author='NA'
            tmp.append(author)

        if(key=='title'):
            tmp.append(string_cleaner(article[key]))

        if(key=='publishedAt'):
            ref = re.compile('.*-.*-.*T.*:.*:.*Z')
            date=article[key]
            if(not ref.match(date)):
                date="NA"
            tmp.append(date)

    cleaned_data.append(tmp)
    index+=1

df = pd.DataFrame(cleaned_data)
print(df.head())
df.to_csv('../data/cleaned_data/bart_news_cleaned.csv', index=False)

corpus = df[2]
vectorizer=CountVectorizer()
word_counts  =  vectorizer.fit_transform(corpus)
print("vocabulary = ",vectorizer.vocabulary_)