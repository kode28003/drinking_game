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

class CoinToss extends StatefulWidget {
  const CoinToss({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CoinToss> createState() => _CoinTossState();
}

class _CoinTossState extends State<CoinToss>
    with SingleTickerProviderStateMixin {
  // 多言語テキストを管理するマップ
  final Map<String, Map<String, String>> localizedStrings = {
    'ja': {
      'toss_coin_button': 'コイントス',
      'heads': '表',
      'tails': '裏',
    },
    'en': {
      'toss_coin_button': 'Toss Coin',
      'heads': 'Heads',
      'tails': 'Tails',
    },
  };

  String resultText = '';
  late AnimationController _controller;
  late Animation<double> _animation;
  final random = Random();
  int _tryNumber = 0;

  // 現在の言語に対応するテキストを取得するヘルパーメソッド
  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    // 端末の言語が日本語('ja')であれば日本語を、そうでなければ英語('en')を返す
    if (languageCode == 'ja') {
      return localizedStrings['ja']![key]!;
    } else {
      return localizedStrings['en']![key]!;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _animation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultText = _getTranslatedText('toss_coin_button');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tossCoin() {
    _tryNumber++; // ★ 回数カウント
    if (_tryNumber % 2 == 0) {
      actions.showInterstitialAdCustom(); // ★ 2回に1回広告を表示
    }
    _controller.reset();
    setState(() {
      resultText = _getTranslatedText('toss_coin_button');
    });

    final int resultIndex = random.nextInt(2);
    final int randomRotations = random.nextInt(6) + 15;
    final double finalRotation =
        (randomRotations * 2 * pi) + (resultIndex == 0 ? 0 : pi);

    _animation = Tween<double>(begin: 0, end: finalRotation).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _controller.forward().whenComplete(() {
      setState(() {
        if (resultIndex == 0) {
          resultText = _getTranslatedText('heads');
        } else {
          resultText = _getTranslatedText('tails');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A5F3A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                resultText,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 50),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final double angle = _animation.value;
                  final String currentImage =
                      cos(angle) > 0 ? 'coinFront.png' : 'coinBack.png';

                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(angle),
                    child: Container(
                      width: 200,
                      height: 200,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/$currentImage',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: _tossCoin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  _getTranslatedText('toss_coin_button'),
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 18,
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
