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
    print(title, deck_id)
    cur.execute("SELECT card_id, data from cards where card_id in (select card_id from cards_in_decks where deck_id = '%d')" % deck_id)

    rows = cur.fetchall()

    data = []

    # clean up output so it is returned as a list of dict entries
    for row in rows:
        card_id = row[0]
        d1 = ast.literal_eval(row[1])
        d1['id'] = card_id
        data.append(d1)

    return data

database = r"/var/www/html/j203/kanji-tester/db/kanji_tester.db"
conn = create_connection(database)
chp2 = query_cards_from_deck(conn, "Kanji 2A,2B")
chp3 = query_cards_from_deck(conn, "Kanji 3A,3B")
print(chp2)
print(chp3)
