from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
import random
import requests
import numpy as np

import sqlite3
from sqlite3 import Error
import ast

import logging
import platform

prod_path = '/var/www/html/j203/flashcards/'
local_path = ''

# Darwin->Mac, Linux->Prod
if platform.system() == 'Darwin':
    the_path = local_path
else:
    the_path = prod_path

logging.basicConfig(filename=the_path+'debug1.log', level=logging.DEBUG, format='%(asctime)s %(levelname)s %(name)s %(threadName)s : %(message)s')

# DB-related functions

def create_connection(db_file):
    """ create a database connection to the SQLite database
        specified by the db_file
    :param db_file: database file
    :return: Connection object or None
    """
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Error as e:
        print(e)

    return conn

def query_cards_from_deck(conn, title):
    """
    Query table based on select statement
    :param conn: the Connection object
    :param select: SQL select statement
    :return: rows
    """
    cur = conn.cursor()
    cur.execute("select deck_id from decks where title='%s'" % title)
    deck_id = cur.fetchone()
    cur.execute("SELECT card_id, data from cards where deck_id = '%d'" % deck_id)

    rows = cur.fetchall()

    data = []

    # clean up output so it is returned as a list of dict entries, add card_id as id in data dict
    for row in rows:
        card_id = row[0]
        d1 = ast.literal_eval(row[1])
        d1['id'] = card_id
        data.append(d1)

    return data

def addUnicode(val):
    urlbase = "https://kanjiapi.dev/v1/kanji/"
    for item in val:
        kanji = item['kanji']
        if kanji != '':
            url = urlbase + kanji
            r = requests.get(url)
            data = r.json()
            item['unicode'] = (data['unicode'])
        else:
            item['unicode'] = 'none'
    return val

def getUnicode(char):
    url = "https://kanjiapi.dev/v1/kanji/" + char
    r = requests.get(url)
    if r.status_code == 200:
        data = r.json()
        val = data['unicode']
    else:
        val = None

    return val

app = Flask(__name__, static_url_path='',
                  static_folder='build',
                  template_folder='build')

# A Flask extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible
# CORS(app, resources={r"/*": {"origins": "*"}})
CORS(app)

database = the_path + r"db/kanji_tester.db"
conn = create_connection(database)
kanji_2a2b = query_cards_from_deck(conn, "Kanji 2A,2B")
kanji_3a3b = query_cards_from_deck(conn, "Kanji 3A,3B")
vocab_housing = query_cards_from_deck(conn, "Housing")
vocab_fa = query_cards_from_deck(conn, "Furnishings and Appliances")
vocab_hc = query_cards_from_deck(conn, "Household Chores")
vocab_verbs = query_cards_from_deck(conn, "Verbs")
vocab_tv = query_cards_from_deck(conn, "Transitive Verbs")
vocab_itv = query_cards_from_deck(conn, "Intransitive Verbs")

invalid_list = [{'id': 9999, 'kanji': 'Invalid', 'wordj': 'Invalid', 'hiragana': 'Invalid', 'definition': "Invalid", 'unicode': 0000}]

kanji_2a2b = addUnicode(kanji_2a2b)
kanji_3a3b = addUnicode(kanji_3a3b)
vocab_housing = addUnicode(vocab_housing)
vocab_fa = addUnicode(vocab_fa)
vocab_hc = addUnicode(vocab_hc)
vocab_verbs = addUnicode(vocab_verbs)
vocab_tv = addUnicode(vocab_tv)
vocab_itv = addUnicode(vocab_itv)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/hello")
def hello():
    return render_template("hello.html", name="Bob")

@app.route("/api/hello")
def api_hello():
    version = request.args.get('version')
    if version == 'Kanji 2A,2B':
        words = kanji_2a2b
    elif version == 'Kanji 3A,3B':
        words = kanji_3a3b
    elif version == 'Housing':
        words = vocab_housing
    elif version == 'FA':
        words = vocab_fa
    elif version == 'HC':
        words = vocab_hc
    elif version == 'Ch2Verbs':
        words = vocab_verbs
    elif version == 'Transitive':
            words = vocab_tv
    elif version == 'Intransitive':
        words = vocab_itv
    else:
        words = invalid_list

    random_list = random.sample(words, len(words))

    return jsonify(random_list)

@app.route("/api/strokes")
def api_strokes():
    unicodeList = []
    chars = request.args.get('chars')
    for char in chars:
        unicode = getUnicode(char)
        if unicode is not None:
            unicodeList.append({'kanji': char, 'url': 'https://kanji.sljfaq.org/kanjivg/memory.cgi?c=' + unicode})

    return jsonify(unicodeList)

if __name__ == "__main__":
    app.run()
