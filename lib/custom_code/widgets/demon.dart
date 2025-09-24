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
import 'package:drinking_game/custom_code/actions/show_interstitial_ad_custom.dart'
    as actions;

class Demon extends StatefulWidget {
  const Demon({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Demon> createState() => _DemonState();
}

class _DemonState extends State<Demon> with SingleTickerProviderStateMixin {
  final Map<String, Map<String, String>> _localizedStrings = {
    'ja': {
      'game_title_safe': 'セーフ！',
      'game_title_fail': '残念！ハズレ！',
      'game_title_start': '顔をタップしてね',
      'game_over_message': '残念！おじさんが怒った！',
      'play_again_button': 'もう一度',
    },
    'en': {
      'game_title_safe': 'Safe!',
      'game_title_fail': 'Too bad! It\'s a miss!',
      'game_title_start': 'Tap a face!',
      'game_over_message': 'Too bad! The old man got angry!',
      'play_again_button': 'Play Again',
    },
  };

  int? losingOjisanIndex;
  bool isGameOver = false;
  final int totalOjisans = 20;
  final List<String> ojisanFaces = ['👴', '👨', '🧓', '😀'];
  final List<String> fixedFaces = [];
  final List<bool> selectedOjisans = List.generate(20, (index) => false);

  late AnimationController _controller;
  late Animation<double> _animation;

  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    final Map<String, String>? languageMap = _localizedStrings[languageCode];
    return languageMap?[key] ?? _localizedStrings['en']![key]!;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    for (int i = 0; i < totalOjisans; i++) {
      fixedFaces.add(ojisanFaces[Random().nextInt(ojisanFaces.length)]);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initStateではcontextにアクセスできないため、ここで初期化
    initializeGame();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initializeGame() {
    if (!mounted) return;
    setState(() {
      isGameOver = false;
      losingOjisanIndex = Random().nextInt(totalOjisans);
      for (int i = 0; i < selectedOjisans.length; i++) {
        selectedOjisans[i] = false;
      }
    });
    for (int i = 0; i < totalOjisans; i++) {
      fixedFaces[i] = ojisanFaces[Random().nextInt(ojisanFaces.length)];
    }
  }

  void handleOjisanClick(int index) {
    if (isGameOver || selectedOjisans[index]) {
      return;
    }

    setState(() {
      selectedOjisans[index] = true;
    });

    if (index == losingOjisanIndex) {
      setState(() {
        isGameOver = true;
      });
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A5F3A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              // ---- Main game UI ----
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isGameOver
                          ? _getTranslatedText('game_title_fail')
                          : (selectedOjisans.any((element) => element)
                              ? _getTranslatedText('game_title_safe')
                              : _getTranslatedText('game_title_start')),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: totalOjisans,
                      itemBuilder: (context, index) {
                        final isSelected = selectedOjisans[index];
                        final face = fixedFaces[index];

                        return GestureDetector(
                          onTap: () => handleOjisanClick(index),
                          child: AnimatedOpacity(
                            opacity: isSelected ? 0.2 : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: FittedBox(
                              child: Text(face),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              // ---- Overlay when game over ----
              if (isGameOver)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ScaleTransition(
                          scale: _animation,
                          child: Image.asset(
                            'assets/images/onidesu.png',
                            height: 180,
                            width: 180,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                '👹',
                                style: TextStyle(fontSize: 180),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 35),
                        Text(
                          _getTranslatedText('game_over_message'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          // onPressed: initializeGame,
                          onPressed: () {
                            // 広告を表示
                            actions.showInterstitialAdCustom();
                            // ゲームをリセット
                            initializeGame();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2196f3),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            _getTranslatedText('play_again_button'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
