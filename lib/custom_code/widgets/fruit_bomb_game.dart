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

class FruitBombGame extends StatefulWidget {
  const FruitBombGame({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<FruitBombGame> createState() => _FruitBombGameState();
}

class _FruitBombGameState extends State<FruitBombGame>
    with TickerProviderStateMixin {
  // final Map<String, Map<String, String>> _localizedStrings = {
  //   'ja': {
  //     'game_title': 'フルーツと爆弾ゲーム',
  //     'game_subtitle': '順番にサイコロを振ろう！',
  //     'game_message_start': 'サイコロを振ってください',
  //     'game_message_rolling': '振っています...',
  //     'game_message_safe': '結果: 爆弾はなし！セーフ！',
  //     'game_message_over': 'ゲームオーバー！爆弾に当たってしまった！',
  //     'game_message_clear': 'すべてのアイテムを消費しました！もう一度遊ぶにはボタンを押してください。',
  //     'button_roll': '振る！',
  //     'button_restart': 'リセットして遊ぶ',
  //   },
  //   'en': {
  //     'game_title': 'Fruit & Bomb Game',
  //     'game_subtitle': "Let's take turns rolling the dice!",
  //     'game_message_start': 'Roll the dice!',
  //     'game_message_rolling': 'Rolling...',
  //     'game_message_safe': 'Result: No bomb! Safe!',
  //     'game_message_over': 'Game Over! You hit the bomb!',
  //     'game_message_clear': 'All items used! Press the button to play again.',
  //     'button_roll': 'Roll!',
  //     'button_restart': 'Play Again',
  //   },
  // };

  final Map<String, Map<String, String>> _localizedStrings = {
    'ja': {
      'game_title': 'フルーツと爆弾ゲーム',
      'game_subtitle': '順番にサイコロを振ろう！',
      'game_message_start': 'サイコロを振ってください',
      'game_message_rolling': '振っています...',
      'game_message_safe': '結果: 爆弾はなし！セーフ！',
      'game_message_over': 'ゲームオーバー！爆弾に当たってしまった！',
      'game_message_clear': 'すべてのアイテムを消費しました！もう一度遊ぶにはボタンを押してください。',
      'button_roll': '振る！',
      'button_restart': 'リセットして遊ぶ',
    },
    'en': {
      'game_title': 'Fruit & Bomb Game',
      'game_subtitle': "Let's take turns rolling the dice!",
      'game_message_start': 'Roll the dice!',
      'game_message_rolling': 'Rolling...',
      'game_message_safe': 'Result: No bomb! Safe!',
      'game_message_over': 'Game Over! You hit the bomb!',
      'game_message_clear': 'All items used! Press the button to play again.',
      'button_roll': 'Roll!',
      'button_restart': 'Play Again',
    },
    'ru': {
      'game_title': 'Игра Фрукты и Бомбы',
      'game_subtitle': 'Бросайте кости по очереди!',
      'game_message_start': 'Бросайте кости!',
      'game_message_rolling': 'Бросаем...',
      'game_message_safe': 'Результат: Бомбы нет! Вы в безопасности!',
      'game_message_over': 'Игра окончена! Вы попали на бомбу!',
      'game_message_clear':
          'Все предметы использованы! Нажмите кнопку, чтобы сыграть снова.',
      'button_roll': 'Бросить!',
      'button_restart': 'Играть снова',
    },
    'vi': {
      'game_title': 'Trò chơi Trái cây & Bom',
      'game_subtitle': 'Hãy lần lượt tung xúc xắc!',
      'game_message_start': 'Hãy tung xúc xắc!',
      'game_message_rolling': 'Đang tung...',
      'game_message_safe': 'Kết quả: Không có bom! An toàn!',
      'game_message_over': 'Trò chơi kết thúc! Bạn đã trúng bom!',
      'game_message_clear': 'Đã dùng hết vật phẩm! Nhấn nút để chơi lại.',
      'button_roll': 'Tung!',
      'button_restart': 'Chơi lại',
    },
  };
  final List<String> fruits = ['🍎', '🍓', '🍌', '🍇', '🍉', '🥝', '🍑', '🍊'];
  final String bomb = '💣';
  List<String> itemPool = [];
  int? diceResult;
  bool isRolling = false;
  bool isGameOver = false;
  late AnimationController _diceController;
  late Animation<double> _diceAnimation;
  late AnimationController _explosionController;
  late Animation<double> _explosionAnimation;

  int initialLength = 13; // 初期アイテム数を保存
  String message = '';

  String _getLangCode(BuildContext context) {
    final code = Localizations.localeOf(context).languageCode;
    if (_localizedStrings.containsKey(code)) {
      return code;
    }
    return 'en';
  }

  String getText(BuildContext context, String key) {
    final lang = _getLangCode(context);
    return _localizedStrings[lang]?[key] ?? key;
  }

  @override
  void initState() {
    super.initState();
    _diceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _diceAnimation = Tween<double>(begin: 0, end: 720).animate(_diceController);

    _explosionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _explosionAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _explosionController,
        curve: Curves.easeInOut,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeItemPool();
    });
  }

