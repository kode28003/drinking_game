// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:drinking_game/custom_code/actions/show_interstitial_ad_custom.dart'
    as actions;
import 'dart:math';

class Minority extends StatefulWidget {
  const Minority({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Minority> createState() => _MinorityState();
}

class _MinorityState extends State<Minority> {
  // final Map<String, dynamic> localizedStrings = {
  //   'ja': {
  //     'title': '多数決ゲーム',
  //     'newQuestionButton': '新しい質問',
  //     'showCommandButton': '飲むのはどっち？',
  //     'nextQuestionButton': '次の問題へ',
  //     'message': {
  //       'initial': '「新しい質問」ボタンを押してゲームを開始してください。',
  //       'chooseAnswer': '質問に答えてください。',
  //       'readyForCommand': '準備ができました。「飲むのはどっち？」ボタンを押してください。',
  //       'majorityDrinks': '多数派が飲みます！',
  //       'minorityDrinks': '少数派が飲みます！',
  //     },
  //     'genreSelector': 'ジャンル',
  //     'genres': {
  //       'all': 'すべて',
  //       'travel': '旅行',
  //       'food': '食べ物',
  //       'hobbies': '趣味',
  //       'tech': 'テクノロジー',
  //     },
  //     'questions': {
  //       'all': [
  //         {'question': '旅行するなら、海派？山派？'},
  //         {'question': 'ペットを飼うなら、犬派？猫派？'},
  //         {'question': '朝食は、パン派？ご飯派？'},
  //         {'question': '休日は、アクティブに過ごしたい？家でゆっくりしたい？'},
  //         {'question': 'スマホのOSは、iOS派？Android派？'},
  //         {'question': 'ラーメンは味噌？醤油？'},
  //         {'question': '飛行機は窓側？通路側？'},
  //         {'question': '漫画は単行本派？電子書籍派？'},
  //         {'question': 'PCはWindows？Mac？'},
  //         {'question': 'SNSは見る専門？投稿する専門？'},
  //       ],
  //       'travel': [
  //         {'question': '旅行するなら、海派？山派？'},
  //         {'question': '飛行機は窓側？通路側？'},
  //         {'question': '旅先で、計画通りに行動する？行き当たりばったり？'},
  //         {'question': '海外旅行に持っていくなら、現金？カード？'},
  //         {'question': 'ホテルの部屋は、景色重視？快適性重視？'},
  //         {'question': '旅行のお土産は、食べ物？雑貨？'},
  //         {'question': '旅行は一人で行く？みんなで行く？'},
  //         {'question': '旅行は国内？海外？'},
  //         {'question': '旅行の写真は、たくさん撮る？思い出に残すだけ？'},
  //         {'question': '旅の途中で道に迷ったら、すぐに聞く？自力で解決する？'},
  //       ],
  //       'food': [
  //         {'question': '朝食は、パン派？ご飯派？'},
  //         {'question': 'ラーメンは味噌？醤油？'},
  //         {'question': 'お寿司で、好きなのはマグロ？サーモン？'},
  //         {'question': 'カレーは甘口？辛口？'},
  //         {'question': '焼肉で最初に食べるのは、牛タン？カルビ？'},
  //         {'question': 'お鍋に入れるのは、マロニー？春雨？'},
  //         {'question': 'パスタはトマトソース？クリームソース？'},
  //         {'question': '目玉焼きにかけるのは、醤油？ソース？'},
  //         {'question': 'デザートは、和菓子？洋菓子？'},
  //         {'question': 'コーヒーはブラック？ミルク入り？'},
  //       ],
  //       'hobbies': [
  //         {'question': '休日は、アクティブに過ごしたい？家でゆっくりしたい？'},
  //         {'question': '漫画は単行本派？電子書籍派？'},
  //         {'question': 'カラオケは歌う専門？聴く専門？'},
  //         {'question': 'ゲームは、据え置き型？携帯型？'},
  //         {'question': '音楽を聴くなら、イヤホン？スピーカー？'},
  //         {'question': '映画は映画館で見る？家で見る？'},
  //         {'question': '休日の朝は、早起き？寝坊？'},
  //         {'question': '読書は紙の本？電子書籍？'},
  //         {'question': '運動するなら、チームスポーツ？個人競技？'},
  //         {'question': '新しい趣味を見つけるのは、得意？苦手？'},
  //       ],
  //       'tech': [
  //         {'question': 'スマホのOSは、iOS派？Android派？'},
  //         {'question': 'PCはWindows？Mac？'},
  //         {'question': 'SNSは見る専門？投稿する専門？'},
  //         {'question': '新しいガジェットは、すぐに買う？しばらく様子を見る？'},
  //         {'question': 'デジタル派？アナログ派？'},
  //         {'question': 'AIは、便利だと思う？少し怖いと思う？'},
  //         {'question': 'スマートスピーカーは使う？使わない？'},
  //         {'question': 'タイピングは、フリック入力？ローマ字入力？'},
  //         {'question': 'ウェブサイトは、アプリで見る？ブラウザで見る？'},
  //         {'question': 'データはクラウドに保存？ローカルに保存？'},
  //       ],
  //     },
  //   },
  //   'en': {
  //     'title': 'Minority Game',
  //     'newQuestionButton': 'New Question',
  //     'showCommandButton': 'Who Drinks?',
  //     'nextQuestionButton': 'Next Question',
  //     'message': {
  //       'initial': 'Press "New Question" to start the game.',
  //       'chooseAnswer': 'Answer the question.',
  //       'readyForCommand': 'Ready. Press "Who Drinks?" button.',
  //       'majorityDrinks': 'The majority drinks!',
  //       'minorityDrinks': 'The minority drinks!',
  //     },
  //     'genreSelector': 'Genre',
  //     'genres': {
  //       'all': 'All',
  //       'travel': 'Travel',
  //       'food': 'Food',
  //       'hobbies': 'Hobbies',
  //       'tech': 'Tech',
  //     },
  //     'questions': {
  //       'all': [
  //         {'question': 'Beach person or mountain person?'},
  //         {'question': 'Dog person or cat person?'},
  //         {'question': 'Bread or rice for breakfast?'},
  //         {'question': 'Active or relaxed on your day off?'},
  //         {'question': 'iOS or Android?'},
  //         {'question': 'Miso or Shoyu ramen?'},
  //         {'question': 'Window or aisle seat on a plane?'},
  //         {'question': 'Physical manga or digital?'},
  //         {'question': 'Windows or Mac PC?'},
  //         {'question': 'SNS lurker or poster?'},
  //       ],
  //       'travel': [
  //         {'question': 'Beach person or mountain person?'},
  //         {'question': 'Window or aisle seat on a plane?'},
  //         {'question': 'Planned itinerary or spontaneous trip?'},
  //         {'question': 'Cash or card when traveling abroad?'},
  //         {'question': 'Hotel view or comfort?'},
  //         {'question': 'Food or souvenirs when traveling?'},
  //         {'question': 'Travel alone or with friends?'},
  //         {'question': 'Domestic or international travel?'},
  //         {'question': 'Take lots of photos or just make memories?'},
  //         {'question': 'Ask for directions or navigate on your own?'},
  //       ],
  //       'food': [
  //         {'question': 'Bread or rice for breakfast?'},
  //         {'question': 'Miso or Shoyu ramen?'},
  //         {'question': 'Tuna or salmon for sushi?'},
  //         {'question': 'Mild or spicy curry?'},
  //         {'question': 'Beef tongue or kalbi first at yakiniku?'},
  //         {'question': 'Malony or harasame noodles in hot pot?'},
  //         {'question': 'Tomato sauce or cream sauce pasta?'},
  //         {'question': 'Soy sauce or sauce on fried eggs?'},
  //         {'question': 'Wagashi or Western sweets?'},
  //         {'question': 'Black coffee or with milk?'},
  //       ],
  //       'hobbies': [
  //         {'question': 'Active or relaxed on your day off?'},
  //         {'question': 'Physical manga or digital?'},
  //         {'question': 'Karaoke singer or listener?'},
  //         {'question': 'Console or handheld games?'},
  //         {'question': 'Headphones or speakers for music?'},
  //         {'question': 'Watch movies at the theater or at home?'},
  //         {'question': 'Early bird or sleepyhead on weekends?'},
  //         {'question': 'Paper books or e-books?'},
  //         {'question': 'Team sports or solo sports?'},
  //         {'question': 'Good at finding new hobbies or not?'},
  //       ],
  //       'tech': [
  //         {'question': 'iOS or Android?'},
  //         {'question': 'Windows or Mac PC?'},
  //         {'question': 'SNS lurker or poster?'},
  //         {'question': 'Buy new gadgets immediately or wait?'},
  //         {'question': 'Digital or analog?'},
  //         {'question': 'Think AI is convenient or a bit scary?'},
  //         {'question': 'Use a smart speaker or not?'},
  //         {'question': 'Flick input or Romanji input for typing?'},
  //         {'question': 'View websites on apps or browsers?'},
  //         {'question': 'Save data to the cloud or locally?'},
  //       ],
  //     },
  //   },
  // };
  final Map<String, dynamic> localizedStrings = {
    'ja': {
      'title': '多数決ゲーム',
      'newQuestionButton': '新しい質問',
      'showCommandButton': '飲むのはどっち？',
      'nextQuestionButton': '次の問題へ',
      'message': {
        'initial': '「新しい質問」ボタンを押してゲームを開始してください。',
        'chooseAnswer': '質問に答えてください。',
        'readyForCommand': '準備ができました。「飲むのはどっち？」ボタンを押してください。',
        'majorityDrinks': '多数派が飲みます！',
        'minorityDrinks': '少数派が飲みます！',
      },
      'genreSelector': 'ジャンル',
      'genres': {
        'all': 'すべて',
        'travel': '旅行',
        'food': '食べ物',
        'hobbies': '趣味',
        'tech': 'テクノロジー',
      },
      'questions': {
        'all': [
          {'question': '旅行するなら、海派？山派？'},
          {'question': 'ペットを飼うなら、犬派？猫派？'},
          {'question': '朝食は、パン派？ご飯派？'},
          {'question': '休日は、アクティブに過ごしたい？家でゆっくりしたい？'},
          {'question': 'スマホのOSは、iOS派？Android派？'},
          {'question': 'ラーメンは味噌？醤油？'},
          {'question': '飛行機は窓側？通路側？'},
          {'question': '漫画は単行本派？電子書籍派？'},
          {'question': 'PCはWindows？Mac？'},
          {'question': 'SNSは見る専門？投稿する専門？'},
        ],
        'travel': [
          {'question': '旅行するなら、海派？山派？'},
          {'question': '飛行機は窓側？通路側？'},
          {'question': '旅先で、計画通りに行動する？行き当たりばったり？'},
          {'question': '海外旅行に持っていくなら、現金？カード？'},
          {'question': 'ホテルの部屋は、景色重視？快適性重視？'},
          {'question': '旅行のお土産は、食べ物？雑貨？'},
          {'question': '旅行は一人で行く？みんなで行く？'},
          {'question': '旅行は国内？海外？'},
          {'question': '旅行の写真は、たくさん撮る？思い出に残すだけ？'},
          {'question': '旅の途中で道に迷ったら、すぐに聞く？自力で解決する？'},
        ],
        'food': [
          {'question': '朝食は、パン派？ご飯派？'},
          {'question': 'ラーメンは味噌？醤油？'},
          {'question': 'お寿司で、好きなのはマグロ？サーモン？'},
          {'question': 'カレーは甘口？辛口？'},
          {'question': '焼肉で最初に食べるのは、牛タン？カルビ？'},
          {'question': 'お鍋に入れるのは、マロニー？春雨？'},
          {'question': 'パスタはトマトソース？クリームソース？'},
          {'question': '目玉焼きにかけるのは、醤油？ソース？'},
          {'question': 'デザートは、和菓子？洋菓子？'},
          {'question': 'コーヒーはブラック？ミルク入り？'},
        ],
        'hobbies': [
          {'question': '休日は、アクティブに過ごしたい？家でゆっくりしたい？'},
          {'question': '漫画は単行本派？電子書籍派？'},
          {'question': 'カラオケは歌う専門？聴く専門？'},
          {'question': 'ゲームは、据え置き型？携帯型？'},
          {'question': '音楽を聴くなら、イヤホン？スピーカー？'},
          {'question': '映画は映画館で見る？家で見る？'},
          {'question': '休日の朝は、早起き？寝坊？'},
          {'question': '読書は紙の本？電子書籍？'},
          {'question': '運動するなら、チームスポーツ？個人競技？'},
          {'question': '新しい趣味を見つけるのは、得意？苦手？'},
        ],
        'tech': [
          {'question': 'スマホのOSは、iOS派？Android派？'},
          {'question': 'PCはWindows？Mac？'},
          {'question': 'SNSは見る専門？投稿する専門？'},
          {'question': '新しいガジェットは、すぐに買う？しばらく様子を見る？'},
          {'question': 'デジタル派？アナログ派？'},
          {'question': 'AIは、便利だと思う？少し怖いと思う？'},
          {'question': 'スマートスピーカーは使う？使わない？'},
          {'question': 'タイピングは、フリック入力？ローマ字入力？'},
          {'question': 'ウェブサイトは、アプリで見る？ブラウザで見る？'},
          {'question': 'データはクラウドに保存？ローカルに保存？'},
        ],
      }
    },
    'ms': {
      'title': 'Permainan Majoriti',
      'newQuestionButton': 'Soalan Baru',
      'showCommandButton': 'Siapa Minum?',
      'nextQuestionButton': 'Soalan Seterusnya',
      'message': {
        'initial': 'Tekan butang "Soalan Baru" untuk memulakan permainan.',
        'chooseAnswer': 'Jawab soalan.',
        'readyForCommand': 'Bersedia. Tekan butang "Siapa Minum?".',
        'majorityDrinks': 'Majoriti yang minum!',
        'minorityDrinks': 'Minoriti yang minum!',
      },
      'genreSelector': 'Genre',
      'genres': {
        'all': 'Semua',
        'travel': 'Perjalanan',
        'food': 'Makanan',
        'hobbies': 'Hobi',
        'tech': 'Teknologi',
      },
      'questions': {
        'all': [
          {'question': 'Jika melancong, pantai atau gunung?'},
          {
            'question': 'Jika memelihara haiwan peliharaan, anjing atau kucing?'
          },
          {'question': 'Sarapan, roti atau nasi?'},
          {'question': 'Hari cuti, aktif atau berehat di rumah?'},
          {'question': 'OS telefon, iOS atau Android?'},
          {'question': 'Ramen, miso atau shoyu?'},
          {
            'question':
                'Tempat duduk di kapal terbang, tepi tingkap atau lorong?'
          },
          {'question': 'Manga, cetakan atau digital?'},
          {'question': 'PC, Windows atau Mac?'},
          {'question': 'SNS, hanya melihat atau aktif menulis?'},
        ],
        'travel': [
          {'question': 'Jika melancong, pantai atau gunung?'},
          {
            'question':
                'Tempat duduk di kapal terbang, tepi tingkap atau lorong?'
          },
          {'question': 'Perjalanan ikut rancangan atau spontan?'},
          {'question': 'Bawa tunai atau kad bila melancong ke luar negara?'},
          {'question': 'Bilik hotel, pemandangan atau keselesaan?'},
          {'question': 'Ole-ole, makanan atau cenderahati?'},
          {'question': 'Melancong seorang diri atau bersama kawan?'},
          {'question': 'Perjalanan dalam negara atau luar negara?'},
          {'question': 'Ambil banyak gambar atau simpan kenangan sahaja?'},
          {'question': 'Sesat di jalan, tanya orang atau cari sendiri?'},
        ],
        'food': [
          {'question': 'Sarapan, roti atau nasi?'},
          {'question': 'Ramen, miso atau shoyu?'},
          {'question': 'Sushi, tuna atau salmon?'},
          {'question': 'Kari, manis atau pedas?'},
          {'question': 'Yakiniku, mula dengan lidah lembu atau kalbi?'},
          {'question': 'Dalam hotpot, malony atau harasame?'},
          {'question': 'Pasta, sos tomato atau sos krim?'},
          {'question': 'Telur goreng, sos soya atau sos lain?'},
          {'question': 'Pencuci mulut, manisan Jepun atau Barat?'},
          {'question': 'Kopi, hitam atau dengan susu?'},
        ],
        'hobbies': [
          {'question': 'Hari cuti, aktif atau berehat di rumah?'},
          {'question': 'Manga, cetakan atau digital?'},
          {'question': 'Karaoke, menyanyi atau mendengar?'},
          {'question': 'Permainan, konsol atau mudah alih?'},
          {'question': 'Mendengar muzik, fon telinga atau pembesar suara?'},
          {'question': 'Tonton filem di pawagam atau di rumah?'},
          {'question': 'Pagi hari cuti, bangun awal atau tidur lama?'},
          {'question': 'Membaca, buku fizikal atau e-book?'},
          {'question': 'Bersenam, sukan berkumpulan atau individu?'},
          {'question': 'Mencari hobi baru, pandai atau tidak pandai?'},
        ],
        'tech': [
          {'question': 'OS telefon, iOS atau Android?'},
          {'question': 'PC, Windows atau Mac?'},
          {'question': 'SNS, hanya melihat atau aktif menulis?'},
          {'question': 'Alat baru, beli terus atau tunggu sebentar?'},
          {'question': 'Digital atau analog?'},
          {'question': 'AI, berguna atau agak menakutkan?'},
          {'question': 'Gunakan pembesar suara pintar atau tidak?'},
          {'question': 'Taip, input geseran atau huruf Rom?'},
          {'question': 'Lihat laman web melalui app atau pelayar?'},
          {'question': 'Simpan data di awan atau tempatan?'},
        ],
      },
    },
    'en': {
      'title': 'Minority Game',
      'newQuestionButton': 'New Question',
      'showCommandButton': 'Who Drinks?',
      'nextQuestionButton': 'Next Question',
      'message': {
        'initial': 'Press "New Question" to start the game.',
        'chooseAnswer': 'Answer the question.',
        'readyForCommand': 'Ready. Press "Who Drinks?" button.',
        'majorityDrinks': 'The majority drinks!',
        'minorityDrinks': 'The minority drinks!',
      },
      'genreSelector': 'Genre',
      'genres': {
        'all': 'All',
        'travel': 'Travel',
        'food': 'Food',
        'hobbies': 'Hobbies',
        'tech': 'Tech',
      },
      'questions': {
        'all': [
          {'question': 'Beach person or mountain person?'},
          {'question': 'Dog person or cat person?'},
          {'question': 'Bread or rice for breakfast?'},
          {'question': 'Active or relaxed on your day off?'},
          {'question': 'iOS or Android?'},
          {'question': 'Miso or Shoyu ramen?'},
          {'question': 'Window or aisle seat on a plane?'},
          {'question': 'Physical manga or digital?'},
          {'question': 'Windows or Mac PC?'},
          {'question': 'SNS lurker or poster?'},
        ],
        'travel': [
          {'question': 'Beach person or mountain person?'},
          {'question': 'Window or aisle seat on a plane?'},
          {'question': 'Planned itinerary or spontaneous trip?'},
          {'question': 'Cash or card when traveling abroad?'},
          {'question': 'Hotel view or comfort?'},
          {'question': 'Food or souvenirs when traveling?'},
          {'question': 'Travel alone or with friends?'},
          {'question': 'Domestic or international travel?'},
          {'question': 'Take lots of photos or just make memories?'},
          {'question': 'Ask for directions or navigate on your own?'},
        ],
        'food': [
          {'question': 'Bread or rice for breakfast?'},
          {'question': 'Miso or Shoyu ramen?'},
          {'question': 'Tuna or salmon for sushi?'},
          {'question': 'Mild or spicy curry?'},
          {'question': 'Beef tongue or kalbi first at yakiniku?'},
          {'question': 'Malony or harasame noodles in hot pot?'},
          {'question': 'Tomato sauce or cream sauce pasta?'},
          {'question': 'Soy sauce or sauce on fried eggs?'},
          {'question': 'Wagashi or Western sweets?'},
          {'question': 'Black coffee or with milk?'},
        ],
        'hobbies': [
          {'question': 'Active or relaxed on your day off?'},
          {'question': 'Physical manga or digital?'},
          {'question': 'Karaoke singer or listener?'},
          {'question': 'Console or handheld games?'},
          {'question': 'Headphones or speakers for music?'},
          {'question': 'Watch movies at the theater or at home?'},
          {'question': 'Early bird or sleepyhead on weekends?'},
          {'question': 'Paper books or e-books?'},
          {'question': 'Team sports or solo sports?'},
          {'question': 'Good at finding new hobbies or not?'},
        ],
        'tech': [
          {'question': 'iOS or Android?'},
          {'question': 'Windows or Mac PC?'},
          {'question': 'SNS lurker or poster?'},
          {'question': 'Buy new gadgets immediately or wait?'},
          {'question': 'Digital or analog?'},
          {'question': 'Think AI is convenient or a bit scary?'},
          {'question': 'Use a smart speaker or not?'},
          {'question': 'Flick input or Romanji input for typing?'},
          {'question': 'View websites on apps or browsers?'},
          {'question': 'Save data to the cloud or locally?'},
        ],
      }
    },
    'de': {
      'title': 'Mehrheits-Spiel',
      'newQuestionButton': 'Neue Frage',
      'showCommandButton': 'Wer trinkt?',
      'nextQuestionButton': 'Nächste Frage',
      'message': {
        'initial': 'Drücke "Neue Frage", um das Spiel zu starten.',
        'chooseAnswer': 'Beantworte die Frage.',
        'readyForCommand': 'Bereit. Drücke den "Wer trinkt?"-Knopf.',
        'majorityDrinks': 'Die Mehrheit trinkt!',
        'minorityDrinks': 'Die Minderheit trinkt!',
      },
      'genreSelector': 'Kategorie',
      'genres': {
        'all': 'Alle',
        'travel': 'Reisen',
        'food': 'Essen',
        'hobbies': 'Hobbys',
        'tech': 'Technik',
      },
      'questions': {
        'all': [
          {'question': 'Meer- oder Bergperson?'},
          {'question': 'Hund- oder Katzenliebhaber?'},
          {'question': 'Brot oder Reis zum Frühstück?'},
          {'question': 'Aktiv oder entspannt am freien Tag?'},
          {'question': 'iOS oder Android?'},
          {'question': 'Miso- oder Shoyu-Ramen?'},
          {'question': 'Fenster- oder Gangplatz im Flugzeug?'},
          {'question': 'Gedrucktes Manga oder digital?'},
          {'question': 'Windows- oder Mac-PC?'},
          {'question': 'Nur lesen oder posten auf SNS?'},
        ],
        'travel': [
          {'question': 'Meer- oder Bergperson?'},
          {'question': 'Fenster- oder Gangplatz im Flugzeug?'},
          {'question': 'Geplanter Ablauf oder spontane Reise?'},
          {'question': 'Bargeld oder Karte im Ausland?'},
          {'question': 'Hotelzimmer: Aussicht oder Komfort?'},
          {'question': 'Souvenirs: Essen oder Andenken?'},
          {'question': 'Alleine oder mit Freunden reisen?'},
          {'question': 'Inland oder Ausland?'},
          {'question': 'Viele Fotos machen oder nur Erinnerungen speichern?'},
          {'question': 'Weg fragen oder selbst navigieren?'},
        ],
        'food': [
          {'question': 'Brot oder Reis zum Frühstück?'},
          {'question': 'Miso- oder Shoyu-Ramen?'},
          {'question': 'Thunfisch oder Lachs für Sushi?'},
          {'question': 'Mild oder scharfes Curry?'},
          {'question': 'Zuerst Rinderzunge oder Kalbi beim Yakiniku?'},
          {'question': 'Malony oder Harasame im Hotpot?'},
          {'question': 'Tomatensauce oder Sahnesauce für Pasta?'},
          {'question': 'Sojasauce oder Sauce auf Spiegelei?'},
          {'question': 'Japanische oder westliche Süßigkeiten?'},
          {'question': 'Schwarzer Kaffee oder mit Milch?'},
        ],
        'hobbies': [
          {'question': 'Aktiv oder entspannt am freien Tag?'},
          {'question': 'Gedrucktes Manga oder digital?'},
          {'question': 'Karaoke: Singen oder zuhören?'},
          {'question': 'Konsole oder Handheld-Spiele?'},
          {'question': 'Kopfhörer oder Lautsprecher?'},
          {'question': 'Kino oder zu Hause Filme schauen?'},
          {'question': 'Frühaufsteher oder Langschläfer am Wochenende?'},
          {'question': 'Papierbücher oder E-Books?'},
          {'question': 'Teamsport oder Einzelsport?'},
          {'question': 'Gut neue Hobbys finden oder nicht?'},
        ],
        'tech': [
          {'question': 'iOS oder Android?'},
          {'question': 'Windows oder Mac-PC?'},
          {'question': 'Nur lesen oder posten auf SNS?'},
          {'question': 'Neue Gadgets sofort kaufen oder abwarten?'},
          {'question': 'Digital oder analog?'},
          {'question': 'AI praktisch oder ein bisschen unheimlich?'},
          {'question': 'Smart Speaker benutzen oder nicht?'},
          {'question': 'Flick-Eingabe oder Romanji-Eingabe beim Tippen?'},
          {'question': 'Webseiten in Apps oder Browser ansehen?'},
          {'question': 'Daten in der Cloud oder lokal speichern?'},
        ],
      }
    },
    'ru': {
      'title': 'Игра большинства',
      'newQuestionButton': 'Новый вопрос',
      'showCommandButton': 'Кто пьёт?',
      'nextQuestionButton': 'Следующий вопрос',
      'message': {
        'initial': 'Нажмите "Новый вопрос", чтобы начать игру.',
        'chooseAnswer': 'Ответьте на вопрос.',
        'readyForCommand': 'Готово. Нажмите кнопку "Кто пьёт?".',
        'majorityDrinks': 'Большинство пьёт!',
        'minorityDrinks': 'Меньшинство пьёт!',
      },
      'genreSelector': 'Жанр',
      'genres': {
        'all': 'Все',
        'travel': 'Путешествия',
        'food': 'Еда',
        'hobbies': 'Хобби',
        'tech': 'Технологии',
      },
      'questions': {
        'all': [
          {'question': 'Любите море или горы?'},
          {'question': 'Собака или кошка?'},
          {'question': 'Хлеб или рис на завтрак?'},
          {'question': 'Активный или спокойный отдых?'},
          {'question': 'iOS или Android?'},
          {'question': 'Рамен мисо или шою?'},
          {'question': 'Место у окна или у прохода в самолёте?'},
          {'question': 'Печатные манга или электронные?'},
          {'question': 'Windows или Mac?'},
          {'question': 'Просто читать SNS или публиковать?'},
        ],
        'travel': [
          {'question': 'Любите море или горы?'},
          {'question': 'Место у окна или у прохода в самолёте?'},
          {'question': 'Следовать плану или спонтанно путешествовать?'},
          {'question': 'Наличные или карта за границей?'},
          {'question': 'Комфорт или вид из окна в отеле?'},
          {'question': 'Сувениры: еда или предметы?'},
          {'question': 'Путешествовать одному или с друзьями?'},
          {'question': 'Внутри страны или за границу?'},
          {'question': 'Много фотографий или просто воспоминания?'},
          {'question': 'Спросить дорогу или найти самостоятельно?'},
        ],
        'food': [
          {'question': 'Хлеб или рис на завтрак?'},
          {'question': 'Рамен мисо или шою?'},
          {'question': 'Тунец или лосось для суши?'},
          {'question': 'Сладкое или острое карри?'},
          {'question': 'Сначала говяжий язык или карби?'},
          {'question': 'Макароны Malony или Harasame в горячем горшке?'},
          {'question': 'Соус томатный или сливочный для пасты?'},
          {'question': 'Соевый соус или соус на яичнице?'},
          {'question': 'Японские или западные сладости?'},
          {'question': 'Черный кофе или с молоком?'},
        ],
        'hobbies': [
          {'question': 'Активный или спокойный отдых?'},
          {'question': 'Печатные манга или электронные?'},
          {'question': 'Караоке: петь или слушать?'},
          {'question': 'Консоль или портативные игры?'},
          {'question': 'Наушники или колонки для музыки?'},
          {'question': 'Смотреть фильмы в кино или дома?'},
          {'question': 'Ранний подъём или сон на выходных?'},
          {'question': 'Книжные или электронные книги?'},
          {'question': 'Командные или индивидуальные виды спорта?'},
          {'question': 'Легко находить новые хобби или нет?'},
        ],
        'tech': [
          {'question': 'iOS или Android?'},
          {'question': 'Windows или Mac?'},
          {'question': 'Просто читать SNS или публиковать?'},
          {'question': 'Покупать гаджеты сразу или ждать?'},
          {'question': 'Цифровой или аналоговый?'},
          {'question': 'AI удобен или немного страшен?'},
          {'question': 'Использовать умную колонку или нет?'},
          {'question': 'Ввод с помощью жестов или Романжи?'},
          {'question': 'Сайты через приложение или браузер?'},
          {'question': 'Сохранять данные в облаке или локально?'},
        ],
      }
    },
    'ko': {
      'title': '다수결 게임',
      'newQuestionButton': '새 질문',
      'showCommandButton': '누가 마셔?',
      'nextQuestionButton': '다음 질문',
      'message': {
        'initial': '"새 질문"을 눌러 게임을 시작하세요.',
        'chooseAnswer': '질문에 답해주세요.',
        'readyForCommand': '준비 완료! "누가 마셔?" 버튼을 누르세요.',
        'majorityDrinks': '다수파가 마셔요!',
        'minorityDrinks': '소수파가 마셔요!',
      },
      'genreSelector': '장르',
      'genres': {
        'all': '전체',
        'travel': '여행',
        'food': '음식',
        'hobbies': '취미',
        'tech': '기술',
      },
      'questions': {
        'all': [
          {'question': '바다 vs 산?'},
          {'question': '강아지 vs 고양이?'},
          {'question': '아침은 빵 vs 밥?'},
          {'question': '활동적인 휴식 vs 느긋한 휴식?'},
          {'question': 'iOS vs Android?'},
          {'question': '라멘은 미소 vs 쇼유?'},
          {'question': '비행기 좌석은 창가 vs 통로?'},
          {'question': '만화책은 종이책 vs 전자책?'},
          {'question': 'Windows vs Mac?'},
          {'question': 'SNS는 보기만 vs 직접 올리기?'},
        ],
        'travel': [
          {'question': '바다 vs 산?'},
          {'question': '비행기 좌석은 창가 vs 통로?'},
          {'question': '계획 여행 vs 즉흥 여행?'},
          {'question': '해외에서는 현금 vs 카드?'},
          {'question': '호텔은 편안함 vs 전망?'},
          {'question': '기념품은 먹을 것 vs 물건?'},
          {'question': '혼자 여행 vs 친구와 여행?'},
          {'question': '국내 여행 vs 해외 여행?'},
          {'question': '사진 많이 vs 추억만?'},
          {'question': '길 묻기 vs 스스로 찾기?'},
        ],
        'food': [
          {'question': '아침은 빵 vs 밥?'},
          {'question': '라멘은 미소 vs 쇼유?'},
          {'question': '초밥은 참치 vs 연어?'},
          {'question': '카레는 달콤 vs 매콤?'},
          {'question': '고기는 혀고기 먼저 vs 갈비 먼저?'},
          {'question': '전골에는 당면 vs 실당면?'},
          {'question': '파스타는 토마토 vs 크림?'},
          {'question': '계란후라이는 간장 vs 소스?'},
          {'question': '디저트는 한식 vs 양식?'},
          {'question': '커피는 블랙 vs 우유?'},
        ],
        'hobbies': [
          {'question': '활동적인 취미 vs 집콕 취미?'},
          {'question': '만화는 종이 vs 전자?'},
          {'question': '노래방은 부르기 vs 듣기?'},
          {'question': '게임은 콘솔 vs 휴대용?'},
          {'question': '음악은 이어폰 vs 스피커?'},
          {'question': '영화는 극장 vs 집?'},
          {'question': '주말은 일찍 기상 vs 늦잠?'},
          {'question': '책은 종이책 vs 전자책?'},
          {'question': '스포츠는 팀 vs 개인?'},
          {'question': '새 취미를 쉽게 찾는 편?'},
        ],
        'tech': [
          {'question': 'iOS vs Android?'},
          {'question': 'Windows vs Mac?'},
          {'question': 'SNS는 보기만 vs 올리기?'},
          {'question': '신제품은 바로 구매 vs 기다리기?'},
          {'question': '디지털 vs 아날로그?'},
          {'question': 'AI는 편리 vs 조금 무섭다?'},
          {'question': '스마트 스피커 사용 vs 안 함?'},
          {'question': '입력은 제스처 vs 로마자?'},
          {'question': '웹은 앱 vs 브라우저?'},
          {'question': '데이터는 클라우드 vs 로컬?'},
        ],
      }
    },
    'vi': {
      'title': 'Trò chơi đa số',
      'newQuestionButton': 'Câu hỏi mới',
      'showCommandButton': 'Ai uống?',
      'nextQuestionButton': 'Câu hỏi tiếp theo',
      'message': {
        'initial': 'Nhấn "Câu hỏi mới" để bắt đầu trò chơi.',
        'chooseAnswer': 'Trả lời câu hỏi.',
        'readyForCommand': 'Sẵn sàng. Nhấn nút "Ai uống?".',
        'majorityDrinks': 'Đa số uống!',
        'minorityDrinks': 'Thiểu số uống!',
      },
      'genreSelector': 'Thể loại',
      'genres': {
        'all': 'Tất cả',
        'travel': 'Du lịch',
        'food': 'Đồ ăn',
        'hobbies': 'Sở thích',
        'tech': 'Công nghệ',
      },
      'questions': {
        'all': [
          {'question': 'Bạn thích biển hay núi?'},
          {'question': 'Bạn thích chó hay mèo?'},
          {'question': 'Bữa sáng ăn bánh mì hay cơm?'},
          {'question': 'Ngày nghỉ bạn muốn năng động hay thư giãn?'},
          {'question': 'iOS hay Android?'},
          {'question': 'Ramen miso hay shoyu?'},
          {'question': 'Ngồi cạnh cửa sổ hay lối đi trên máy bay?'},
          {'question': 'Manga giấy hay điện tử?'},
          {'question': 'PC Windows hay Mac?'},
          {'question': 'Chỉ xem SNS hay đăng bài?'},
        ],
        'travel': [
          {'question': 'Bạn thích biển hay núi?'},
          {'question': 'Ngồi cạnh cửa sổ hay lối đi trên máy bay?'},
          {'question': 'Đi theo kế hoạch hay đi ngẫu hứng?'},
          {'question': 'Tiền mặt hay thẻ khi đi nước ngoài?'},
          {'question': 'Khách sạn: view hay tiện nghi?'},
          {'question': 'Quà du lịch: đồ ăn hay đồ lưu niệm?'},
          {'question': 'Đi du lịch một mình hay với bạn bè?'},
          {'question': 'Du lịch trong nước hay quốc tế?'},
          {'question': 'Chụp nhiều ảnh hay chỉ lưu giữ kỷ niệm?'},
          {'question': 'Hỏi đường hay tự tìm đường?'},
        ],
        'food': [
          {'question': 'Bữa sáng ăn bánh mì hay cơm?'},
          {'question': 'Ramen miso hay shoyu?'},
          {'question': 'Cá ngừ hay cá hồi cho sushi?'},
          {'question': 'Cà ri ngọt hay cay?'},
          {'question': 'Ăn trước lưỡi bò hay sườn bò khi nướng?'},
          {'question': 'Mì Malony hay Harasame trong lẩu?'},
          {'question': 'Mì sốt cà chua hay sốt kem?'},
          {'question': 'Nước tương hay sốt trên trứng ốp la?'},
          {'question': 'Kẹo Nhật hay kẹo Tây?'},
          {'question': 'Cà phê đen hay pha sữa?'},
        ],
        'hobbies': [
          {'question': 'Ngày nghỉ bạn muốn năng động hay thư giãn?'},
          {'question': 'Manga giấy hay điện tử?'},
          {'question': 'Karaoke: hát hay nghe?'},
          {'question': 'Game console hay cầm tay?'},
          {'question': 'Nghe nhạc bằng tai nghe hay loa?'},
          {'question': 'Xem phim ở rạp hay ở nhà?'},
          {'question': 'Ngày cuối tuần dậy sớm hay ngủ nướng?'},
          {'question': 'Sách giấy hay ebook?'},
          {'question': 'Thể thao đồng đội hay cá nhân?'},
          {'question': 'Tìm sở thích mới dễ hay khó?'},
        ],
        'tech': [
          {'question': 'iOS hay Android?'},
          {'question': 'PC Windows hay Mac?'},
          {'question': 'Chỉ xem SNS hay đăng bài?'},
          {'question': 'Mua gadget mới ngay hay chờ?'},
          {'question': 'Kỹ thuật số hay analog?'},
          {'question': 'AI tiện lợi hay hơi đáng sợ?'},
          {'question': 'Sử dụng loa thông minh hay không?'},
          {'question': 'Gõ kiểu Flick hay Romanji?'},
          {'question': 'Xem web bằng app hay trình duyệt?'},
          {'question': 'Lưu dữ liệu trên cloud hay local?'},
        ],
      }
    },
  };

  String _gameMessage = '';
  Map<String, dynamic>? _currentQuestion;
  bool _isQuestionReady = false;
  bool _isCommandActive = false;
  bool? _isMajorityCommand;
  bool _isGameComplete = false;
  String _selectedGenre = 'all';
  int _tryNumber = 0;

  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    // Attempt to get the value for the language code, fallback to English if not found.
    final dynamic langMap =
        localizedStrings[languageCode] ?? localizedStrings['en'];
    // For nested keys like 'message.initial', handle separately.
    if (key.contains('.')) {
      final parts = key.split('.');
      return langMap[parts[0]][parts[1]];
    }
    return langMap[key];
  }

  Map<String, String> _getTranslatedGenres() {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return localizedStrings[languageCode]?['genres'] as Map<String, String>? ??
        localizedStrings['en']!['genres'] as Map<String, String>;
  }

  List<dynamic> _getTranslatedQuestions(String genreKey) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    final Map<String, dynamic> questionsMap = localizedStrings[languageCode]
            ?['questions'] ??
        localizedStrings['en']!['questions'];
    return questionsMap[genreKey];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      _currentQuestion = null;
      _isQuestionReady = false;
      _isCommandActive = false;
      _isMajorityCommand = null;
      _isGameComplete = false;
      _gameMessage = _getTranslatedText('message.initial');
    });
  }

  void _handleNewQuestion() {
    _tryNumber++; // ★ 新しい問題ごとにカウントアップ

    // 2回ごとに広告を出す
    if (_tryNumber % 3 == 0) {
      actions.showInterstitialAdCustom(); // ← ここをあなたの広告表示処理に変更
    }
    List<dynamic> questions = [];
    if (_selectedGenre == 'all') {
      _getTranslatedQuestions('all').forEach((q) => questions.add(q));
      _getTranslatedQuestions('travel').forEach((q) => questions.add(q));
      _getTranslatedQuestions('food').forEach((q) => questions.add(q));
      _getTranslatedQuestions('hobbies').forEach((q) => questions.add(q));
      _getTranslatedQuestions('tech').forEach((q) => questions.add(q));
    } else {
      questions = _getTranslatedQuestions(_selectedGenre);
    }

    final randomIndex = Random().nextInt(questions.length);

    setState(() {
      _currentQuestion = questions[randomIndex];
      _isQuestionReady = true;
      _isCommandActive = false;
      _isGameComplete = false;
      _gameMessage = _getTranslatedText('message.chooseAnswer');
    });
  }

  void _handleGenerateCommand() {
    final bool isMajorityDrinks = Random().nextBool();

    setState(() {
      _isCommandActive = true;
      if (isMajorityDrinks) {
        _gameMessage = _getTranslatedText('message.majorityDrinks');
        _isMajorityCommand = true;
      } else {
        _gameMessage = _getTranslatedText('message.minorityDrinks');
        _isMajorityCommand = false;
      }
      _isQuestionReady = false;
      _isGameComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Genre selector
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _getTranslatedText('genreSelector'),
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 8.0),
                    DropdownButton<String>(
                      value: _selectedGenre,
                      dropdownColor: const Color(0xFF166534),
                      style: const TextStyle(color: Colors.white),
                      underline: Container(
                        height: 2,
                        color: Colors.greenAccent,
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedGenre = newValue;
                            _resetGame();
                          });
                        }
                      },
                      items: _getTranslatedGenres()
                          .keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(_getTranslatedGenres()[value]!),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  _getTranslatedText('title'),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 4)
                    ],
                  ),
                ),
              ),

              // Game message
              SizedBox(
                height: 96.0,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      _gameMessage,
                      style: TextStyle(
                        fontSize: _isCommandActive ? 40.0 : 20.0,
                        fontWeight: _isCommandActive
                            ? FontWeight.w900
                            : FontWeight.bold,
                        color: _isCommandActive
                            ? (_isMajorityCommand!
                                ? Colors.redAccent
                                : Colors.lightBlueAccent)
                            : Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              // Question
              if (_currentQuestion != null)
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text(
                    _currentQuestion!['question'],
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 32.0),

              // Action buttons
              if (!_isQuestionReady && !_isGameComplete)
                ElevatedButton(
                  onPressed: _handleNewQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEC4899),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 16),
                    elevation: 8,
                  ),
                  child: Text(
                    _getTranslatedText('newQuestionButton'),
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              if (_isQuestionReady)
                ElevatedButton(
                  onPressed: _handleGenerateCommand,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC026D3),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 16),
                    elevation: 8,
                  ),
                  child: Text(
                    _getTranslatedText('showCommandButton'),
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              if (_isGameComplete)
                ElevatedButton(
                  onPressed: _handleNewQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 16),
                    elevation: 8,
                  ),
                  child: Text(
                    _getTranslatedText('nextQuestionButton'),
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
