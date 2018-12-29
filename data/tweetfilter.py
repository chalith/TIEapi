import glob,json
import pandas as pd
from nltk.corpus import wordnet as wn
from rake_nltk import Rake
from processtring import *

Rake = Rake()

tweet_ids = []
texts = []
keywords = ["travel","holiday","vacation","traveling","TTOT",
            "wanderlust", "RTW","backpacking","adventure","hotel","nature"]

i = 0
count = 0
savefilename = 0

def isSubjective(text, hashtags):
    Rake.extract_keywords_from_text(text)
    tokens = [word for (score, word) in Rake.get_ranked_phrases_with_scores()]
    tokens += hashtags
    for token in tokens:
        syn_sets = wn.synsets(token)
        for syn_set in syn_sets:
            for syn in syn_set.lemma_names():
                if syn in keywords:
                    return True
    return False

def genarateJson(tweets_file):
    global texts, tweet_ids, i, count, savefilename
    loader = ['-','\\','|','/']
    for line in tweets_file:
        try:
            cur_item = json.loads(line)
            geotag = cur_item["geo"]
            if not geotag:
                continue
            b = "Loading  tweets ("+str(count)+"/"+str(i)+")   "+loader[i%4]
            print (b, end="\r")
            i = i+1
        except:
            continue
        if "extended_tweet" in cur_item:
            text = clearText(cur_item["extended_tweet"]["full_text"])
            hashtags = [ele["text"] for ele in cur_item["extended_tweet"]["entities"]["hashtags"]]
        else:
            text = clearText(cur_item["text"])
            hashtags = [ele["text"] for ele in cur_item["entities"]["hashtags"]]
        sentiment_text = getSentimentText(text)
        if isSubjective(sentiment_text, hashtags):
            count = count + 1
            tweet_id = cur_item["id"]
            text = sentiment_text
            tweet_ids.append(tweet_id)
            texts.append(text)
            if count%10 == 0:
                savefilename += 1
                filejsn = {'id': tweet_ids, 'text': texts}
                tweet_ids = []
                texts = []
                outdf = pd.DataFrame(filejsn).sample(frac=1).reset_index(drop=True)
                outdf.to_csv('./csv/new/'+str(savefilename)+'.csv')
                            
def readTweets():
    for filename in glob.glob('./json/*.txt'):
        tweets_file = open(filename, 'r', encoding='utf8', errors='ignore')
        genarateJson(tweets_file)
        tweets_file.close()

readTweets()