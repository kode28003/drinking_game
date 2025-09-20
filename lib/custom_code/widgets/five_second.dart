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

// import 'dart:async';
// import 'dart:math';
// import 'package:auto_size_text/auto_size_text.dart';

// class FiveSecond extends StatefulWidget {
//   const FiveSecond({
//     super.key,
//     this.width,
//     this.height,
//   });

//   final double? width;
//   final double? height;

//   @override
//   State<FiveSecond> createState() => _FiveSecondState();
// }

// class _FiveSecondState extends State<FiveSecond>
//     with SingleTickerProviderStateMixin {
//   late Stopwatch _stopwatch;
//   late Timer _timer;
//   String _displayText = '0.000';
//   String _message = '「スタート」を押してね。';
//   Color _messageColor = const Color(0xffd1fae5);
//   bool _timerVisible = true;
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _stopwatch = Stopwatch();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _controller.dispose();
//     super.dispose();
//   }

//   void _startTimer() {
//     setState(() {
//       _stopwatch.reset();
//       _stopwatch.start();
//       _message = 'スタート！';
//       _messageColor = const Color(0xffd1fae5);
//       _displayText = '0.000';
//       _timerVisible = true;
//     });

//     _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
//       setState(() {
//         _displayText =
//             (_stopwatch.elapsed.inMilliseconds / 1000).toStringAsFixed(3);
//       });
//     });

//     Timer(const Duration(seconds: 1), () {
//       setState(() {
//         _timerVisible = false;
//         _message = '隠れた！5秒でストップしてね！';
//       });
//     });
//   }

//   void _stopTimer() {
//     if (!_stopwatch.isRunning) return;
//     _stopwatch.stop();
//     _timer.cancel();

//     final double finalTime = _stopwatch.elapsed.inMilliseconds / 1000;
//     final double difference = (finalTime - 5.0).abs();

//     if (difference <= 0.2) {
//       setState(() {
//         _message = '大成功！誤差 ${difference.toStringAsFixed(3)}秒でした！';
//         _messageColor = const Color(0xfffacc15);
//       });
//       _controller.forward(from: 0.0);
//     } else {
//       setState(() {
//         _message = '残念...誤差 ${difference.toStringAsFixed(3)}秒でした。';
//         _messageColor = const Color(0xffd1fae5);
//       });
//     }

