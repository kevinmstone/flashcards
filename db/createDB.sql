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
          (1, "Verbs", "Vocabulary", "Chapter 2"),
          (1, "Transitive Verbs", "Vocabulary", "Chapter 3"),
          (1, "Intransitive Verbs", "Vocabulary", "Chapter 3");

CREATE TABLE cards (
	card_id INTEGER PRIMARY KEY AUTOINCREMENT,
  deck_id INTEGER NOT NULL,
	data BLOB NOT NULL,
  FOREIGN KEY (deck_id)
    REFERENCES decks (user_id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT
);

/* Chapter 2 - Kanji */
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
  (1, "{'kanji': '不', 'wordj': '「不」便', 'hiragana': '「ふ」べん', 'definition': 'inconvenient'}");

/* Chapter 3 - Kanji */
INSERT INTO cards (deck_id, data)
VALUES
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

/* Chapter 2 - Furnishings and Appliances Vocabulary */
INSERT INTO cards (deck_id, data)
VALUES
	(4, "{'kanji': '', 'wordj': 'アイコン', 'hiragana': 'アイコン', 'definition': 'air conditioner'}"),
	(4, "{'kanji': '', 'wordj': '鏡', 'hiragana': 'かがみ', 'definition': 'mirror'}"),
	(4, "{'kanji': '', 'wordj': '家具', 'hiragana': 'かぐ', 'definition': 'furniture'}"),
	(4, "{'kanji': '', 'wordj': 'クーラー', 'hiragana': 'クーラー', 'definition': 'air conditioner'}"),
	(4, "{'kanji': '', 'wordj': '炊飯器', 'hiragana': 'すいはんき', 'definition': 'rice cooker'}"),
	(4, "{'kanji': '', 'wordj': 'スタンド', 'hiragana': 'スタンド', 'definition': 'floor lamp, desk lamp'}"),
	(4, "{'kanji': '', 'wordj': 'ストーブ', 'hiragana': 'ストーブ', 'definition': 'space heater'}"),
	(4, "{'kanji': '', 'wordj': '洗濯機', 'hiragana': 'せんたくき', 'definition': 'washing machine'}"),
	(4, "{'kanji': '', 'wordj': '扇風機', 'hiragana': 'せんぷうき', 'definition': 'electric fan'}"),
	(4, "{'kanji': '', 'wordj': '掃除機', 'hiragana': 'そうじき', 'definition': 'vacuum cleaner'}"),
	(4, "{'kanji': '', 'wordj': 'たんす', 'hiragana': 'たんす', 'definition': 'chest of drawers'}"),
	(4, "{'kanji': '', 'wordj': '電気', 'hiragana': 'でんき', 'definition': 'electic light, electricity'}"),
	(4, "{'kanji': '', 'wordj': '電気製品', 'hiragana': 'でんきせいひん', 'definition': 'electric appliance'}"),
	(4, "{'kanji': '', 'wordj': '電子レンジ', 'hiragana': 'でんしレンジ', 'definition': 'microwave oven'}"),
	(4, "{'kanji': '', 'wordj': '本棚', 'hiragana': 'ほんだな', 'definition': 'bookshelf'}"),
	(4, "{'kanji': '', 'wordj': '留守番電話', 'hiragana': 'るすばんでんわ', 'definition': 'answering machine'}"),
	(4, "{'kanji': '', 'wordj': '冷蔵庫', 'hiragana': 'れいぞうこ', 'definition': 'refrigerator'}");

/* Chapter 2 - Household Chores Vocabulary */
INSERT INTO cards (deck_id, data)
VALUES
	(5, "{'kanji': '', 'wordj': 'アイロンをかける', 'hiragana': 'アイロンをかける', 'definition': 'to iron'}"),
	(5, "{'kanji': '', 'wordj': '家事', 'hiragana': 'かじ', 'definition': 'housework; household chores'}"),
	(5, "{'kanji': '', 'wordj': '片付ける', 'hiragana': 'かたづける', 'definition': 'to straighten (something) up; to clear (something) off'}"),
	(5, "{'kanji': '', 'wordj': '洗濯', 'hiragana': 'せんたく', 'definition': '(to do) laundry'}"),
	(5, "{'kanji': '', 'wordj': '洗濯物', 'hiragana': 'せんたくもの', 'definition': 'laundry (things to be laundered)'}"),
	(5, "{'kanji': '', 'wordj': '掃除（する）', 'hiragana': 'そうじ（する）', 'definition': 'housecleaning (to clean)'}"),
	(5, "{'kanji': '', 'wordj': '直す', 'hiragana': 'なおす', 'definition': 'to mend; repair'}"),
	(5, "{'kanji': '', 'wordj': '庭いじり（する）', 'hiragana': 'にわいじり（する）', 'definition': 'gardening (to do gardening)'}"),
	(5, "{'kanji': '', 'wordj': '縫い物（をする）', 'hiragana': 'ぬいもの（をする）', 'definition': '(to do) sewing'}"),
	(5, "{'kanji': '', 'wordj': '掃く', 'hiragana': 'はく', 'definition': 'to sweep'}"),
	(5, "{'kanji': '', 'wordj': '干す', 'hiragana': '干す', 'definition': 'to air-dry (something); to air (something) out'}"),
	(5, "{'kanji': '', 'wordj': '磨く', 'hiragana': 'みがく', 'definition': 'to polish'}");

/* Chapter 2 - Verbs Vocabulary */
INSERT INTO cards (deck_id, data)
VALUES
	(6, "{'kanji': '', 'wordj': '入れる', 'hiragana': 'いれる', 'definition': 'to turn on (a switch)'}"),
	(6, "{'kanji': '', 'wordj': '動かす', 'hiragana': 'うごかす', 'definition': 'to move (something)'}"),
	(6, "{'kanji': '', 'wordj': '置く', 'hiragana': 'おく', 'definition': 'to put'}"),
	(6, "{'kanji': '', 'wordj': '貸す', 'hiragana': 'かす', 'definition': 'to lend; to rent out'}"),
	(6, "{'kanji': '', 'wordj': '借りる', 'hiragana': 'かりる', 'definition': 'to borrow; to rent from'}"),
	(6, "{'kanji': '', 'wordj': '切る', 'hiragana': 'きる', 'definition': 'to turn off (a switch)'}"),
	(6, "{'kanji': '', 'wordj': '消す', 'hiragana': 'けす', 'definition': 'to turn off (a light)'}"),
	(6, "{'kanji': '', 'wordj': '探す', 'hiragana': 'さがす', 'definition': 'to look for'}"),
	(6, "{'kanji': '', 'wordj': '付ける', 'hiragana': 'つける', 'definition': 'to turn on (a light)'}"),
	(6, "{'kanji': '', 'wordj': '手伝う', 'hiragana': 'てつだう', 'definition': 'to help; to assist'}"),
	(6, "{'kanji': '', 'wordj': '運ぶ', 'hiragana': 'はこぶ', 'definition': 'to transport; to carry (a large object)'}");

/* Chapter 3 - Transitive Verbs Vocabulary */
INSERT INTO cards (deck_id, data)
VALUES
	(7, "{'kanji': '上', 'wordj': '上げる', 'hiragana': 'あげる', 'definition': 'to raise'}"),
	(7, "{'kanji': '開', 'wordj': '開ける', 'hiragana': 'あける', 'definition': 'to open (something)'}"),
	(7, "{'kanji': '集', 'wordj': '集める', 'hiragana': 'あつめる', 'definition': 'to gather (things, people) together; to collect)'}"),
	(7, "{'kanji': '出', 'wordj': '出す', 'hiragana': 'だす', 'definition': 'to put out; to take out'}"),
	(7, "{'kanji': '始', 'wordj': '始める', 'hiragana': 'はじめる', 'definition': 'to begin (something)'}"),
	(7, "{'kanji': '入', 'wordj': '入れる', 'hiragana': 'いれる', 'definition': 'to put in; to insert; to include'}"),
	(7, "{'kanji': '返', 'wordj': '返す', 'hiragana': 'かえす', 'definition': 'to return (something); to give back'}"),
	(7, "{'kanji': '帰', 'wordj': '帰る', 'hiragana': 'かえる', 'definition': 'to return (something); to give back'}"),
	(7, "{'kanji': '', 'wordj': '間違える', 'hiragana': 'まちがえる', 'definition': 'to make a mistake (about something)'}"),
	(7, "{'kanji': '見', 'wordj': '見つける', 'hiragana': 'みつける', 'definition': 'to find'}"),
	(7, "{'kanji': '直', 'wordj': '直す', 'hiragana': 'なおす', 'definition': 'to fix'}"),
	(7, "{'kanji': '残', 'wordj': '残す', 'hiragana': 'のこす', 'definition': 'to leave behind'}"),
	(7, "{'kanji': '落', 'wordj': '落とす', 'hiragana': 'おとす', 'definition': 'to drop (something)'}"),
	(7, "{'kanji': '終', 'wordj': '終わる', 'hiragana': 'おわる', 'definition': 'to end (something)'}"),
	(7, "{'kanji': '終', 'wordj': '終える', 'hiragana': 'おえる', 'definition': 'to end (something)'}"),
	(7, "{'kanji': '下', 'wordj': '下げる', 'hiragana': 'さげる', 'definition': 'to lower (something)'}"),
	(7, "{'kanji': '閉', 'wordj': '閉める', 'hiragana': 'しめる', 'definition': 'to close (something)'}"),
	(7, "{'kanji': '起', 'wordj': '起こす', 'hiragana': 'おこす', 'definition': 'to wake (someone) up'}"),
	(7, "{'kanji': '', 'wordj': 'かける', 'hiragana': 'かける', 'definition': 'to hang (something) on; to lay (something) on (something else)'}"),
	(7, "{'kanji': '付', 'wordj': '付ける', 'hiragana': 'つける', 'definition': 'to attach; to turn (something) on'}"),
	(7, "{'kanji': '消', 'wordj': '消す', 'hiragana': 'けす', 'definition': 'to extinguish; to put out'}"),
	(7, "{'kanji': '並', 'wordj': '並べる', 'hiragana': 'ならべる', 'definition': 'to line (things) up'}"),
	(7, "{'kanji': '止', 'wordj': '止める', 'hiragana': 'とめる', 'definition': 'to stop (something)'}"),
	(7, "{'kanji': '動', 'wordj': '動かす', 'hiragana': 'うごかす', 'definition': 'to set in motion; to move (something)'}"),
	(7, "{'kanji': '乗', 'wordj': '乗せる', 'hiragana': 'のせる', 'definition': 'to put on a vehicle; to give a ride to'}"),
	(7, "{'kanji': '寝', 'wordj': '寝かす', 'hiragana': 'ねかす', 'definition': 'to put to bed'}"),
	(7, "{'kanji': '無', 'wordj': '無くす', 'hiragana': 'なくす', 'definition': 'to lose'}"),
	(7, "{'kanji': '壊', 'wordj': '壊す', 'hiragana': 'こわす', 'definition': 'to break (something)'}"),
	(7, "{'kanji': '立', 'wordj': '立てる', 'hiragana': 'たてる', 'definition': 'to erect; to build'}"),
	(7, "{'kanji': '建', 'wordj': '建てる', 'hiragana': 'たてる', 'definition': 'to erect; to build'}"),
	(7, "{'kanji': '通', 'wordj': '通す', 'hiragana': 'とおす', 'definition': 'to send through; to allow to pass through'}"),
	(7, "{'kanji': '回', 'wordj': '回す', 'hiragana': 'まわす', 'definition': 'to turn (something); to send around'}"),
	(7, "{'kanji': '切', 'wordj': '切る', 'hiragana': 'きる', 'definition': 'to cut'}"),
	(7, "{'kanji': '切', 'wordj': '切らす', 'hiragana': 'きらす', 'definition': 'to run out of; to use up'}"),
	(7, "{'kanji': '変', 'wordj': '変える', 'hiragana': 'かえる', 'definition': 'to change (something)'}");

/* Chapter 3 - Intransitive Verbs Vocabulary */
INSERT INTO cards (deck_id, data)
VALUES
  (8, "{'kanji': '上', 'wordj': '上がる', 'hiragana': 'あがる', 'definition': 'to rise; to go up'}"),
  (8, "{'kanji': '開', 'wordj': '開く', 'hiragana': 'あく', 'definition': 'to open (by itself)'}"),
  (8, "{'kanji': '集', 'wordj': '集まる', 'hiragana': '集まる', 'definition': 'to gather together; to congregate'}"),
  (8, "{'kanji': '出', 'wordj': '出る', 'hiragana': 'でる', 'definition': 'to come/go out; to appear'}"),
  (8, "{'kanji': '始', 'wordj': '始まる', 'hiragana': 'はじまる', 'definition': 'to begin'}"),
  (8, "{'kanji': '入', 'wordj': '入る', 'hiragana': 'はいる', 'definition': 'to enter; to be included; to fit inside'}"),
  (8, "{'kanji': '返', 'wordj': '返る', 'hiragana': 'かえる', 'definition': 'to return (home); to come back'}"),
  (8, "{'kanji': '帰', 'wordj': '帰る', 'hiragana': 'かえる', 'definition': 'to return (home); to come back'}"),
  (8, "{'kanji': '', 'wordj': '間違う', 'hiragana': 'まちがう', 'definition': 'to be in error'}"),
  (8, "{'kanji': '見', 'wordj': '見たかる', 'hiragana': 'みつかる', 'definition': 'to be found'}"),
  (8, "{'kanji': '直', 'wordj': '直る', 'hiragana': 'なおる', 'definition': 'to get better'}"),
  (8, "{'kanji': '残', 'wordj': '残る', 'hiragana': 'のこる', 'definition': 'to be left; to remain'}"),
  (8, "{'kanji': '落', 'wordj': '落ちる', 'hiragana': 'おちる', 'definition': 'to fall (from a height)'}"),
  (8, "{'kanji': '終', 'wordj': '終わる', 'hiragana': 'おわる', 'definition': 'to (come to an) end'}"),
  (8, "{'kanji': '下', 'wordj': '下がる', 'hiragana': 'さがる', 'definition': 'to go down; to dangle'}"),
  (8, "{'kanji': '閉', 'wordj': '閉まる', 'hiragana': 'しまる', 'definition': 'to close'}"),
  (8, "{'kanji': '起', 'wordj': '起きる', 'hiragana': 'おきる', 'definition': 'to wake up'}"),
  (8, "{'kanji': '', 'wordj': 'かかる', 'hiragana': 'かかる', 'definition': 'to hang (on a vertical surface); to lean; to take (time, money, etc)'}"),
  (8, "{'kanji': '付', 'wordj': '付く', 'hiragana': 'つく', 'definition': 'to stick; to become attached; to go on'}"),
  (8, "{'kanji': '消', 'wordj': '消える', 'hiragana': 'きえる', 'definition': 'to be extinguised; to go off; to disappear'}"),
  (8, "{'kanji': '並', 'wordj': '並ぶ', 'hiragana': 'ならぶ', 'definition': 'to get in line'}"),
  (8, "{'kanji': '止', 'wordj': '止まる', 'hiragana': 'とまる', 'definition': 'to come to a stop'}"),
  (8, "{'kanji': '動', 'wordj': '動く', 'hiragana': 'うごく', 'definition': 'to move; to be in motion'}"),
  (8, "{'kanji': '乗', 'wordj': '乗る', 'hiragana': 'のる', 'definition': 'to board a vehicle; to ride'}"),
  (8, "{'kanji': '寝', 'wordj': '寝る', 'hiragana': 'ねる', 'definition': 'to go to bed; to sleep'}"),
  (8, "{'kanji': '無', 'wordj': '無くなる', 'hiragana': 'なくなる', 'definition': 'to get lost; to disappear'}"),
  (8, "{'kanji': '壊', 'wordj': '壊れる', 'hiragana': 'こわれる', 'definition': 'to become broken'}"),
  (8, "{'kanji': '立', 'wordj': '立つ', 'hiragana': 'たつ', 'definition': 'to stand; to be built'}"),
  (8, "{'kanji': '建', 'wordj': '建つ', 'hiragana': 'たつ', 'definition': 'to stand; to be built'}"),
  (8, "{'kanji': '通', 'wordj': '通る', 'hiragana': 'とおる', 'definition': 'to pass through; to go along (a road)'}"),
  (8, "{'kanji': '回', 'wordj': '回る', 'hiragana': 'まわる', 'definition': 'to turn around; to go around'}"),
  (8, "{'kanji': '切', 'wordj': '切れる', 'hiragana': 'きれる', 'definition': 'to be cut; to be used up'}"),
  (8, "{'kanji': '変', 'wordj': '変わる', 'hiragana': 'かわる', 'definition': 'to (undergo) change'}");
