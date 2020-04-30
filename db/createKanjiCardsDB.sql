DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS decks;
DROP TABLE IF EXISTS cards_in_decks;
DROP TABLE IF EXISTS classes;

CREATE TABLE classes (
	class_id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL
);

INSERT INTO classes (title)
VALUES
	("J203");

	CREATE TABLE decks (
		deck_id INTEGER PRIMARY KEY AUTOINCREMENT,
		class_id INTEGER NOT NULL,
	  title TEXT NOT NULL,
	  topic1 TEXT NOT NULL,
	  topic2 TEXT NOT NULL,
		FOREIGN KEY (class_id)
			REFERENCES classes (class_id)
				ON UPDATE RESTRICT
				ON DELETE RESTRICT
	);

	INSERT INTO decks (class_id, title, topic1, topic2)
	VALUES
	  (1, "Kanji 2A,2B", "Kanji", "Chapter 2"),
	  (1, "Kanji 3A,3B", "Kanji", "Chapter 3"),
		(1, "Housing", "Vocabulary", "Chapter 2"),
		(1, "Furnishings and Appliances", "Vocabulary", "Chapter 2"),
		(1, "Household Chores", "Vocabulary", "Chapter 2"),
		(1, "Verbs", "Vocabulary", "Chapter 2");

CREATE TABLE cards (
	card_id INTEGER PRIMARY KEY AUTOINCREMENT,
  deck_id INTEGER NOT NULL,
	data BLOB NOT NULL,
  FOREIGN KEY (deck_id)
    REFERENCES decks (user_id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT
);

INSERT INTO cards (deck_id, data)
VALUES
  (1, "{'kanji': '新', 'wordj': '新しい', 'hiragana': 'あたらしい', 'definition': 'new'}"),
  (1, "{'kanji': '開', 'wordj': '開く', 'hiragana': 'あく', 'definition': 'to open'}"),
  (1, "{'kanji': '公', 'wordj': '「公」園', 'hiragana': '「こう」えん', 'definition': 'park'}"),
  (1, "{'kanji': '園', 'wordj': '公「園」', 'hiragana': 'こう「えん」', 'definition': 'park'}"),
  (1, "{'kanji': '住', 'wordj': '住む', 'hiragana': 'すむ', 'definition': 'to live / reside'}"),
  (1, "{'kanji': '階', 'wordj': '二「階」', 'hiragana': 'に「かい」', 'definition': '2nd floor'}"),
  (1, "{'kanji': '広', 'wordj': '広い', 'hiragana': 'ひろい', 'definition': 'wide / spacious'}"),
  (1, "{'kanji': '直', 'wordj': '直す', 'hiragana': 'なおす', 'definition': 'fix / correct / revise'}"),
  (1, "{'kanji': '戸', 'wordj': '戸', 'hiragana': 'と', 'definition': 'door'}"),
  (1, "{'kanji': '古', 'wordj': '古い', 'hiragana': 'ふるい', 'definition': 'old'}"),
  (1, "{'kanji': '門', 'wordj': '門', 'hiragana': 'もん', 'definition': 'gate'}"),
  (1, "{'kanji': '室', 'wordj': '室', 'hiragana': 'しつ', 'definition': 'room'}"),
  (1, "{'kanji': '伝', 'wordj': '伝える', 'hiragana': 'つたえる', 'definition': 'to tell / convey / transmit'}"),
  (1, "{'kanji': '洗', 'wordj': '洗う', 'hiragana': 'あらう', 'definition': 'to wash'}"),
  (1, "{'kanji': '建', 'wordj': '建てる', 'hiragana': 'たてる', 'definition': 'to build'}"),
  (1, "{'kanji': '友', 'wordj': '友', 'hiragana': 'とも', 'definition': 'friend'}"),
  (1, "{'kanji': '貸', 'wordj': '貸す', 'hiragana': 'かす', 'definition': 'to lend / rent out'}"),
  (1, "{'kanji': '借', 'wordj': '借りる', 'hiragana': 'かりる', 'definition': 'to borrow'}"),
  (1, "{'kanji': '置', 'wordj': '置く', 'hiragana': 'おく', 'definition': 'to put / place set / leave behind / leave as is'}"),
  (1, "{'kanji': '静', 'wordj': '静か', 'hiragana': 'しずか', 'definition': 'quiet'}"),
  (1, "{'kanji': '庭', 'wordj': '庭', 'hiragana': 'にわ', 'definition': 'garden'}"),
  (1, "{'kanji': '便', 'wordj': '「便」利', 'hiragana': '「べん」り', 'definition': 'convenient'}"),
  (1, "{'kanji': '不', 'wordj': '「不」便', 'hiragana': '「ふ」べん', 'definition': 'inconvenient'}"),
  (2, "{'kanji': '自', 'wordj': '「自」分で', 'hiragana': '「じ」ぶんで', 'definition': 'on ones own'}"),
  (2, "{'kanji': '路', 'wordj': '道「路」', 'hiragana': 'どう「ろ」', 'definition': 'road'}"),
  (2, "{'kanji': '交', 'wordj': '「交」通', 'hiragana': '「こう」つう', 'definition': 'traffic / transportation'}"),
  (2, "{'kanji': '通', 'wordj': '通る', 'hiragana': 'とおる', 'definition': 'to pass through'}"),
  (2, "{'kanji': '転', 'wordj': '運「転」', 'hiragana': 'うん「てん」', 'definition': 'driving'}"),
  (2, "{'kanji': '駐', 'wordj': '「駐」車場', 'hiragana': '「ちゅう」しゃじょう', 'definition': 'parking lot'}"),
  (2, "{'kanji': '教', 'wordj': '教える', 'hiragana': 'おしえる', 'definition': 'teach / explain'}"),
  (2, "{'kanji': '窓', 'wordj': '窓', 'hiragana': 'まど', 'definition': 'window'}"),
  (2, "{'kanji': '閉', 'wordj': '閉める', 'hiragana': 'しめる', 'definition': 'close / shut'}"),
  (2, "{'kanji': '消', 'wordj': '消す', 'hiragana': 'けす', 'definition': 'extinguish / turn off (a light) / erase / cancel out'}"),
  (2, "{'kanji': '変', 'wordj': '変える', 'hiragana': 'かえる', 'definition': 'change'}"),
  (2, "{'kanji': '故', 'wordj': '事「故」', 'hiragana': 'じ「こ」', 'definition': 'accident'}"),
  (2, "{'kanji': '差', 'wordj': '交「差」点', 'hiragana': 'こう「さ」てん', 'definition': 'intersection'}"),
  (2, "{'kanji': '点', 'wordj': '百「点」', 'hiragana': 'ひゃく「てん」', 'definition': '100 points'}"),
  (2, "{'kanji': '信', 'wordj': '「信」号', 'hiragana': '「しん」ごう', 'definition': 'traffic light'}"),
  (2, "{'kanji': '走', 'wordj': '走る', 'hiragana': 'はしる', 'definition': 'to run'}"),
  (2, "{'kanji': '帰', 'wordj': '帰る', 'hiragana': 'かえる', 'definition': 'return'}"),
  (2, "{'kanji': '横', 'wordj': '横', 'hiragana': 'よこ', 'definition': 'side / horizontal direction'}"),
  (2, "{'kanji': '働', 'wordj': '働く', 'hiragana': 'はたらく', 'definition': 'work'}"),
  (2, "{'kanji': '工', 'wordj': '「工」事中', 'hiragana': '「こう」じちゅう', 'definition': 'under construction'}"),
  (2, "{'kanji': '速', 'wordj': '速い', 'hiragana': 'はやい', 'definition': 'fast'}"),
  (2, "{'kanji': '違', 'wordj': '違う', 'hiragana': 'ちがう', 'definition': 'be different / be mistaken'}"),
  (2, "{'kanji': '反', 'wordj': '「反」対', 'hiragana': '「はん」たい', 'definition': 'against'}");

/* Chapter 2 - Housing Vocabulary */
INSERT INTO cards (deck_id, data)
VALUES
  (3, "{'kanji': '', 'wordj': '居間', 'hiragana': 'いま', 'definition': 'living room'}"),
  (3, "{'kanji': '', 'wordj': 'お手洗い', 'hiragana': 'おてあらい', 'definition': 'restroom'}"),
  (3, "{'kanji': '', 'wordj': '階段', 'hiragana': 'かいだん', 'definition': 'stairway'}"),
  (3, "{'kanji': '', 'wordj': '客間', 'hiragana': 'きゃくま', 'definition': 'sitting room for entertaining guests'}"),
  (3, "{'kanji': '', 'wordj': '応接間', 'hiragana': 'おうせつま', 'definition': 'Western-style room for entertaining guests'}"),
  (3, "{'kanji': '', 'wordj': '玄関', 'hiragana': 'げんかん', 'definition': 'entry hall; foyer'}"),
  (3, "{'kanji': '', 'wordj': '建築家', 'hiragana': 'けんちくか', 'definition': 'architect'}"),
  (3, "{'kanji': '', 'wordj': '住宅', 'hiragana': 'じゅうたく', 'definition': 'residence; housing'}"),
  (3, "{'kanji': '', 'wordj': '寝室', 'hiragana': 'しんしつ', 'definition': 'bedroom'}"),
  (3, "{'kanji': '', 'wordj': '住む', 'hiragana': 'すむ', 'definition': 'to live; to reside'}"),
  (3, "{'kanji': '', 'wordj': '洗面所', 'hiragana': 'せんめんじょ', 'definition': 'washstand'}"),
  (3, "{'kanji': '', 'wordj': '大工', 'hiragana': 'だいく', 'definition': 'carpenter'}"),
  (3, "{'kanji': '', 'wordj': '建てる', 'hiragana': 'たてる', 'definition': 'to build'}"),
  (3, "{'kanji': '', 'wordj': '団地', 'hiragana': 'だんち', 'definition': 'public housing development; apartment complex'}"),
  (3, "{'kanji': '', 'wordj': '天井', 'hiragana': 'てんじょう', 'definition': 'ceiling'}"),
  (3, "{'kanji': '', 'wordj': '戸', 'hiragana': 'と', 'definition': 'door'}"),
  (3, "{'kanji': '', 'wordj': '二階建て', 'hiragana': 'にかいだて', 'definition': 'two-story'}"),
  (3, "{'kanji': '', 'wordj': '日本間/和室', 'hiragana': 'にほんま/わしつ', 'definition': 'Japanese-style room'}"),
  (3, "{'kanji': '', 'wordj': '庭', 'hiragana': 'にわ', 'definition': 'garden; yard'}"),
  (3, "{'kanji': '', 'wordj': '部屋', 'hiragana': 'へや', 'definition': 'room'}"),
  (3, "{'kanji': '', 'wordj': '...間', 'hiragana': '...ま', 'definition': 'counter for rooms'}"),
  (3, "{'kanji': '', 'wordj': '門', 'hiragana': 'もん', 'definition': 'gate'}"),
  (3, "{'kanji': '', 'wordj': '屋根', 'hiragana': 'やね', 'definition': 'roof'}"),
  (3, "{'kanji': '', 'wordj': '床', 'hiragana': 'ゆか', 'definition': 'floor'}"),
  (3, "{'kanji': '', 'wordj': '洋間/洋室', 'hiragana': 'ようま/ようしつ', 'definition': 'Western-style room'}"),
  (3, "{'kanji': '', 'wordj': '浴室', 'hiragana': 'よくしつ', 'definition': 'bathing room (room with bathtub/shower)'}");
