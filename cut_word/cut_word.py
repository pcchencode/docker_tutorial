import sys, os
import pandas as pd
from ckiptagger import data_utils, construct_dictionary, WS, POS, NER

def ckip_cut(text_list):
    if not os.path.isdir("./data"):
        print('ckip data non-exist, start download')
        data_utils.download_data_gdown("./")  # gdrive-ckip, !pip install gdown
    ws = WS("./data")
    ckip_corpus = ws(text_list)
    return ckip_corpus

if __name__ == '__main__':
    corpus = pd.read_csv('corpus.csv', names=['text'], header=None)
    corpus_list = corpus['text'].tolist()
    # print(corpus_list)
    ckip_corpus = ckip_cut(corpus_list)

    for res in ckip_corpus:
        print(res)

    # print(ckip_corpus)


