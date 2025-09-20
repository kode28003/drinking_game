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

import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui' as ui;

// class Roulette11 extends StatefulWidget {
//   const Roulette11({
//     super.key,
//     this.width,
//     this.height,
//   });

//   final double? width;
//   final double? height;

//   @override
//   State<Roulette11> createState() => _Roulette11State();
// }

// class _Roulette11State extends State<Roulette11>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late Animation<double> _rotation;

//   String _currentGenre = 'body';
//   int _segments = 8;
//   List<String> _selectedOptions = [];

//   final Map<String, Map<String, dynamic>> localizedStrings = {
//     'ja': {
//       'roulette_title': '飲みゲー ルーレット',
//       'segments_label': '分割数: ',
//       'genre_label': 'ジャンルを選んでね',
//       'spinning_text': '回転中...',
//       'start_button': 'スタート',
//       'result_prefix': '結果: 「',
//       'result_suffix': '」に当てはまる人！',
//       'genres': {
//         'body': '身体的特徴',
//         'past': '過去の経験・所属',
//         'king': '王様ゲーム',
//         'daily': '日常的な行動',
//       },
//       'options': {
//         'body': ['女', '左利き', 'メガネ', 'コンタクト', 'ピアス', '二重', '全員飲め', '男'],
//         'past': ['運動部', '文化部', '理系', '文系', '一人暮らし', '実家暮らし', '留学経験', '全員飲め'],
//         'king': [
//           '選んだ2人飲め',
//           '選んだ3人飲め',
//           '回したやつ飲め',
//           '回したやつ以外飲め',
//           '選ばれたやつ飲め',
//           '両隣と飲め',
//           '両隣とハイタッチ',
//           '全員飲め'
//         ],
//         'daily': [
//           '朝食食べた',
//           '全員飲め',
//           '電車で来た',
//           'MBTIがE',
//           '全員飲む',
//           'MBTIがI',
//           'スマホ決済',
//           '現金派'
//         ]
//       }
//     },
//     'en': {
//       'roulette_title': 'Drinking Game Roulette',
//       'segments_label': 'Segments: ',
//       'genre_label': 'Choose a genre',
//       'spinning_text': 'Spinning...',
//       'start_button': 'Start',
//       'result_prefix': 'Result: , "',
//       'result_suffix': '"!',
//       'genres': {
//         'body': 'Physical Traits',
//         'past': 'Past Experience',
//         'king': 'King\'s Game',
//         'daily': 'Daily Habits',
//       },
//       'options': {
//         'body': [
//           'Female',
//           'Left-handed',
//           'Glasses',
//           'Contacts',
//           'Piercings',
//           'Double eyelids',
//           'Everyone drinks',
//           'Male'
//         ],
//         'past': [
//           'Sports club',
//           'Cultural club',
//           'Science major',
//           'Liberal arts major',
//           'Living alone',
//           'Living at home',
//           'Study abroad',
//           'Everyone drinks'
//         ],
//         'king': [
//           '2 chosen people drink',
//           '3 chosen people drink',
//           'The spinner drinks',
//           'Everyone but the spinner drinks',
//           'The chosen person drinks',
//           'People next to you drink',
//           'High-five your neighbors',
//           'Everyone drinks'
//         ],
//         'daily': [
//           'Had breakfast',
//           'Everyone drinks',
//           'Came by train',
//           'MBTI is E',
//           'Everyone drinks',
//           'MBTI is I',
//           'Phone payment',
//           'Cash user'
//         ]
//       }
//     }
//   };

//   String _resultText = '';
//   bool _isSpinning = false;

//   String _getTranslatedText(String key) {
//     final String languageCode = Localizations.localeOf(context).languageCode;
//     if (languageCode == 'ja') {
//       return localizedStrings['ja']![key]!;
//     } else {
//       return localizedStrings['en']![key]!;
//     }
//   }

//   Map<String, String> _getTranslatedGenres() {
//     final String languageCode = Localizations.localeOf(context).languageCode;
//     if (languageCode == 'ja') {
//       return localizedStrings['ja']!['genres'] as Map<String, String>;
//     } else {
//       return localizedStrings['en']!['genres'] as Map<String, String>;
//     }
//   }

