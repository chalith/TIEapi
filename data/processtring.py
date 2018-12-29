import nltk,re,emoji,unidecode,html,contractions,string

punctuation = set(string.punctuation)


def generate_xml_tring(text):
    text = text.replace('\r','')
    lines = text.split('\n')
    xml = ""
    for line in lines:
        line = line.strip()
        if(line.startswith('<') and not line.startswith('<?')):
            xml += line
    end = xml.find("</root><root>")
    if end > -1:
        xml = xml[:xml.find("</root><root>")+7]
    return xml

def removeRegExp(regExp, text):
    return re.sub(regExp, '', text)

def removeURLs(text):
    return removeRegExp(r'(http|https|ftp)://[a-zA-Z0-9\\./]+.', text)

def removeUserNames(text):
    return removeRegExp(r'@(\w+).', text)

def removeHashtags(text):
    return removeRegExp(r'#(\w+).', text)

def removeUnwanted(text):
    return removeRegExp(r'[^a-zA-Z\.\s]+', text)

def removeRepeats(text):
    text = re.sub(r'([a-zA-Z]?)\1{2,}', r'\1'+r'\1', text)
    text = re.sub(r'([^a-zA-Z]+?|.{2,}?)\1+', r'\1', text)
    return text

def removeEmoticons(text):
    return ''.join(c for c in text if not(c in emoji.UNICODE_EMOJI))

def removeRepeats(text):
    text = re.sub(r'([a-zA-Z]?)\1{2,}', r'\1\1', text)
    text = re.sub(r'([^a-zA-Z]|.{2,}?)\1+', r'\1', text)
    return text

def removeNumbers(text):
    text = re.sub(r'[0-9]+', '', text)
    return text

def removeEmoticons(text):
    return ''.join(c for c in text if not(c in emoji.UNICODE_EMOJI))

def removeOwnerships(text):
    return text.replace("'s","")

def removePunctuation(text):
    return "".join(ch for ch in text if ch == '.' or ch not in punctuation)

def extractEmoticons(text):
    emojis = []
    for c in text:
        if c in emoji.UNICODE_EMOJI:
            emojis.append(c)
    return emojis

def clearText(text):
    text = unidecode.unidecode(text)
    text = html.unescape(text)
    text = re.sub(r'<[^>]*>',' ',text)
    text = contractions.fix(text)
    text = text.strip()
    text = text.replace('\n','')
    return text

def getSentimentText(text):
    text = removeURLs(text)
    text = removeUserNames(text)
    text = removeHashtags(text)
    #text = removeUnwanted(text)
    text = removeNumbers(text)
    text = removeRepeats(text)
    text = removeEmoticons(text)
    text = clearText(text)
    #text = removeOwnerships(text)
    #text = removePunctuation(text)
    return text

def extractEntityNames(tree):
	entity_names = []
	if hasattr(tree, 'label') and tree.label:
		if tree.label() == 'NE':
			entity_names.append(' '.join([child[0] for child in tree]))
		else:
			for child in tree:
				entity_names.extend(extractEntityNames(child))
 
	return entity_names

def getEntities(text):
	sentences = nltk.sent_tokenize(text)
	tokenized_sents = [nltk.word_tokenize(sentence) for sentence in sentences]
	tagged_sents = [nltk.pos_tag(sentence) for sentence in tokenized_sents]
	chunked_sents = nltk.ne_chunk_sents(tagged_sents, binary=True)
	entities = []
	for tree in chunked_sents:
		entities.extend(extractEntityNames(tree))
	return entities

def camelCaseSplit(text):
    return re.sub('([a-z])([A-Z])', r'\1 \2', text).split()