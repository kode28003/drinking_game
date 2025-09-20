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

import 'dart:math';

// class Card {
//   final String value;
//   final String? suit;

//   Card(this.value, this.suit);

//   bool get isRed => suit == '♥' || suit == '♦';
// }

// class TrumpFlipGame extends StatefulWidget {
//   const TrumpFlipGame({
//     super.key,
//     this.width,
//     this.height,
//   });

//   final double? width;
//   final double? height;

//   @override
//   State<TrumpFlipGame> createState() => _TrumpFlipGameState();
// }

// class _TrumpFlipGameState extends State<TrumpFlipGame> {
//   final List<String> suits = ['♥', '♦', '♣', '♠'];
//   final List<String> values = [
//     'A',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//     '10',
//     'J',
//     'Q',
//     'K'
//   ];
//   List<Card> deck = [];
//   Card? currentCard;
//   double _flipAngle = 0.0;
//   String message = 'カードを引いてください';

//   @override
//   void initState() {
//     super.initState();
//     _createDeck();
//   }

//   void _createDeck() {
//     deck.clear();
//     for (var suit in suits) {
//       for (var value in values) {
//         deck.add(Card(value, suit));
//       }
//     }
//     deck.add(Card('joker', null));
//     deck.add(Card('joker', null));
//     _shuffleDeck();
//   }

//   void _shuffleDeck() {
//     final random = Random();
//     deck.shuffle(random);
//   }

//   void _drawCard() {
//     // If card is currently shown, flip it back to reveal the back.
//     if (_flipAngle == pi) {
//       setState(() {
//         _flipAngle = 0.0;
//         message = 'もう一度タップして次のカードを引いてください';
//       });
//       return;
//     }

//     if (deck.isEmpty) {
//       _showModal('デッキが空になりました！', '新しいゲームを始めます。', () {
//         setState(() {
//           _createDeck();
//           currentCard = null;
//           _flipAngle = 0.0;
//           message = '新しいゲームが始まりました！';
//         });
//       });
//       return;
//     }

//     final drawnCard = deck.removeLast();
//     setState(() {
//       currentCard = drawnCard;
//       _flipAngle = pi;
//     });

//     String resultMessage;
//     String subMessage;

//     if (['J', 'Q', 'K'].contains(drawnCard.value)) {
//       resultMessage = '1杯飲んでください！';
//       subMessage = '結果: ${drawnCard.value}！';
//       _showModal(subMessage, resultMessage);
//     } else if (drawnCard.value == 'joker') {
//       resultMessage = '2杯飲んでください！';
//       subMessage = '結果: joker！';
//       _showModal(subMessage, resultMessage);
//     } else {
//       resultMessage = 'セーフ！';
//       subMessage = '飲まなくても大丈夫です。';
//     }

//     setState(() {
//       message = '結果: $resultMessage';
//     });
//   }

//   void _showModal(String title, String content, [VoidCallback? onOk]) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           title:
//               Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//           content: Text(content),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 if (onOk != null) {
//                   onOk();
//                 }
//               },
//               child: const Text('OK',
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width,
//       height: widget.height,
//       color: const Color(0xFF166534), // green-800
//       child: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // Main content box
//               Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF166534),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       spreadRadius: 2,
//                       blurRadius: 8,
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   children: [
//                     const Text(
//                       '引いて飲んで！カードゲーム',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 16),
//                     const Text(
//                       'J, Q, Kが出たら1杯、jokerが出たら2杯飲んでください。',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 32),
//                     // Card and message container
//                     SizedBox(
//                       width: 200,
//                       height: 300,
//                       child: GestureDetector(
//                         onTap: _drawCard,
//                         child: TweenAnimationBuilder<double>(
//                           tween: Tween(begin: 0.0, end: _flipAngle),
//                           duration: const Duration(milliseconds: 400),
//                           onEnd: () {
//                             if (_flipAngle == 0.0) {
//                               setState(() {
//                                 currentCard = null;
//                               });
//                             }
//                           },
//                           builder: (context, angle, child) {
//                             return Transform(
//                               transform: Matrix4.identity()
//                                 ..setEntry(3, 2, 0.001)
//                                 ..rotateY(angle),
//                               alignment: Alignment.center,
//                               child: Stack(
//                                 children: [
//                                   // Card back
//                                   if (angle <= pi / 2) _buildCardBack(),
//                                   // Card front
//                                   if (angle > pi / 2 && currentCard != null)
//                                     Transform(
//                                       alignment: Alignment.center,
//                                       transform: Matrix4.identity()
//                                         ..rotateY(pi),
//                                       child: _buildCardFront(currentCard!),
//                                     ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Text(
//                       message,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCardBack() {
//     return Container(
//       key: const ValueKey('back'),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1a202c),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: const Center(
//         child: Text(
//           '🃏',
//           style: TextStyle(fontSize: 64),
//         ),
//       ),
//     );
//   }

//   Widget _buildCardFront(Card card) {
//     return Container(
//       key: const ValueKey('front'),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           // Top left corner
//           Positioned(
//             left: 10,
//             top: 10,
//             child: _buildCornerContent(card),
//           ),
//           // Center
//           Center(
//             child: Text(
//               card.value == 'joker' ? '🃏' : card.value,
//               style: TextStyle(
//                 fontSize: 96,
//                 fontWeight: FontWeight.bold,
//                 color: card.isRed ? Colors.red.shade700 : Colors.black,
//               ),
//             ),
//           ),
//           // Bottom right corner
//           Positioned(
//             right: 10,
//             bottom: 10,
//             child: Transform.rotate(
//               angle: pi,
//               child: _buildCornerContent(card),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCornerContent(Card card) {
//     final textColor = card.isRed ? Colors.red.shade700 : Colors.black;
//     return card.value == 'joker'
//         ? Text(
//             '🃏',
//             style: TextStyle(fontSize: 32, color: textColor),
//           )
//         : Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 card.value,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                   height: 1.0,
//                 ),
//               ),
//               Text(
//                 card.suit!,
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                   height: 1.0,
//                 ),
//               ),
//             ],
//           );
//   }
// }
//

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
