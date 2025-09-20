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

// class YamanoteGame extends StatefulWidget {
//   const YamanoteGame({
//     super.key,
//     this.width,
//     this.height,
//   });

//   final double? width;
//   final double? height;

//   @override
//   State<YamanoteGame> createState() => _YamanoteGameState();
// }

// class _YamanoteGameState extends State<YamanoteGame> {
//   final List<String> gameTopics = [
//     'コンビニに売っているもの',
//     '朝食に食べるもの',
//     'スーパーにある野菜',
//     '漫画・アニメのタイトル',
//     '歴史上の人物',
//     '学校にあるもの',
//     'スポーツ',
//     '海外の国名',
//     '動物',
//     '日本の都道府県',
//     '飲み物',
//     '日本の駅名',
//     'ゲームのタイトル',
//     '花',
//     'お酒の名前',
//     '映画のタイトル',
//     'アニメのキャラクター',
//     '日本の都市名',
//     '世界遺産',
//     'SNSのサービス名',
//     '体の部位',
//     'コンビニのデザート',
//     '日本の食べ物',
//     '世界の食べ物',
//     '音楽のジャンル',
//     '果物',
//     '家電製品',
//     '車のメーカー',
//     'ディズニーキャラクター',
//     'ジブリ作品',
//     'ファッションブランド',
//     '文房具',
//     'お酒のおつまみ',
//     'スポーツ選手の名前',
//     '日本の祭り',
//     '外国の首都',
//     '星座の名前',
//     '日本の戦国武将',
//     '世界の偉人'
//   ];

//   String currentTopic = ' ？ ';

//   void _getNewTopic() {
//     final random = Random();
//     final newTopic = gameTopics[random.nextInt(gameTopics.length)];
//     setState(() {
//       currentTopic = newTopic;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1A5F3A), // green[800]のカラーコード
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 '山手線ゲーム',
//                 style: FlutterFlowTheme.of(context).headlineMedium.override(
//                       fontFamily: 'Inter',
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//               const SizedBox(height: 50),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(32),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: FittedBox(
//                   fit: BoxFit.scaleDown,
//                   child: Text(
//                     currentTopic,
//                     textAlign: TextAlign.center,
//                     style: FlutterFlowTheme.of(context).titleLarge.override(
//                           fontFamily: 'Inter',
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: _getNewTopic,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4CAF50),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 5,
//                 ),
//                 child: Text(
//                   'お題を出す',
//                   style: FlutterFlowTheme.of(context).titleSmall.override(
//                         fontFamily: 'Inter',
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class YamanoteGame extends StatefulWidget {
  const YamanoteGame({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<YamanoteGame> createState() => _YamanoteGameState();
}

class _YamanoteGameState extends State<YamanoteGame> {
  final Map<String, Map<String, dynamic>> localizedStrings = {
    'ja': {
      'game_title': '山手線ゲーム',
      'get_topic_button': 'お題を出す',
      'empty_topic': ' ？ ',
      'topics': [
        'コンビニに売っているもの',
        '朝食に食べるもの',
        'スーパーにある野菜',
        '漫画・アニメのタイトル',
        '歴史上の人物',
        '学校にあるもの',
        'スポーツ',
        '海外の国名',
        '動物',
        '日本の都道府県',
        '飲み物',
        '日本の駅名',
        'ゲームのタイトル',
        '花',
        'お酒の名前',
        '映画のタイトル',
        'アニメのキャラクター',
        '日本の都市名',
        '世界遺産',
        'SNSのサービス名',
        '体の部位',
        'コンビニのデザート',
        '日本の食べ物',
        '世界の食べ物',
        '音楽のジャンル',
        '果物',
        '家電製品',
        '車のメーカー',
        'ディズニーキャラクター',
        'ジブリ作品',
        'ファッションブランド',
        '文房具',
        'お酒のおつまみ',
        'スポーツ選手の名前',
        '日本の祭り',
        '外国の首都',
        '星座の名前',
        '日本の戦国武将',
        '世界の偉人'
      ]
    },
    'en': {
      'game_title': 'Yamanote Line Game',
      'get_topic_button': 'Get a Topic',
      'empty_topic': ' ? ',
      'topics': [
        'Items sold at convenience stores',
        'Foods for breakfast',
        'Vegetables found in supermarkets',
        'Manga/Anime titles',
        'Historical figures',
        'Things found at school',
        'Sports',
        'Names of countries',
        'Animals',
        'Japanese prefectures',
        'Drinks',
        'Japanese station names',
        'Game titles',
        'Flowers',
        'Names of alcoholic beverages',
        'Movie titles',
        'Anime characters',
        'Japanese city names',
        'World heritage sites',
        'SNS service names',
        'Body parts',
        'Convenience store desserts',
        'Japanese foods',
        'Foods from around the world',
        'Music genres',
        'Fruits',
        'Home appliances',
        'Car manufacturers',
        'Disney characters',
        'Studio Ghibli works',
        'Fashion brands',
        'Stationery',
        'Snacks for alcohol',
        'Names of sports players',
        'Japanese festivals',
        'Foreign capitals',
        'Constellation names',
        'Japanese Sengoku warlords',
        'World historical figures'
      ]
    }
  };

  late String currentTopic;

  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return localizedStrings[languageCode]?[key] ??
        localizedStrings['en']![key]!;
  }

  List<String> _getTranslatedTopics() {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return localizedStrings[languageCode]?['topics'] as List<String>? ??
        localizedStrings['en']!['topics'] as List<String>;
  }

  @override
  void initState() {
    super.initState();
    // initStateではcontextに依存する処理を行わない
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentTopic = _getTranslatedText('empty_topic');
  }

  void _getNewTopic() {
    final random = Random();
    final topics = _getTranslatedTopics();
    final newTopic = topics[random.nextInt(topics.length)];
    setState(() {
      currentTopic = newTopic;
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
                _getTranslatedText('game_title'),
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    currentTopic,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: _getNewTopic,
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
                  _getTranslatedText('get_topic_button'),
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
