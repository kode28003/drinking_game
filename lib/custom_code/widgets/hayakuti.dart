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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:drinking_game/custom_code/actions/show_interstitial_ad_custom.dart'
    as actions;
import 'dart:math';
import 'dart:async';

class Hayakuti extends StatefulWidget {
  const Hayakuti({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Hayakuti> createState() => _HayakutiState();
}

class _HayakutiState extends State<Hayakuti> {
  final Map<String, Map<String, dynamic>> _localizedStrings = {
    'ja': {
      'game_title': '早口言葉ゲーム',
      'start_message': 'スタートボタンを押して挑戦！',
      'success_message': 'おめでとうございます！成功です！',
      'failure_message': '時間切れ...残念ながら失敗です',
      'win_text': '素晴らしい！',
      'lose_text': 'もう一度挑戦してみますか？',
      'start_button': 'スタート',
      'say_it_button': '言えた！',
      'tongue_twisters': [
        '生麦生米生卵',
        '隣の客はよく柿食う客だ',
        '赤巻紙青巻紙黄巻紙',
        '蛙ぴょこぴょこ三ぴょこぴょこ合わせてぴょこぴょこ六ぴょこぴょこ',
        '東京特許許可局長',
        'この釘は引き抜きにくい釘だ',
        '坊主が屏風に上手に坊主の絵を描いた',
        'スモモもモモもモモのうち',
        '庭には二羽鶏がいる',
        '老若男女にゃニャーニャー',
        '引き抜きにくい釘抜き',
        'よっぱらいが酔っぱらってよろよろと寄ってきて、よろよろよろけてよろこんだ',
        '今日の今日に来て今日言わなかった',
        '除雪車除雪作業中',
        '新春シャンソンショー',
        '隣の竹やぶに竹立てかけたのは竹立てかけたかったから竹立てかけた',
        '手術室、診察室、手術室',
        '赤パジャマ青パジャマ黄パジャマ',
        '骨粗鬆症訴訟勝訴',
        '美術室技術室手術室',
        '隣の客はよく柿食う客だが柿食う客はよく牡蠣食う客だ',
        'バスガス爆発バスガス爆発バスガス爆発',
        '貨客船の旅客と旅客機の客',
        '青巻紙赤巻紙黄巻紙茶巻紙',
        '隣の竹垣に竹立てかけた',
        '肩固かったから買った肩叩き器',
        '瓜売りが瓜売りに来て瓜売り残して瓜売り帰る',
        '裏庭には二羽ニワトリがいる',
        'ライスライスカレーライス',
        'ジャズ歌手がジャズシャンソンショーでジャズを歌う',
        '東京特許許可局で特許許可却下',
        'マグマ大使のママとマママグマ大使',
        'この竹垣に竹立てかけたかったから竹立てかけた',
        '借りた皿洗う皿借りる皿',
        '肩叩き機叩きながら語った'
      ]
    },
    'en': {
      'game_title': 'Tongue Twister Game',
      'start_message': 'Press start to begin!',
      'success_message': 'Congratulations! You succeeded!',
      'failure_message': 'Time\'s up... You failed.',
      'win_text': 'Amazing!',
      'lose_text': 'Would you like to try again?',
      'start_button': 'Start',
      'say_it_button': 'I said it!',
      'tongue_twisters': [
        'Peter Piper picked a peck of pickled peppers.',
        'How much wood would a woodchuck chuck if a woodchuck could chuck wood?',
        'She sells seashells by the seashore.',
        'Betty Botter bought some butter, but she said the butter’s bitter.',
        'A big black bug bit a big black dog on his big black nose.',
        'I scream, you scream, we all scream for ice cream.',
        'Fuzzy Wuzzy was a bear. Fuzzy Wuzzy had no hair.',
        'Unique New York. Unique New York.',
        'Red lorry, yellow lorry.',
        'Six slimy snails sailed silently.',
        'I saw Susie sitting in a shoeshine shop.',
        'Can you can a can as a canner can can a can?',
        'I slit the sheet, the sheet I slit, and on the slitted sheet I sit.',
        'Fred fed Ted bread and Ted fed Fred bread.',
        'Lesser leather never weathered wetter weather better.',
        'Nine nice night nurses nursing nicely.',
        'Which wristwatches are Swiss wristwatches?',
        'How can a clam cram in a clean cream can?',
        'Near an ear, a nearer ear, a nearly eerie ear.',
        'Six sleek swans swam swiftly southwards.',
        'Brisk brave brigadiers brandished broad bright blades.',
        'Irish wristwatch, Swiss wristwatch.',
        'Four fine fresh fish for you.',
        'Shut up the shutters and sit in the shop.',
        'Truly rural, truly rural, truly rural.'
      ]
    },
  };

  String _currentTwister = '';
  String _message = '';
  Timer? _timer;
  double _timeRemaining = 1.0;
  bool _isGameActive = false;
  Color _messageColor = Colors.white;
  int _tryNumber = 0;

  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    final Map<String, dynamic>? languageMap = _localizedStrings[languageCode];
    return languageMap?[key] ?? _localizedStrings['en']![key];
  }

  List<String> _getTranslatedTwisters() {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return _localizedStrings[languageCode]?['tongue_twisters']
            as List<String>? ??
        _localizedStrings['en']!['tongue_twisters'] as List<String>;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentTwister = _getTranslatedText('start_message');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startGame() {
    setState(() {
      _tryNumber++; // ★回数カウント
      if (_tryNumber % 3 == 0) {
        actions.showInterstitialAdCustom(); // ★3回ごとに広告
      }

      _isGameActive = true;
      _message = '';
      _messageColor = Colors.white;

      final random = Random();
      final twisters = _getTranslatedTwisters();
      _currentTwister = twisters[random.nextInt(twisters.length)];
    });

    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    final String languageCode = Localizations.localeOf(context).languageCode;

    // Adjust time limit based on language
    final double timeLimit;
    if (languageCode == 'ja') {
      timeLimit = 1.5 + (_currentTwister.length * 0.075);
    } else {
      timeLimit = 2.0 + (_currentTwister.length * 0.0030);
    }

    const updateInterval = Duration(milliseconds: 50);

    setState(() {
      _timeRemaining = 1.0;
    });

    _timer = Timer.periodic(updateInterval, (timer) {
      setState(() {
        _timeRemaining -= updateInterval.inMilliseconds / (timeLimit * 1000);
      });

      if (_timeRemaining <= 0) {
        _timer?.cancel();
        _gameOver();
      }
    });
  }

  void _handleSayIt() {
    _timer?.cancel();
    _gameWin();
  }

  void _gameWin() {
    setState(() {
      _isGameActive = false;
      _message = _getTranslatedText('success_message');
      _messageColor = Colors.green[300]!;
      _currentTwister = _getTranslatedText('win_text');
    });
  }

  void _gameOver() {
    setState(() {
      _isGameActive = false;
      _message = _getTranslatedText('failure_message');
      _messageColor = Colors.red[300]!;
      _currentTwister = _getTranslatedText('lose_text');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: const Color(0xFF1A5F3A),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _getTranslatedText('game_title'),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4a5568),
                ),
              ),
              const SizedBox(height: 24),
              AutoSizeText(
                _currentTwister,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2d3748),
                ),
                maxLines: 2,
                minFontSize: 8,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              if (_isGameActive)
                LinearProgressIndicator(
                  value: _timeRemaining,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _timeRemaining > 0.5
                        ? Colors.blue[400]!
                        : _timeRemaining > 0.25
                            ? Colors.orange[400]!
                            : Colors.red[400]!,
                  ),
                ),
              if (_isGameActive) const SizedBox(height: 16),
              Text(
                _message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: _messageColor,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isGameActive ? _handleSayIt : _startGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black.withOpacity(0.3),
                  elevation: 6,
                ),
                child: Text(
                  _isGameActive
                      ? _getTranslatedText('say_it_button')
                      : _getTranslatedText('start_button'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