//     setState(() {
//       _timerVisible = true;
//       _displayText = finalTime.toStringAsFixed(3);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width,
//       height: widget.height,
//       padding: const EdgeInsets.all(8), // ✅ 外側余白
//       color: const Color(0xff1a5f3a),
//       child: Center(
//         child: Container(
//           padding: const EdgeInsets.all(40.0),
//           decoration: BoxDecoration(
//             color: const Color(0xff2c6e49),
//             borderRadius: BorderRadius.circular(24.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 5,
//                 blurRadius: 10,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               AutoSizeText(
//                 '5秒ぴったりゲーム',
//                 style: const TextStyle(
//                   fontSize: 36.0,
//                   color: Color(0xffd1fae5),
//                   shadows: [
//                     Shadow(
//                       blurRadius: 4.0,
//                       color: Color(0xff000000),
//                       offset: Offset(2, 2),
//                     ),
//                   ],
//                 ),
//                 maxLines: 1, // ✅ 自動調整で1行
//                 minFontSize: 18,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 16.0),
//               SizedBox(
//                 height: 32,
//                 child: Text(
//                   _message,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: _messageColor,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 24.0),
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   AnimatedBuilder(
//                     animation: _controller,
//                     builder: (context, child) {
//                       return Transform.scale(
//                         scale: _controller.isAnimating
//                             ? _scaleAnimation.value
//                             : 1.0,
//                         child: Text(
//                           _displayText,
//                           style: TextStyle(
//                             fontSize: 80.0,
//                             fontWeight: FontWeight.bold,
//                             color: _stopwatch.isRunning
//                                 ? const Color(0xffd1fae5)
//                                 : (_stopwatch.elapsed.inMilliseconds / 1000 -
//                                                 5.0)
//                                             .abs() <=
//                                         0.2
//                                     ? const Color(0xff86efac)
//                                     : const Color(0xffd1fae5),
//                           ),
//                         ),
//                       );
//                     },
//                   ),

//                   // 🎨 おしゃれ隠し演出
//                   AnimatedOpacity(
//                     opacity: _timerVisible ? 0.0 : 1.0,
//                     duration: const Duration(milliseconds: 600),
//                     curve: Curves.easeInOut,
//                     child: AnimatedScale(
//                       scale: _timerVisible ? 0.8 : 1.0,
//                       duration: const Duration(milliseconds: 600),
//                       curve: Curves.easeOutBack,
//                       child: Container(
//                         width: 260,
//                         height: 110,
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Colors.white, Color(0xfff0f0f0)],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(16.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 12,
//                               spreadRadius: 2,
//                               offset: const Offset(0, 6),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24.0),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: _stopwatch.isRunning ? null : _startTimer,
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: const Color(0xff1a5f3a),
//                         backgroundColor: const Color(0xffd1fae5),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 16),
//                         textStyle: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text('スタート'),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: _stopwatch.isRunning ? _stopTimer : null,
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: const Color(0xff1a5f3a),
//                         backgroundColor: const Color(0xffd1fae5),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 16),
//                         textStyle: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text('ストップ'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';

class FiveSecond extends StatefulWidget {
  const FiveSecond({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<FiveSecond> createState() => _FiveSecondState();
}

class _FiveSecondState extends State<FiveSecond>
    with SingleTickerProviderStateMixin {
  late Stopwatch _stopwatch;
  Timer? _timer; // ❗ null安全に変更
  String _displayText = '0.000';
  String _message = '';
  Color _messageColor = const Color(0xffd1fae5);
  bool _timerVisible = true;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  /// 🌍 多言語対応マップ
  final Map<String, Map<String, String>> _localizedStrings = {
    'ja': {
      'title': '5秒ぴったりゲーム',
      'start_hint': '「スタート」を押してね。',
      'start': 'スタート！',
      'hidden': '隠れた！5秒でストップしてね！',
      'success': '大成功！誤差 {diff}秒でした！',
      'fail': '残念...誤差 {diff}秒でした。',
      'btn_start': 'スタート',
      'btn_stop': 'ストップ',
    },
    'ru': {
      'title': 'Игра «Ровно 5 секунд»',
      'start_hint': 'Нажми «Старт».',
      'start': 'Поехали!',
      'hidden': 'Скрыто! Останови на 5 секундах!',
      'success': 'Отлично! Ошибка {diff} секунд!',
      'fail': 'Жаль... Ошибка {diff} секунд.',
      'btn_start': 'Старт',
      'btn_stop': 'Стоп',
    },
    'vi': {
      'title': 'Trò chơi đúng 5 giây',
      'start_hint': 'Nhấn "Bắt đầu".',
      'start': 'Bắt đầu!',
      'hidden': 'Đã ẩn! Dừng lại sau 5 giây!',
      'success': 'Thành công! Sai số {diff} giây!',
      'fail': 'Tiếc quá... Sai số {diff} giây.',
      'btn_start': 'Bắt đầu',
      'btn_stop': 'Dừng lại',
    },
    'en': {
      'title': '5-Second Challenge',
      'start_hint': 'Press "Start".',
      'start': 'Go!',
      'hidden': 'Hidden! Stop at 5 seconds!',
      'success': 'Great! Off by {diff} seconds!',
      'fail': 'Too bad... Off by {diff} seconds.',
      'btn_start': 'Start',
      'btn_stop': 'Stop',
    },
  };

  /// 🌍 言語取得
  String _getLangCode(BuildContext context) {
    final code = Localizations.localeOf(context).languageCode;
    if (_localizedStrings.containsKey(code)) {
      return code;
    }
    return 'en'; // デフォルト英語
  }

  String _tr(BuildContext context, String key, {String diff = ''}) {
    final lang = _getLangCode(context);
    final template = _localizedStrings[lang]?[key] ?? key;
    return template.replaceAll('{diff}', diff);
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    // ❗ contextを使わない
    _message = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ✅ contextを使う処理はこちらでOK
    setState(() {
      _message = _tr(context, 'start_hint');
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // ❗ nullチェック追加
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _stopwatch.reset();
      _stopwatch.start();
      _message = _tr(context, 'start');
      _messageColor = const Color(0xffd1fae5);
      _displayText = '0.000';
      _timerVisible = true;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _displayText =
            (_stopwatch.elapsed.inMilliseconds / 1000).toStringAsFixed(3);
      });
    });

    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _timerVisible = false;
          _message = _tr(context, 'hidden');
        });
      }
    });
  }

  void _stopTimer() {
    if (!_stopwatch.isRunning) return;
    _stopwatch.stop();
    _timer?.cancel();

    final double finalTime = _stopwatch.elapsed.inMilliseconds / 1000;
    final double difference = (finalTime - 5.0).abs();

    if (difference <= 0.2) {
      setState(() {
        _message = _tr(context, 'success', diff: difference.toStringAsFixed(3));
        _messageColor = const Color(0xfffacc15);
      });
      _controller.forward(from: 0.0);
    } else {
      setState(() {
        _message = _tr(context, 'fail', diff: difference.toStringAsFixed(3));
        _messageColor = const Color(0xffd1fae5);
      });
    }

    setState(() {
      _timerVisible = true;
      _displayText = finalTime.toStringAsFixed(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = _getLangCode(context);

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(8),
      color: const Color(0xff1a5f3a),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          decoration: BoxDecoration(
            color: const Color(0xff2c6e49),
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AutoSizeText(
                _tr(context, 'title'),
                style: const TextStyle(
                  fontSize: 36.0,
                  color: Color(0xffd1fae5),
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Color(0xff000000),
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                maxLines: 1,
                minFontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 32,
                child: Text(
                  _message,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: _messageColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _controller.isAnimating
                            ? _scaleAnimation.value
                            : 1.0,
                        child: Text(
                          _displayText,
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: _stopwatch.isRunning
                                ? const Color(0xffd1fae5)
                                : (_stopwatch.elapsed.inMilliseconds / 1000 -
                                                5.0)
                                            .abs() <=
                                        0.2
                                    ? const Color(0xff86efac)
                                    : const Color(0xffd1fae5),
                          ),
                        ),
                      );
                    },
                  ),

                  // 🎨 隠すエフェクト
                  AnimatedOpacity(
                    opacity: _timerVisible ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    child: AnimatedScale(
                      scale: _timerVisible ? 0.8 : 1.0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOutBack,
                      child: Container(
                        width: 260,
                        height: 110,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.white, Color(0xfff0f0f0)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 12,
                              spreadRadius: 2,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _stopwatch.isRunning ? null : _startTimer,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xff1a5f3a),
                        backgroundColor: const Color(0xffd1fae5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(_tr(context, 'btn_start')),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _stopwatch.isRunning ? _stopTimer : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xff1a5f3a),
                        backgroundColor: const Color(0xffd1fae5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(_tr(context, 'btn_stop')),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
