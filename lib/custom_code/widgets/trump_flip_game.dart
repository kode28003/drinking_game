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

class Card {
  final String value;
  final String? suit;

  Card(this.value, this.suit);

  bool get isRed => suit == '♥' || suit == '♦';
}

class TrumpFlipGame extends StatefulWidget {
  const TrumpFlipGame({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<TrumpFlipGame> createState() => _TrumpFlipGameState();
}

class _TrumpFlipGameState extends State<TrumpFlipGame> {
  // final Map<String, Map<String, String>> _localizedStrings = {
  //   'ja': {
  //     'game_title': 'フリップカードゲーム',
  //     'game_rule': 'J, Q, Kが出たら1杯、jokerが出たら2杯飲んでください。',
  //     'initial_message': 'カードをタップしてください',
  //     'tap_again_message': 'もう一度カードをタップしてください',
  //     'deck_empty_title': 'デッキが空になりました！',
  //     'deck_empty_content': '新しいゲームを始めます。',
  //     'new_game_message': '新しいゲームが始まりました！',
  //     'take_one_drink': '1杯飲んでください！',
  //     'take_two_drinks': '2杯飲んでください！',
  //     'safe': 'セーフ！',
  //     'no_drinks': '飲まなくても大丈夫です。',
  //     'result_message': '結果: ',
  //     'ok_button': 'OK',
  //   },
  //   'en': {
  //     'game_title': 'Draw & Drink! Card Game',
  //     'game_rule':
  //         'Draw a card. If J, Q, or K appear, take 1 drink. If a joker appears, take 2 drinks.',
  //     'initial_message': 'Draw a card',
  //     'tap_again_message': 'Tap again to draw the next card',
  //     'deck_empty_title': 'Deck is empty!',
  //     'deck_empty_content': 'Starting a new game.',
  //     'new_game_message': 'A new game has started!',
  //     'take_one_drink': 'Take one drink!',
  //     'take_two_drinks': 'Take two drinks!',
  //     'safe': 'Safe!',
  //     'no_drinks': 'No drinks needed.',
  //     'result_message': 'Result: ',
  //     'ok_button': 'OK',
  //   },
  // };
  final Map<String, Map<String, String>> _localizedStrings = {
    'ja': {
      'game_title': 'フリップカードゲーム',
      'game_rule': 'J, Q, Kが出たら1杯、jokerが出たら2杯飲んでください。',
      'initial_message': 'カードをタップしてください',
      'tap_again_message': 'もう一度カードをタップしてください',
      'deck_empty_title': 'デッキが空になりました！',
      'deck_empty_content': '新しいゲームを始めます。',
      'new_game_message': '新しいゲームが始まりました！',
      'take_one_drink': '1杯飲んでください！',
      'take_two_drinks': '2杯飲んでください！',
      'safe': 'セーフ！',
      'no_drinks': '飲まなくても大丈夫です。',
      'result_message': '結果: ',
      'ok_button': 'OK',
    },
    'ms': {
      'game_title': 'Permainan Kad Terbalik',
      'game_rule':
          'Minum 1 gelas jika keluar J, Q, K; minum 2 gelas jika keluar joker.',
      'initial_message': 'Sila ketik kad',
      'tap_again_message': 'Sila ketik kad sekali lagi',
      'deck_empty_title': 'Dek sudah habis!',
      'deck_empty_content': 'Permainan baru akan bermula.',
      'new_game_message': 'Permainan baru telah bermula!',
      'take_one_drink': 'Minum 1 gelas!',
      'take_two_drinks': 'Minum 2 gelas!',
      'safe': 'Selamat!',
      'no_drinks': 'Tidak perlu minum.',
      'result_message': 'Keputusan: ',
      'ok_button': 'OK',
    },
    'en': {
      'game_title': 'Draw & Drink! Card Game',
      'game_rule':
          'Draw a card. If J, Q, or K appear, take 1 drink. If a joker appears, take 2 drinks.',
      'initial_message': 'Draw a card',
      'tap_again_message': 'Tap again to draw the next card',
      'deck_empty_title': 'Deck is empty!',
      'deck_empty_content': 'Starting a new game.',
      'new_game_message': 'A new game has started!',
      'take_one_drink': 'Take one drink!',
      'take_two_drinks': 'Take two drinks!',
      'safe': 'Safe!',
      'no_drinks': 'No drinks needed.',
      'result_message': 'Result: ',
      'ok_button': 'OK',
    },
    'ru': {
      'game_title': 'Игра: Тяни и пей!',
      'game_rule':
          'Тяни карту. Если выпадет J, Q или K — выпей 1. Если джокер — выпей 2.',
      'initial_message': 'Выберите карту',
      'tap_again_message': 'Нажмите снова, чтобы вытянуть следующую карту',
      'deck_empty_title': 'Колода пуста!',
      'deck_empty_content': 'Начинаем новую игру.',
      'new_game_message': 'Началась новая игра!',
      'take_one_drink': 'Выпей один!',
      'take_two_drinks': 'Выпей два!',
      'safe': 'Безопасно!',
      'no_drinks': 'Пить не нужно.',
      'result_message': 'Результат: ',
      'ok_button': 'OK',
    },
    'vi': {
      'game_title': 'Trò chơi rút bài & uống!',
      'game_rule':
          'Rút một lá. Nếu ra J, Q hoặc K thì uống 1 ly. Nếu ra joker thì uống 2 ly.',
      'initial_message': 'Chạm để rút bài',
      'tap_again_message': 'Chạm lại để rút lá tiếp theo',
      'deck_empty_title': 'Bộ bài đã hết!',
      'deck_empty_content': 'Bắt đầu trò chơi mới.',
      'new_game_message': 'Trò chơi mới đã bắt đầu!',
      'take_one_drink': 'Uống một ly!',
      'take_two_drinks': 'Uống hai ly!',
      'safe': 'An toàn!',
      'no_drinks': 'Không cần uống.',
      'result_message': 'Kết quả: ',
      'ok_button': 'OK',
    },
    'ko': {
      'game_title': '카드 뽑기 & 벌칙 술!',
      'game_rule': '카드를 한 장 뽑습니다. J, Q, K가 나오면 한 잔! 조커가 나오면 두 잔!',
      'initial_message': '카드를 뽑으려면 터치하세요',
      'tap_again_message': '다시 터치해서 다음 카드를 뽑으세요',
      'deck_empty_title': '카드가 다 떨어졌어요!',
      'deck_empty_content': '새 게임을 시작하세요.',
      'new_game_message': '새 게임이 시작되었습니다!',
      'take_one_drink': '한 잔 마셔요!',
      'take_two_drinks': '두 잔 마셔요!',
      'safe': '세이프!',
      'no_drinks': '마실 필요 없어요.',
      'result_message': '결과: ',
      'ok_button': '확인',
    },
  };

  final List<String> suits = ['♥', '♦', '♣', '♠'];
  final List<String> values = [
    'A',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'J',
    'Q',
    'K'
  ];
  List<Card> deck = [];
  Card? currentCard;
  double _flipAngle = 0.0;
  String message = '';

  @override
  void initState() {
    super.initState();
    _createDeck();
  }

  String _getLocalizedString(String key) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final strings = _localizedStrings[languageCode] ?? _localizedStrings['en']!;
    return strings[key] ?? '';
  }

  void _createDeck() {
    deck.clear();
    for (var suit in suits) {
      for (var value in values) {
        deck.add(Card(value, suit));
      }
    }
    deck.add(Card(values[11], suits[2]));
    deck.add(Card(values[10], suits[1]));
    deck.add(Card('joker', null));
    deck.add(Card('joker', null));
    deck.add(Card('joker', null));
    _shuffleDeck();
  }

  void _shuffleDeck() {
    final random = Random();
    deck.shuffle(random);
  }

  void _drawCard() {
    if (_flipAngle == pi) {
      setState(() {
        _flipAngle = 0.0;
        message = _getLocalizedString('tap_again_message');
      });
      return;
    }

    if (deck.isEmpty) {
      _showModal(
        _getLocalizedString('deck_empty_title'),
        _getLocalizedString('deck_empty_content'),
        () {
          setState(() {
            _createDeck();
            currentCard = null;
            _flipAngle = 0.0;
            message = _getLocalizedString('new_game_message');
          });
        },
      );
      return;
    }

    final drawnCard = deck.removeLast();
    setState(() {
      currentCard = drawnCard;
      _flipAngle = pi;
    });

    String resultMessage;
    String subMessage;

    if (['J', 'Q', 'K'].contains(drawnCard.value)) {
      resultMessage = _getLocalizedString('take_one_drink');
      subMessage =
          '${_getLocalizedString('result_message')}${drawnCard.value}！';
      _showModal(subMessage, resultMessage);
    } else if (drawnCard.value == 'joker') {
      resultMessage = _getLocalizedString('take_two_drinks');
      subMessage = '${_getLocalizedString('result_message')}joker！';
      _showModal(subMessage, resultMessage);
    } else {
      resultMessage = _getLocalizedString('safe');
      subMessage = _getLocalizedString('no_drinks');
    }

    setState(() {
      message = '${_getLocalizedString('result_message')}$resultMessage';
    });
  }

  void _showModal(String title, String content, [VoidCallback? onOk]) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                actions.showInterstitialAdCustom();
                if (onOk != null) {
                  onOk();
                }
              },
              child: Text(_getLocalizedString('ok_button'),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: const Color(0xFF166534), // green-800
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Main content box
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF166534),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      _getLocalizedString('game_title'),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _getLocalizedString('game_rule'),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    // Card and message container
                    SizedBox(
                      width: 200,
                      height: 300,
                      child: GestureDetector(
                        onTap: _drawCard,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: _flipAngle),
                          duration: const Duration(milliseconds: 400),
                          onEnd: () {
                            if (_flipAngle == 0.0) {
                              setState(() {
                                currentCard = null;
                              });
                            }
                          },
                          builder: (context, angle, child) {
                            return Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(angle),
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  // Card back
                                  if (angle <= pi / 2) _buildCardBack(),
                                  // Card front
                                  if (angle > pi / 2 && currentCard != null)
                                    Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..rotateY(pi),
                                      child: _buildCardFront(currentCard!),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      message.isEmpty
                          ? _getLocalizedString('initial_message')
                          : message,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardBack() {
    return Container(
      key: const ValueKey('back'),
      decoration: BoxDecoration(
        color: const Color(0xFF1a202c),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          '🃏',
          style: TextStyle(fontSize: 64),
        ),
      ),
    );
  }

  Widget _buildCardFront(Card card) {
    return Container(
      key: const ValueKey('front'),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Top left corner
          Positioned(
            left: 10,
            top: 10,
            child: _buildCornerContent(card),
          ),
          // Center
          Center(
            child: Text(
              card.value == 'joker' ? '🃏' : card.value,
              style: TextStyle(
                fontSize: 96,
                fontWeight: FontWeight.bold,
                color: card.isRed ? Colors.red.shade700 : Colors.black,
              ),
            ),
          ),
          // Bottom right corner
          Positioned(
            right: 10,
            bottom: 10,
            child: Transform.rotate(
              angle: pi,
              child: _buildCornerContent(card),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerContent(Card card) {
    final textColor = card.isRed ? Colors.red.shade700 : Colors.black;
    return card.value == 'joker'
        ? Text(
            '🃏',
            style: TextStyle(fontSize: 32, color: textColor),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                card.value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  height: 1.0,
                ),
              ),
              Text(
                card.suit!,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  height: 1.0,
                ),
              ),
            ],
          );
  }
}