//   List<String> _getTranslatedOptions(String genreKey) {
//     final String languageCode = Localizations.localeOf(context).languageCode;
//     if (languageCode == 'ja') {
//       return localizedStrings['ja']!['options']![genreKey] as List<String>;
//     } else {
//       return localizedStrings['en']!['options']![genreKey] as List<String>;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     );
//     _rotation = Tween<double>(begin: 0, end: 0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOutQuart,
//       ),
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _updateOptions();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _updateOptions() {
//     final uniqueOptions = _getTranslatedOptions(_currentGenre).toSet().toList();
//     uniqueOptions.shuffle();
//     _selectedOptions = uniqueOptions.sublist(0, _segments);
//   }

//   void _setSegments(int value) {
//     if (_isSpinning) return;
//     setState(() {
//       _segments = value;
//       _updateOptions();
//     });
//   }

//   void _setGenre(String value) {
//     if (_isSpinning) return;
//     setState(() {
//       _currentGenre = value;
//       _updateOptions();
//     });
//   }

//   void _spinRoulette() {
//     if (_isSpinning) return;

//     setState(() {
//       _isSpinning = true;
//       _resultText = '';
//     });

//     final angleStep = 360.0 / _segments;
//     final finalIndex = Random().nextInt(_segments);
//     final targetAngle = (finalIndex * angleStep) + (angleStep / 2);

//     const pointerOffset = 270.0;
//     final adjustedTargetAngle = pointerOffset - targetAngle;
//     const totalRotations = 360.0 * 10;

//     final finalRotation = totalRotations + adjustedTargetAngle;

//     _controller.reset();

//     _rotation =
//         Tween<double>(begin: 0, end: finalRotation * (pi / 180)).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOutQuart,
//       ),
//     );

//     _controller.animateTo(1.0).then((_) {
//       setState(() {
//         _isSpinning = false;
//         _resultText =
//             '${_getTranslatedText('result_prefix')}${_selectedOptions[finalIndex]}${_getTranslatedText('result_suffix')}';
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1A5F3A),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 _getTranslatedText('roulette_title'),
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                       color: Colors.white,
//                     ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '${_getTranslatedText('segments_label')}$_segments',
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                   SizedBox(
//                     width: 200,
//                     child: Slider(
//                       value: _segments.toDouble(),
//                       min: 4,
//                       max: 8,
//                       divisions: 4,
//                       onChanged: _isSpinning
//                           ? null
//                           : (val) => _setSegments(val.toInt()),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     _getTranslatedText('genre_label'),
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                   const SizedBox(width: 8),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: DropdownButton<String>(
//                       value: _currentGenre,
//                       items: _getTranslatedGenres().keys.map((String key) {
//                         return DropdownMenuItem<String>(
//                           value: key,
//                           child: Text(
//                             _getTranslatedGenres()[key]!,
//                             style: const TextStyle(
//                               fontSize: 15,
//                               color: Colors.black,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: _isSpinning
//                           ? null
//                           : (newValue) {
//                               if (newValue != null) {
//                                 _setGenre(newValue);
//                               }
//                             },
//                       underline: Container(),
//                       icon: const Icon(Icons.arrow_drop_down,
//                           color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32),
//               SizedBox(
//                 width: 330,
//                 height: 330,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     AnimatedBuilder(
//                       animation: _controller,
//                       builder: (context, child) {
//                         return Transform.rotate(
//                           angle: _rotation.value,
//                           child: CustomPaint(
//                             painter: RoulettePainter(
//                               segments: _segments,
//                               options: _selectedOptions,
//                             ),
//                             child: const SizedBox(
//                               width: 330,
//                               height: 330,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     const Positioned(
//                       top: -40,
//                       child: Icon(
//                         Icons.arrow_drop_down,
//                         color: Color(0xFFef4444),
//                         size: 90,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 32),
//               FFButtonWidget(
//                 onPressed: _isSpinning ? null : _spinRoulette,
//                 text: _isSpinning
//                     ? _getTranslatedText('spinning_text')
//                     : _getTranslatedText('start_button'),
//                 options: FFButtonOptions(
//                   width: 150,
//                   height: 50,
//                   color: Theme.of(context).primaryColor,
//                   textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
//                         fontFamily: 'Inter',
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                   borderSide: const BorderSide(
//                     color: Colors.transparent,
//                     width: 1,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 width: 330,
//                 child: FittedBox(
//                   fit: BoxFit.scaleDown,
//                   child: Text(
//                     _resultText,
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RoulettePainter extends CustomPainter {
//   final int segments;
//   final List<String> options;

//   RoulettePainter({required this.segments, required this.options});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;
//     final radius = size.width / 2;
//     final angleStep = 2 * pi / segments;
//     final colors = [
//       const Color(0xFFf4a261),
//       const Color(0xFFe76f51),
//       const Color(0xFF2a9d8f),
//       const Color(0xFFe9c46a),
//       const Color(0xFF264653),
//       const Color(0xFFd62828),
//       const Color(0xFFf77f00),
//       const Color(0xFF2ec4b6)
//     ];
//     final textPainter = TextPainter(textDirection: ui.TextDirection.ltr);

//     for (int i = 0; i < segments; i++) {
//       final paint = Paint()..color = colors[i % colors.length];
//       final startAngle = i * angleStep;
//       final sweepAngle = angleStep;

//       canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

//       final textAngle = startAngle + sweepAngle / 2;
//       final textRadius = radius * 0.7;

//       canvas.save();
//       canvas.translate(centerX, centerY);
//       canvas.rotate(textAngle);

//       double fontSize = 16.0;
//       final maxTextWidth = radius * 0.7;

//       textPainter.text = TextSpan(
//         text: options[i],
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: fontSize,
//         ),
//       );
//       textPainter.layout();

//       while (textPainter.width > maxTextWidth && fontSize > 8) {
//         fontSize--;
//         textPainter.text = TextSpan(
//           text: options[i],
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: fontSize,
//           ),
//         );
//         textPainter.layout();
//       }

//       final textX = textRadius - textPainter.width / 2;
//       final textY = -textPainter.height / 2;

//       textPainter.paint(canvas, Offset(textX, textY));
//       canvas.restore();
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
//
//
// //
// //
// //
//////////////////////////////////////
//

// class Roulette11 extends StatefulWidget {
//   const Roulette11({
//     super.key,
//     this.width,
//     this.height,
//   });

//   final double? width;
//   final double? height;

//   @override
//   State<Roulette11> createState() => _Roulette11State();
// }

// class _Roulette11State extends State<Roulette11>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late Animation<double> _rotation;
//   final TextEditingController _customController = TextEditingController();

//   String _currentGenre = 'body';
//   int _segments = 8;
//   List<String> _selectedOptions = [];

//   final Map<String, Map<String, dynamic>> localizedStrings = {
//     'ja': {
//       'roulette_title': '飲みゲー ルーレット',
//       'segments_label': '分割数: ',
//       'genre_label': 'ジャンルを選んでね',
//       'spinning_text': '回転中...',
//       'start_button': 'スタート',
//       'result_prefix': '結果: 「',
//       'result_suffix': '」に当てはまる人！',
//       'genres': {
//         'body': '身体的特徴',
//         'past': '過去の経験・所属',
//         'king': '王様ゲーム',
//         'daily': '日常的な行動',
//         'custom': 'カスタム',
//       },
//       'options': {
//         'body': ['女', '左利き', 'メガネ', 'コンタクト', 'ピアス', '二重', '全員飲め', '男'],
//         'past': ['運動部', '文化部', '理系', '文系', '一人暮らし', '実家暮らし', '留学経験', '全員飲め'],
//         'king': [
//           '選んだ2人飲め',
//           '選んだ3人飲め',
//           '回したやつ飲め',
//           '回したやつ以外飲め',
//           '選ばれたやつ飲め',
//           '両隣と飲め',
//           '両隣とハイタッチ',
//           '全員飲め'
//         ],
//         'daily': [
//           '朝食食べた',
//           '全員飲め',
//           '電車で来た',
//           'MBTIがE',
//           '全員飲む',
//           'MBTIがI',
//           'スマホ決済',
//           '現金派'
//         ],
//         'custom': [],
//       }
//     },
//     'en': {
//       'roulette_title': 'Drinking Game Roulette',
//       'segments_label': 'Segments: ',
//       'genre_label': 'Choose a genre',
//       'spinning_text': 'Spinning...',
//       'start_button': 'Start',
//       'result_prefix': 'Result: "',
//       'result_suffix': '"!',
//       'genres': {
//         'body': 'Physical Traits',
//         'past': 'Past Experience',
//         'king': 'King\'s Game',
//         'daily': 'Daily Habits',
//         'custom': 'Custom',
//       },
//       'options': {
//         'body': [
//           'Female',
//           'Left-handed',
//           'Glasses',
//           'Contacts',
//           'Piercings',
//           'Double eyelids',
//           'Everyone drinks',
//           'Male'
//         ],
//         'past': [
//           'Sports club',
//           'Cultural club',
//           'Science major',
//           'Liberal arts major',
//           'Living alone',
//           'Living at home',
//           'Study abroad',
//           'Everyone drinks'
//         ],
//         'king': [
//           '2 chosen people drink',
//           '3 chosen people drink',
//           'The spinner drinks',
//           'Everyone but the spinner drinks',
//           'The chosen person drinks',
//           'People next to you drink',
//           'High-five your neighbors',
//           'Everyone drinks'
//         ],
//         'daily': [
//           'Had breakfast',
//           'Everyone drinks',
//           'Came by train',
//           'MBTI is E',
//           'Everyone drinks',
//           'MBTI is I',
//           'Phone payment',
//           'Cash user'
//         ],
//         'custom': [],
//       }
//     }
//   };

//   String _resultText = '';
//   bool _isSpinning = false;

//   String _getTranslatedText(String key) {
//     final String languageCode = Localizations.localeOf(context).languageCode;
//     if (languageCode == 'ja') {
//       return localizedStrings['ja']![key]! as String;
//     } else {
//       return localizedStrings['en']![key]! as String;
//     }
//   }

//   Map<String, String> _getTranslatedGenres() {
//     final String languageCode = Localizations.localeOf(context).languageCode;
//     if (languageCode == 'ja') {
//       return localizedStrings['ja']!['genres'] as Map<String, String>;
//     } else {
//       return localizedStrings['en']!['genres'] as Map<String, String>;
//     }
//   }

//   List<String> _getTranslatedOptions(String genreKey) {
//     final String languageCode = Localizations.localeOf(context).languageCode;
//     if (languageCode == 'ja') {
//       return localizedStrings['ja']!['options']![genreKey] as List<String>;
//     } else {
//       return localizedStrings['en']!['options']![genreKey] as List<String>;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     );
//     _rotation = Tween<double>(begin: 0, end: 0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOutQuart,
//       ),
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _updateOptions();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _customController.dispose();
//     super.dispose();
//   }

//   void _updateOptions() {
//     if (_currentGenre == 'custom') {
//       if (_selectedOptions.isEmpty) {
//         _selectedOptions = ['カスタム項目を追加してください'];
//       }
//     } else {
//       final uniqueOptions =
//           _getTranslatedOptions(_currentGenre).toSet().toList();
//       uniqueOptions.shuffle();
//       _selectedOptions =
//           uniqueOptions.sublist(0, min(_segments, uniqueOptions.length));
//     }
//   }

//   void _setSegments(int value) {
//     if (_isSpinning) return;
//     setState(() {
//       _segments = value;
//       _updateOptions();
//     });
//   }

//   void _setGenre(String value) {
//     if (_isSpinning) return;
//     setState(() {
//       _currentGenre = value;
//       if (_currentGenre != 'custom') {
//         _updateOptions();
//       } else {
//         _selectedOptions = [];
//       }
//     });
//   }

//   void _addCustomOption(String value) {
//     if (_isSpinning) return;
//     final trimmed = value.trim();
//     if (trimmed.isEmpty || _selectedOptions.length >= 8) return;
//     setState(() {
//       _selectedOptions.add(trimmed);
//       _customController.clear();
//     });
//   }

//   void _spinRoulette() {
//     if (_isSpinning || _selectedOptions.isEmpty) return;

//     setState(() {
//       _isSpinning = true;
//       _resultText = '';
//     });

//     final segmentsCount = _selectedOptions.length;
//     final angleStep = 360.0 / segmentsCount;

//     // 偏りを減らすためランダム角度を直接生成
//     final randomAngle = Random().nextDouble() * 360;

//     const pointerOffset = 270.0;
//     final adjustedAngle = pointerOffset - randomAngle;
//     const totalRotations = 360.0 * 10;

//     final finalRotation = totalRotations + adjustedAngle;

//     _controller.reset();
//     _rotation =
//         Tween<double>(begin: 0, end: finalRotation * (pi / 180)).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOutQuart,
//       ),
//     );

//     _controller.animateTo(1.0).then((_) {
//       final landedIndex = ((randomAngle % 360) ~/ angleStep) % segmentsCount;
//       setState(() {
//         _isSpinning = false;
//         _resultText =
//             '${_getTranslatedText('result_prefix')}${_selectedOptions[landedIndex]}${_getTranslatedText('result_suffix')}';
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1A5F3A),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 _getTranslatedText('roulette_title'),
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                       color: Colors.white,
//                     ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '${_getTranslatedText('segments_label')}$_segments',
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                   SizedBox(
//                     width: 200,
//                     child: Slider(
//                       value: _segments.toDouble(),
//                       min: 4,
//                       max: 8,
//                       divisions: 4,
//                       onChanged: _isSpinning
//                           ? null
//                           : (val) => _setSegments(val.toInt()),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     _getTranslatedText('genre_label'),
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                   const SizedBox(width: 8),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: DropdownButton<String>(
//                       value: _currentGenre,
//                       items: _getTranslatedGenres().keys.map((String key) {
//                         return DropdownMenuItem<String>(
//                           value: key,
//                           child: Text(
//                             _getTranslatedGenres()[key]!,
//                             style: const TextStyle(
//                               fontSize: 15,
//                               color: Colors.black,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: _isSpinning
//                           ? null
//                           : (newValue) {
//                               if (newValue != null) {
//                                 _setGenre(newValue);
//                               }
//                             },
//                       underline: Container(),
//                       icon: const Icon(Icons.arrow_drop_down,
//                           color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//               // カスタム入力欄
//               if (_currentGenre == 'custom')
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               controller: _customController,
//                               decoration: const InputDecoration(
//                                 hintText: 'カスタム項目を入力してEnter',
//                                 fillColor: Colors.white,
//                                 filled: true,
//                               ),
//                               onSubmitted: _addCustomOption,
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               _addCustomOption(_customController.text);
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green[800],
//                             ),
//                             child: const Text('Enter'),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Wrap(
//                         spacing: 8,
//                         children: _selectedOptions.map((opt) {
//                           return Chip(
//                             label: Text(opt),
//                             onDeleted: () {
//                               setState(() {
//                                 _selectedOptions.remove(opt);
//                               });
//                             },
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 ),
//               const SizedBox(height: 32),
//               SizedBox(
//                 width: 330,
//                 height: 330,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     AnimatedBuilder(
//                       animation: _controller,
//                       builder: (context, child) {
//                         return Transform.rotate(
//                           angle: _rotation.value,
//                           child: CustomPaint(
//                             painter: RoulettePainter(
//                               segments: _selectedOptions.isEmpty
//                                   ? 1
//                                   : _selectedOptions.length,
//                               options: _selectedOptions.isEmpty
//                                   ? ['?']
//                                   : _selectedOptions,
//                             ),
//                             child: const SizedBox(
//                               width: 330,
//                               height: 330,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     const Positioned(
//                       top: -40,
//                       child: Icon(
//                         Icons.arrow_drop_down,
//                         color: Color(0xFFef4444),
//                         size: 90,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 32),
//               FFButtonWidget(
//                 onPressed: _isSpinning ? null : _spinRoulette,
//                 text: _isSpinning
//                     ? _getTranslatedText('spinning_text')
//                     : _getTranslatedText('start_button'),
//                 options: FFButtonOptions(
//                   width: 150,
//                   height: 50,
//                   color: Theme.of(context).primaryColor,
//                   textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
//                         fontFamily: 'Inter',
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                   borderSide: const BorderSide(
//                     color: Colors.transparent,
//                     width: 1,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 width: 330,
//                 child: FittedBox(
//                   fit: BoxFit.scaleDown,
//                   child: Text(
//                     _resultText,
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RoulettePainter extends CustomPainter {
//   final int segments;
//   final List<String> options;

//   RoulettePainter({required this.segments, required this.options});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;
//     final radius = size.width / 2;
//     final angleStep = 2 * pi / segments;
//     final colors = [
//       const Color(0xFFf4a261),
//       const Color(0xFFe76f51),
//       const Color(0xFF2a9d8f),
//       const Color(0xFFe9c46a),
//       const Color(0xFF264653),
//       const Color(0xFFd62828),
//       const Color(0xFFf77f00),
//       const Color(0xFF2ec4b6)
//     ];
//     final textPainter = TextPainter(textDirection: ui.TextDirection.ltr);

//     for (int i = 0; i < segments; i++) {
//       final paint = Paint()..color = colors[i % colors.length];
//       final startAngle = i * angleStep;
//       final sweepAngle = angleStep;

//       canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

//       final textAngle = startAngle + sweepAngle / 2;
//       final textRadius = radius * 0.7;

//       canvas.save();
//       canvas.translate(centerX, centerY);
//       canvas.rotate(textAngle);

//       double fontSize = 16.0;
//       final maxTextWidth = radius * 0.7;

//       textPainter.text = TextSpan(
//         text: options[i],
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: fontSize,
//         ),
//       );
//       textPainter.layout();

//       while (textPainter.width > maxTextWidth && fontSize > 8) {
//         fontSize--;
//         textPainter.text = TextSpan(
//           text: options[i],
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: fontSize,
//           ),
//         );
//         textPainter.layout();
//       }

//       final textX = textRadius - textPainter.width / 2;
//       final textY = -textPainter.height / 2;

//       textPainter.paint(canvas, Offset(textX, textY));
//       canvas.restore();
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

class Roulette11 extends StatefulWidget {
  const Roulette11({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Roulette11> createState() => _Roulette11State();
}

class _Roulette11State extends State<Roulette11>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _rotation;

  String _currentGenre = 'body';
  int _segments = 8;
  List<String> _selectedOptions = [];
  List<String> _customOptions = [];
  final TextEditingController _customController = TextEditingController();

  final Map<String, Map<String, dynamic>> localizedStrings = {
    'ja': {
      'roulette_title': '飲みゲー ルーレット',
      'segments_label': '分割数: ',
      'genre_label': 'ジャンルを選んでね',
      'spinning_text': '回転中...',
      'start_button': 'スタート',
      'result_prefix': '結果: 「',
      'result_suffix': '」に当てはまる人！',
      'genres': {
        'body': '身体的特徴',
        'past': '過去の経験・所属',
        'king': '王様ゲーム',
        'daily': '日常的な行動',
        'custom': 'カスタム',
      },
      'options': {
        'body': ['女', '左利き', 'メガネ', 'コンタクト', 'ピアス', '二重', '全員飲め', '男'],
        'past': ['運動部', '文化部', '理系', '文系', '一人暮らし', '実家暮らし', '留学経験', '全員飲め'],
        'king': [
          '選んだ2人飲め',
          '選んだ3人飲め',
          '回したやつ飲め',
          '回したやつ以外飲め',
          '選ばれたやつ飲め',
          '両隣と飲め',
          '両隣とハイタッチ',
          '全員飲め'
        ],
        'daily': [
          '朝食食べた',
          '全員飲め',
          '電車で来た',
          'MBTIがE',
          '全員飲む',
          'MBTIがI',
          'スマホ決済',
          '現金派'
        ],
        'custom': [],
      }
    },
    'en': {
      'roulette_title': 'Drinking Game Roulette',
      'segments_label': 'Segments: ',
      'genre_label': 'Choose a genre',
      'spinning_text': 'Spinning...',
      'start_button': 'Start',
      'result_prefix': 'Result: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Physical Traits',
        'past': 'Past Experience',
        'king': 'King\'s Game',
        'daily': 'Daily Habits',
        'custom': 'Custom',
      },
      'options': {
        'body': [
          'Female',
          'Left-handed',
          'Glasses',
          'Contacts',
          'Piercings',
          'Double eyelids',
          'Everyone drinks',
          'Male'
        ],
        'past': [
          'Sports club',
          'Cultural club',
          'Science major',
          'Liberal arts major',
          'Living alone',
          'Living at home',
          'Study abroad',
          'Everyone drinks'
        ],
        'king': [
          '2 chosen people drink',
          '3 chosen people drink',
          'The spinner drinks',
          'Everyone but the spinner drinks',
          'The chosen person drinks',
          'People next to you drink',
          'High-five your neighbors',
          'Everyone drinks'
        ],
        'daily': [
          'Had breakfast',
          'Everyone drinks',
          'Came by train',
          'MBTI is E',
          'Everyone drinks',
          'MBTI is I',
          'Phone payment',
          'Cash user'
        ],
        'custom': [],
      }
    }
  };

  String _resultText = '';
  bool _isSpinning = false;

  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    if (languageCode == 'ja') {
      return localizedStrings['ja']![key]! as String;
    } else {
      return localizedStrings['en']![key]! as String;
    }
  }

  Map<String, String> _getTranslatedGenres() {
    final String languageCode = Localizations.localeOf(context).languageCode;
    if (languageCode == 'ja') {
      return localizedStrings['ja']!['genres'] as Map<String, String>;
    } else {
      return localizedStrings['en']!['genres'] as Map<String, String>;
    }
  }

  List<String> _getTranslatedOptions(String genreKey) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    if (languageCode == 'ja') {
      return localizedStrings['ja']!['options']![genreKey] as List<String>;
    } else {
      return localizedStrings['en']!['options']![genreKey] as List<String>;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _rotation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuart,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateOptions();
  }

  @override
  void dispose() {
    _controller.dispose();
    _customController.dispose();
    super.dispose();
  }

  void _updateOptions() {
    if (_currentGenre == 'custom') {
      if (_customOptions.isEmpty) {
        _selectedOptions = ['カスタム項目を追加してください'];
      } else {
        _selectedOptions = List.from(_customOptions);
      }
    } else {
      final uniqueOptions =
          _getTranslatedOptions(_currentGenre).toSet().toList();
      uniqueOptions.shuffle();
      _selectedOptions =
          uniqueOptions.sublist(0, min(_segments, uniqueOptions.length));
    }
  }

  void _setSegments(int value) {
    if (_isSpinning) return;
    setState(() {
      _segments = value;
      _updateOptions();
    });
  }

  void _setGenre(String value) {
    if (_isSpinning) return;
    setState(() {
      _currentGenre = value;
      if (_currentGenre != 'custom') {
        _updateOptions();
      } else {
        _selectedOptions = List.from(_customOptions);
      }
    });
  }

  void _addCustomOption(String value) {
    if (_isSpinning) return;
    final trimmed = value.trim();
    if (trimmed.isEmpty || _selectedOptions.length >= 8) return;
    setState(() {
      _selectedOptions.add(trimmed);
      _customOptions.add(trimmed);
      _customController.clear();
    });
  }

  void _removeCustomOption(String value) {
    setState(() {
      _selectedOptions.remove(value);
      _customOptions.remove(value);
    });
  }

  void _spinRoulette() {
    if (_isSpinning || _selectedOptions.isEmpty) return;

    setState(() {
      _isSpinning = true;
      _resultText = '';
    });

    final angleStep = 360.0 / _selectedOptions.length;
    final finalIndex = Random().nextInt(_selectedOptions.length);
    final targetAngle = (finalIndex * angleStep) + (angleStep / 2);

    const pointerOffset = 270.0;
    final adjustedTargetAngle = pointerOffset - targetAngle;
    const totalRotations = 360.0 * 10;

    final finalRotation = totalRotations + adjustedTargetAngle;

    _controller.reset();

    _rotation =
        Tween<double>(begin: 0, end: finalRotation * (pi / 180)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuart,
      ),
    );

    _controller.animateTo(1.0).then((_) {
      setState(() {
        _isSpinning = false;
        _resultText =
            '${_getTranslatedText('result_prefix')}${_selectedOptions[finalIndex]}${_getTranslatedText('result_suffix')}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A5F3A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _getTranslatedText('roulette_title'),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_getTranslatedText('segments_label')}$_segments',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Slider(
                      value: _segments.toDouble(),
                      min: 4,
                      max: 8,
                      divisions: 4,
                      onChanged: _isSpinning
                          ? null
                          : (val) => _setSegments(val.toInt()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getTranslatedText('genre_label'),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: _currentGenre,
                      items: _getTranslatedGenres().keys.map((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(
                            _getTranslatedGenres()[key]!,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: _isSpinning
                          ? null
                          : (newValue) {
                              if (newValue != null) {
                                _setGenre(newValue);
                              }
                            },
                      underline: Container(),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              if (_currentGenre == 'custom')
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _customController,
                              decoration: const InputDecoration(
                                hintText: 'カスタム項目を入力してEnter',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onSubmitted: _addCustomOption,
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              _addCustomOption(_customController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800],
                            ),
                            child: const Text('Enter'),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _selectedOptions.map((opt) {
                          return Chip(
                            label: Text(opt),
                            onDeleted: () {
                              _removeCustomOption(opt);
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 32),
              SizedBox(
                width: 330,
                height: 330,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotation.value,
                          child: CustomPaint(
                            painter: RoulettePainter(
                              segments: _selectedOptions.isEmpty
                                  ? 1
                                  : _selectedOptions.length,
                              options: _selectedOptions.isEmpty
                                  ? ['?']
                                  : _selectedOptions,
                            ),
                            child: const SizedBox(
                              width: 330,
                              height: 330,
                            ),
                          ),
                        );
                      },
                    ),
                    const Positioned(
                      top: -40,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFFef4444),
                        size: 90,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              FFButtonWidget(
                onPressed: _isSpinning ? null : _spinRoulette,
                text: _isSpinning
                    ? _getTranslatedText('spinning_text')
                    : _getTranslatedText('start_button'),
                options: FFButtonOptions(
                  width: 150,
                  height: 50,
                  color: Theme.of(context).primaryColor,
                  textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 330,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _resultText,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoulettePainter extends CustomPainter {
  final int segments;
  final List<String> options;

  RoulettePainter({required this.segments, required this.options});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;
    final angleStep = 2 * pi / segments;
    final colors = [
      const Color(0xFFf4a261),
      const Color(0xFFe76f51),
      const Color(0xFF2a9d8f),
      const Color(0xFFe9c46a),
      const Color(0xFF264653),
      const Color(0xFFd62828),
      const Color(0xFFf77f00),
      const Color(0xFF2ec4b6)
    ];
    final textPainter = TextPainter(textDirection: ui.TextDirection.ltr);

    for (int i = 0; i < segments; i++) {
      final paint = Paint()..color = colors[i % colors.length];
      final startAngle = i * angleStep;
      final sweepAngle = angleStep;

      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

      final textAngle = startAngle + sweepAngle / 2;
      final textRadius = radius * 0.7;

      canvas.save();
      canvas.translate(centerX, centerY);
      canvas.rotate(textAngle);

      double fontSize = 16.0;
      final maxTextWidth = radius * 0.7;

      textPainter.text = TextSpan(
        text: options[i],
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
        ),
      );
      textPainter.layout();

      while (textPainter.width > maxTextWidth && fontSize > 8) {
        fontSize--;
        textPainter.text = TextSpan(
          text: options[i],
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        );
        textPainter.layout();
      }

      final textX = textRadius - textPainter.width / 2;
      final textY = -textPainter.height / 2;

      textPainter.paint(canvas, Offset(textX, textY));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
