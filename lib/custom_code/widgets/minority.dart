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
      },
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