  @override
  void dispose() {
    _diceController.dispose();
    _explosionController.dispose();
    super.dispose();
  }

  void initializeItemPool() {
    itemPool = [];
    final Random random = Random();

    initialLength = 13;

    // まずフルーツを全部入れる
    for (int i = 0; i < initialLength; i++) {
      itemPool.add(fruits[random.nextInt(fruits.length)]);
    }

    // 爆弾を必ず「後半」に配置する
    final halfIndex = (itemPool.length / 2).floor();
    final bombIndex = random.nextInt(itemPool.length - halfIndex) + halfIndex;
    itemPool[bombIndex] = bomb;

    setState(() {
      isGameOver = false;
      message = getText(context, 'game_message_start');
      diceResult = null;
    });
  }

  Future<void> rollDice() async {
    if (isRolling) return;
    setState(() {
      isRolling = true;
      message = getText(context, 'game_message_rolling');
      diceResult = null;
    });

    final Random random = Random();
    final remainingItems = itemPool.length;

    int result;
    final isBombImminent = remainingItems > 0 &&
        itemPool.sublist(0, min(remainingItems, 2)).contains(bomb);
    if (isBombImminent && random.nextDouble() < 0.20) {
      result = 0;
    } else {
      result = random.nextInt(3) + 1;
    }

    await _diceController.forward(from: 0.0);
    setState(() {
      diceResult = result;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    // 1つずつフルーツを削除
    for (int i = 0; i < result; i++) {
      if (itemPool.isEmpty) break;

      final removedItem = itemPool.removeAt(0);
      setState(() {}); // UI更新

      if (removedItem == bomb) {
        setState(() {
          isGameOver = true;
          message = getText(context, 'game_message_over');
        });
        await _explosionController.forward(from: 0.0);
        break;
      }

      await Future.delayed(const Duration(milliseconds: 400)); // 1つずつ減る速度
    }

    if (!isGameOver) {
      setState(() {
        message = itemPool.isEmpty
            ? getText(context, 'game_message_clear')
            : getText(context, 'game_message_safe');
      });
    }

    setState(() {
      isRolling = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double stepX = 42.0;
    const double stepY = 21.0;
    final double pivotX = stepX * (initialLength ~/ 2);

    return Scaffold(
      backgroundColor: const Color(0xFF166534),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: AnimatedBuilder(
            animation: _explosionAnimation,
            builder: (context, child) {
              final xShake =
                  isGameOver ? sin(_explosionAnimation.value) * 10 : 0.0;
              final yShake =
                  isGameOver ? cos(_explosionAnimation.value) * 10 : 0.0;
              return Transform.translate(
                offset: Offset(xShake, yShake),
                child: child,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getText(context, 'game_title'),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFa7f3d0),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  getText(context, 'game_subtitle'),
                  style: const TextStyle(
                    color: Color(0xFFd1fae5),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _diceAnimation,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(toRadians(_diceAnimation.value))
                        ..rotateX(toRadians(_diceAnimation.value)),
                      alignment: Alignment.center,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4ade80),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            diceResult == null ? '?' : diceResult.toString(),
                            style: const TextStyle(
                              fontSize: 64,
                              color: Color(0xFF166534),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: initialLength * stepX,
                      height: 300,
                      child: Stack(
                        children: itemPool.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;

                          double x;
                          double y;
                          final int midpoint = initialLength ~/ 2;

                          if (index < midpoint) {
                            x = index * stepX;
                            y = index * stepY;
                          } else {
                            final int indexAfterMid = index - midpoint;
                            x = stepX * midpoint - indexAfterMid * stepX;
                            y = index * stepY;
                          }
                          return Positioned(
                            left: x,
                            bottom: y,
                            child: Fruit(
                              item: item,
                              isBomb: item == bomb,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 20,
                    color: isGameOver
                        ? const Color(0xFFef4444)
                        : const Color(0xFFe5e7eb),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isRolling
                        ? null
                        : () {
                            if (isGameOver || itemPool.isEmpty) {
                              actions
                                  .showInterstitialAdCustom(); ///////////////////////////////////
                              initializeItemPool();
                            } else {
                              rollDice();
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFF4ade80),
                      foregroundColor: const Color(0xFF166534),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      isGameOver || itemPool.isEmpty
                          ? getText(context, 'button_restart')
                          : getText(context, 'button_roll'),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double toRadians(double degrees) {
    return degrees * pi / 180;
  }
}

class Fruit extends StatefulWidget {
  const Fruit({
    super.key,
    required this.item,
    required this.isBomb,
  });

  final String item;
  final bool isBomb;

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    if (widget.isBomb) {
      _shakeController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant Fruit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isBomb != oldWidget.isBomb) {
      if (widget.isBomb) {
        _shakeController.repeat(reverse: true);
      } else {
        _shakeController.stop();
      }
    }
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            widget.isBomb ? sin(_shakeController.value * 2 * pi) * 5 : 0,
            0,
          ),
          child: child,
        );
      },
      child: Text(
        widget.item,
        style: const TextStyle(fontSize: 48),
      ),
    );
  }
}
