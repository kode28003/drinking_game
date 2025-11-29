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

class CardModel {
  final String suit;
  final String value;
  final int strength;

  CardModel({required this.suit, required this.value, required this.strength});
}

// プレイヤーを表すモデルクラス
class PlayerModel {
  final String name;
  CardModel? card1;
  CardModel? card2;
  bool isLoser = false;
  double winProbability = 0.0;
  String handName = '';

  PlayerModel({required this.name});
}

/// ポーカーゲームのロジックを統合したステートフルウィジェット
class PokerTest extends StatefulWidget {
  const PokerTest({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<PokerTest> createState() => _PokerTestState();
}

class _PokerTestState extends State<PokerTest> {
  final Map<String, Map<String, dynamic>> localizedStrings = {
    'ja': {
      'game_start_message': '参加人数を選び、ゲームを開始しよう！',
      'dealing_cards': 'カードを配っています...',
      'cards_dealt': '全員のカードがめくられました。',
      'flop': 'フロップ！3枚のカードがめくられます。',
      'turn': 'ターン！4枚目のカードがめくられます。',
      'river': 'リバー！最後のカードがめくられます。',
      'is_loser': 'が敗者です！',
      'no_loser': '誰も負けではありません！',
      'player_count_label': 'プレイヤー数',
      'player': 'プレイヤー ',
      'win_probability': '勝率',
      'loser': '敗者',
      'in_progress': '進行中...',
      'start_game': 'ゲームを開始',
      'play_again': 'もう一度ゲーム',
      'hand_ranks': {
        1: 'ハイカード',
        2: 'ワンペア',
        3: 'ツーペア',
        4: 'スリーカード',
        5: 'ストレート',
        6: 'フラッシュ',
        7: 'フルハウス',
        8: 'フォーカード',
        9: 'ストレートフラッシュ',
      }
    },
    'en': {
      'game_start_message': 'Choose the number of players and start the game!',
      'dealing_cards': 'Dealing cards...',
      'cards_dealt': 'All cards have been revealed.',
      'flop': 'Flop! 3 community cards will be revealed.',
      'turn': 'Turn! The 4th card will be revealed.',
      'river': 'River! The last card will be revealed.',
      'is_loser': ' is the loser!',
      'no_loser': 'No one is a loser!',
      'player_count_label': 'Number of Players',
      'player': 'Player ',
      'win_probability': 'Win Probability',
      'loser': 'Loser',
      'in_progress': 'In Progress...',
      'start_game': 'Start Game',
      'play_again': 'Play Again',
      'hand_ranks': {
        1: 'High Card',
        2: 'One Pair',
        3: 'Two Pair',
        4: 'Three of a Kind',
        5: 'Straight',
        6: 'Flush',
        7: 'Full House',
        8: 'Four of a Kind',
        9: 'Straight Flush',
      }
    },
    'zh': {
      'game_start_message': '选择玩家人数并开始游戏！',
      'dealing_cards': '正在发牌...',
      'cards_dealt': '所有的牌都已揭晓。',
      'flop': '翻牌！将揭示3张公共牌。',
      'turn': '转牌！将揭示第4张牌。',
      'river': '河牌！将揭示最后一张牌。',
      'is_loser': ' 是输家！',
      'no_loser': '没有人是输家！',
      'player_count_label': '玩家人数',
      'player': '玩家 ',
      'win_probability': '胜率',
      'loser': '输家',
      'in_progress': '进行中...',
      'start_game': '开始游戏',
      'play_again': '再玩一次',
      'hand_ranks': {
        1: '高牌',
        2: '一对',
        3: '两对',
        4: '三条',
        5: '顺子',
        6: '同花',
        7: '葫芦',
        8: '四条',
        9: '同花顺',
      }
    },
    'fr': {
      'game_start_message':
          'Choisissez le nombre de joueurs et commencez la partie !',
      'dealing_cards': 'Distribution des cartes...',
      'cards_dealt': 'Toutes les cartes ont été révélées.',
      'flop': 'Flop ! 3 cartes communes seront révélées.',
      'turn': 'Turn ! La 4ème carte sera révélée.',
      'river': 'River ! La dernière carte sera révélée.',
      'is_loser': ' est le perdant !',
      'no_loser': "Personne n'a perdu !",
      'player_count_label': 'Nombre de joueurs',
      'player': 'Joueur ',
      'win_probability': 'Probabilité de gagner',
      'loser': 'Perdant',
      'in_progress': 'En cours...',
      'start_game': 'Démarrer le jeu',
      'play_again': 'Rejouer',
      'hand_ranks': {
        1: 'Carte haute',
        2: 'Une paire',
        3: 'Deux paires',
        4: 'Brelan',
        5: 'Quinte',
        6: 'Couleur',
        7: 'Full',
        8: 'Carré',
        9: 'Quinte flush',
      }
    },
    'es': {
      'game_start_message':
          '¡Elige el número de jugadores y comienza el juego!',
      'dealing_cards': 'Repartiendo cartas...',
      'cards_dealt': 'Todas las cartas han sido reveladas.',
      'flop': '¡Flop! Se revelarán 3 cartas comunitarias.',
      'turn': '¡Turno! Se revelará la cuarta carta.',
      'river': '¡Río! Se revelará la última carta.',
      'is_loser': ' es el perdedor!',
      'no_loser': '¡Nadie pierde!',
      'player_count_label': 'Número de jugadores',
      'player': 'Jugador ',
      'win_probability': 'Probabilidad de ganar',
      'loser': 'Perdedor',
      'in_progress': 'En progreso...',
      'start_game': 'Comenzar juego',
      'play_again': 'Jugar de nuevo',
      'hand_ranks': {
        1: 'Carta alta',
        2: 'Un par',
        3: 'Doble par',
        4: 'Trío',
        5: 'Escalera',
        6: 'Color',
        7: 'Full',
        8: 'Póker',
        9: 'Escalera de color',
      }
    },
    'de': {
      'game_start_message': 'Wähle die Spieleranzahl und starte das Spiel!',
      'dealing_cards': 'Karten werden ausgeteilt...',
      'cards_dealt': 'Alle Karten wurden aufgedeckt.',
      'flop': 'Flop! 3 Gemeinschaftskarten werden aufgedeckt.',
      'turn': 'Turn! Die 4. Karte wird aufgedeckt.',
      'river': 'River! Die letzte Karte wird aufgedeckt.',
      'is_loser': ' ist der Verlierer!',
      'no_loser': 'Niemand hat verloren!',
      'player_count_label': 'Spieleranzahl',
      'player': 'Spieler ',
      'win_probability': 'Gewinnwahrscheinlichkeit',
      'loser': 'Verlierer',
      'in_progress': 'Läuft...',
      'start_game': 'Spiel starten',
      'play_again': 'Nochmal spielen',
      'hand_ranks': {
        1: 'Hohe Karte',
        2: 'Ein Paar',
        3: 'Zwei Paare',
        4: 'Drilling',
        5: 'Straße',
        6: 'Flush',
        7: 'Full House',
        8: 'Vierling',
        9: 'Straight Flush',
      }
    },
    'ms': {
      'game_start_message': 'Pilih bilangan pemain dan mula permainan!',
      'dealing_cards': 'Mengedarkan kad...',
      'cards_dealt': 'Semua kad telah dibuka.',
      'flop': 'Flop! 3 kad dibuka.',
      'turn': 'Turn! Kad ke-4 dibuka.',
      'river': 'River! Kad terakhir dibuka.',
      'is_loser': 'telah kalah!',
      'no_loser': 'Tiada sesiapa yang kalah!',
      'player_count_label': 'Bilangan Pemain',
      'player': 'Pemain ',
      'win_probability': 'Kebarangkalian Menang',
      'loser': 'Pemain Kalah',
      'in_progress': 'Sedang berjalan...',
      'start_game': 'Mula Permainan',
      'play_again': 'Main Semula',
      'hand_ranks': {
        1: 'Kad Tinggi',
        2: 'Sepasang',
        3: 'Dua Pasang',
        4: 'Tiga Seiras',
        5: 'Lurus',
        6: 'Flush',
        7: 'Full House',
        8: 'Empat Seiras',
        9: 'Straight Flush',
      }
    },
    'ko': {
      'game_start_message': '플레이어 수를 선택하고 게임을 시작하세요!',
      'dealing_cards': '카드를 나누는 중...',
      'cards_dealt': '모든 카드가 공개되었습니다.',
      'flop': '플롭! 3장의 커뮤니티 카드가 공개됩니다.',
      'turn': '턴! 네 번째 카드가 공개됩니다.',
      'river': '리버! 마지막 카드가 공개됩니다.',
      'is_loser': ' 패배자입니다!',
      'no_loser': '패배자는 없습니다!',
      'player_count_label': '플레이어 수',
      'player': '플레이어 ',
      'win_probability': '승리 확률',
      'loser': '패배자',
      'in_progress': '진행 중...',
      'start_game': '게임 시작',
      'play_again': '다시 하기',
      'hand_ranks': {
        1: '하이카드',
        2: '원페어',
        3: '투페어',
        4: '트리플',
        5: '스트레이트',
        6: '플러시',
        7: '풀하우스',
        8: '포카드',
        9: '스트레이트 플러시',
      }
    },
    'ru': {
      'game_start_message': 'Выберите количество игроков и начните игру!',
      'dealing_cards': 'Раздача карт...',
      'cards_dealt': 'Все карты были открыты.',
      'flop': 'Флоп! Будут открыты 3 карты.',
      'turn': 'Терн! Будет открыта 4-я карта.',
      'river': 'Ривер! Будет открыта последняя карта.',
      'is_loser': ' проиграл!',
      'no_loser': 'Никто не проиграл!',
      'player_count_label': 'Количество игроков',
      'player': 'Игрок ',
      'win_probability': 'Вероятность победы',
      'loser': 'Проигравший',
      'in_progress': 'В процессе...',
      'start_game': 'Начать игру',
      'play_again': 'Играть снова',
      'hand_ranks': {
        1: 'Старшая карта',
        2: 'Одна пара',
        3: 'Две пары',
        4: 'Сет',
        5: 'Стрит',
        6: 'Флеш',
        7: 'Фул-хаус',
        8: 'Каре',
        9: 'Стрит-флеш',
      }
    },
    'vi': {
      'game_start_message': 'Chọn số người chơi và bắt đầu trò chơi!',
      'dealing_cards': 'Đang chia bài...',
      'cards_dealt': 'Tất cả các lá bài đã được lật lên.',
      'flop': 'Flop! 3 lá bài chung sẽ được lật.',
      'turn': 'Turn! Lá bài thứ 4 sẽ được lật.',
      'river': 'River! Lá bài cuối cùng sẽ được lật.',
      'is_loser': ' là người thua!',
      'no_loser': 'Không ai thua cả!',
      'player_count_label': 'Số người chơi',
      'player': 'Người chơi ',
      'win_probability': 'Xác suất thắng',
      'loser': 'Người thua',
      'in_progress': 'Đang diễn ra...',
      'start_game': 'Bắt đầu trò chơi',
      'play_again': 'Chơi lại',
      'hand_ranks': {
        1: 'Bài cao',
        2: 'Một đôi',
        3: 'Hai đôi',
        4: 'Bộ ba',
        5: 'Sảnh',
        6: 'Thùng',
        7: 'Cù lũ',
        8: 'Tứ quý',
        9: 'Sảnh thùng',
      }
    },
    'it': {
      'game_start_message':
          'Scegli il numero di giocatori e inizia la partita!',
      'dealing_cards': 'Distribuzione delle carte...',
      'cards_dealt': 'Tutte le carte sono state rivelate.',
      'flop': 'Flop! Verranno rivelate 3 carte comuni.',
      'turn': 'Turn! Verrà rivelata la 4ª carta.',
      'river': 'River! Verrà rivelata l’ultima carta.',
      'is_loser': ' ha perso!',
      'no_loser': 'Nessuno ha perso!',
      'player_count_label': 'Numero di giocatori',
      'player': 'Giocatore ',
      'win_probability': 'Probabilità di vincita',
      'loser': 'Perdente',
      'in_progress': 'In corso...',
      'start_game': 'Inizia partita',
      'play_again': 'Gioca di nuovo',
      'hand_ranks': {
        1: 'Carta alta',
        2: 'Coppia',
        3: 'Doppia coppia',
        4: 'Tris',
        5: 'Scala',
        6: 'Colore',
        7: 'Full',
        8: 'Poker',
        9: 'Scala reale',
      }
    },
    'pt': {
      'game_start_message': 'Escolha o número de jogadores e comece o jogo!',
      'dealing_cards': 'Distribuindo cartas...',
      'cards_dealt': 'Todas as cartas foram reveladas.',
      'flop': 'Flop! 3 cartas comunitárias serão reveladas.',
      'turn': 'Turno! A 4ª carta será revelada.',
      'river': 'River! A última carta será revelada.',
      'is_loser': ' é o perdedor!',
      'no_loser': 'Ninguém perdeu!',
      'player_count_label': 'Número de jogadores',
      'player': 'Jogador ',
      'win_probability': 'Probabilidade de vitória',
      'loser': 'Perdedor',
      'in_progress': 'Em andamento...',
      'start_game': 'Iniciar jogo',
      'play_again': 'Jogar novamente',
      'hand_ranks': {
        1: 'Carta alta',
        2: 'Um par',
        3: 'Dois pares',
        4: 'Trinca',
        5: 'Sequência',
        6: 'Flush',
        7: 'Full House',
        8: 'Quadra',
        9: 'Straight Flush',
      }
    },
    'ar': {
      'game_start_message': 'اختر عدد اللاعبين وابدأ اللعبة!',
      'dealing_cards': 'يتم توزيع الأوراق...',
      'cards_dealt': 'تم الكشف عن جميع الأوراق.',
      'flop': 'فلوب! سيتم كشف 3 أوراق مشتركة.',
      'turn': 'تيرن! سيتم كشف الورقة الرابعة.',
      'river': 'ريفر! سيتم كشف الورقة الأخيرة.',
      'is_loser': ' هو الخاسر!',
      'no_loser': 'لا أحد خاسر!',
      'player_count_label': 'عدد اللاعبين',
      'player': 'لاعب ',
      'win_probability': 'احتمال الفوز',
      'loser': 'الخاسر',
      'in_progress': 'قيد التنفيذ...',
      'start_game': 'ابدأ اللعبة',
      'play_again': 'العب مرة أخرى',
      'hand_ranks': {
        1: 'أعلى ورقة',
        2: 'زوج',
        3: 'زوجان',
        4: 'ثلاثة من نفس النوع',
        5: 'سلسلة',
        6: 'لون',
        7: 'فول هاوس',
        8: 'أربعة من نفس النوع',
        9: 'سلسلة ملونة',
      }
    },
    'hi': {
      'game_start_message': 'खिलाड़ियों की संख्या चुनें और खेल शुरू करें!',
      'dealing_cards': 'पत्ते बाँटे जा रहे हैं...',
      'cards_dealt': 'सभी पत्ते खोल दिए गए हैं।',
      'flop': 'फ्लॉप! 3 सामुदायिक पत्ते खोले जाएंगे।',
      'turn': 'टर्न! चौथा पत्ता खोला जाएगा।',
      'river': 'रिवर! आखिरी पत्ता खोला जाएगा।',
      'is_loser': ' हार गया!',
      'no_loser': 'कोई नहीं हारा!',
      'player_count_label': 'खिलाड़ियों की संख्या',
      'player': 'खिलाड़ी ',
      'win_probability': 'जीतने की संभावना',
      'loser': 'हारने वाला',
      'in_progress': 'प्रगति पर...',
      'start_game': 'खेल शुरू करें',
      'play_again': 'फिर से खेलें',
      'hand_ranks': {
        1: 'ऊँचा पत्ता',
        2: 'एक जोड़ी',
        3: 'दो जोड़ी',
        4: 'तीन एक जैसे',
        5: 'सीढ़ी',
        6: 'फ्लश',
        7: 'फुल हाउस',
        8: 'चार एक जैसे',
        9: 'स्ट्रेट फ्लश',
      }
    },
  };

  // ゲームの定数
  final List<String> suits = ['♠️', '♣️', '♦️', '♥️'];
  final List<String> values = [
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
    'K',
    'A'
  ];
  final Map<String, int> cardValuesMap = {
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'J': 11,
    'Q': 12,
    'K': 13,
    'A': 14
  };

  // ゲームの状態変数
  List<PlayerModel> _players = [];
  List<CardModel> _deck = [];
  List<CardModel> _communityCards = [];
  int _playerCount = 2;
  bool _gameStarted = false;
  String _gameMessage = '';
  bool _isLoading = false;
  int _startCount = 0;

  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return localizedStrings[languageCode]?[key] ??
        localizedStrings['en']![key]!;
  }

  String _getHandName(int rank) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return (localizedStrings[languageCode]?['hand_ranks'] ??
        localizedStrings['en']!['hand_ranks'] as Map<int, String>)[rank]!;
  }

  @override
  void initState() {
    super.initState();
    // initStateではcontextに依存する処理を行わない
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // contextが利用可能になった後で初期メッセージを設定
    _gameMessage = _getTranslatedText('game_start_message');
    _players = List.generate(
      _playerCount,
      (index) =>
          PlayerModel(name: '${_getTranslatedText('player')}${index + 1}'),
    );
  }

  // デッキを作成してシャッフルする
  void _createAndShuffleDeck() {
    _deck = [];
    for (var suit in suits) {
      for (var value in values) {
        _deck.add(CardModel(
            suit: suit, value: value, strength: cardValuesMap[value]!));
      }
    }
    _deck.shuffle();
  }

  // ゲームをリセットし、新しいプレイヤーを作成する
  void _resetGame() {
    if (!mounted) return;
    setState(() {
      _gameStarted = false;
      _isLoading = false;
      _communityCards = [];
      _players = List.generate(
        _playerCount,
        (index) =>
            PlayerModel(name: '${_getTranslatedText('player')}${index + 1}'),
      );
      _gameMessage = _getTranslatedText('game_start_message');
    });
  }

  // ゲームを開始する
  Future<void> _startGame() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _gameMessage = _getTranslatedText('dealing_cards');
    });

    _createAndShuffleDeck();
    _resetPlayers();

    for (var player in _players) {
      player.card1 = _deck.removeLast();
      player.card2 = _deck.removeLast();
    }

    if (!mounted) return;
    setState(() {
      _gameStarted = true;
      _gameMessage = _getTranslatedText('cards_dealt');
    });

    await Future.delayed(const Duration(milliseconds: 1000));
    _updateProbabilities();

    await _dealCommunityCards();
  }

  // プレイヤーの状態をリセットする
  void _resetPlayers() {
    for (var player in _players) {
      player.card1 = null;
      player.card2 = null;
      player.isLoser = false;
    }
  }

  // コミュニティカードを段階的に配る
  Future<void> _dealCommunityCards() async {
    _communityCards = [];
    if (!mounted) return;
    setState(() {
      _gameMessage = _getTranslatedText('flop');
    });
    await Future.delayed(const Duration(milliseconds: 1500));
    for (int i = 0; i < 3; i++) {
      if (!mounted) return;
      setState(() {
        _communityCards.add(_deck.removeLast());
      });
      _updateProbabilities();
      await Future.delayed(const Duration(milliseconds: 500));
    }

    if (!mounted) return;
    setState(() {
      _gameMessage = _getTranslatedText('turn');
    });
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    setState(() {
      _communityCards.add(_deck.removeLast());
    });
    _updateProbabilities();

    if (!mounted) return;
    setState(() {
      _gameMessage = _getTranslatedText('river');
    });
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    setState(() {
      _communityCards.add(_deck.removeLast());
    });
    _updateProbabilities();

    await Future.delayed(const Duration(milliseconds: 2000));
    _findLoserAndDisplay();
  }

  // 各プレイヤーの勝率を更新する
  void _updateProbabilities() {
    final currentPlayers = _players;
    if (currentPlayers.length <= 1) return;

    final allHands = currentPlayers
        .map((p) => [..._communityCards, p.card1, p.card2]
            .whereType<CardModel>()
            .toList())
        .toList();
    final evaluatedHands = allHands.map((h) => _evaluateHand(h)).toList();

    if (!mounted) return;
    setState(() {
      for (int i = 0; i < currentPlayers.length; i++) {
        final playerHand = evaluatedHands[i];
        int winCount = 0;
        int tieCount = 0;

        for (int j = 0; j < currentPlayers.length; j++) {
          if (i == j) continue;
          final opponentHand = evaluatedHands[j];
          final comparisonResult = _compareHands(playerHand, opponentHand);

          if (comparisonResult == 'hand1') {
            winCount++;
          } else if (comparisonResult == 'tie') {
            tieCount++;
          }
        }

        final totalOpponents = currentPlayers.length - 1;
        double winProb = 0.0;
        if (totalOpponents > 0) {
          winProb = (winCount + tieCount) / totalOpponents * 100;
        }

        currentPlayers[i].winProbability = winProb;
        currentPlayers[i].handName = _getHandName(playerHand['rank']!);
      }
    });
  }

  // 敗者を決定し、表示を更新する
  void _findLoserAndDisplay() {
    double lowestWinRate = 101.0;
    List<PlayerModel> losers = [];

    for (var player in _players) {
      if (player.winProbability < lowestWinRate) {
        lowestWinRate = player.winProbability;
        losers = [player];
      } else if (player.winProbability == lowestWinRate) {
        losers.add(player);
      }
    }

    if (lowestWinRate < 100.0) {
      if (losers.length > 1) {
        losers.sort((a, b) {
          final handA = _evaluateHand([..._communityCards, a.card1!, a.card2!]
              .whereType<CardModel>()
              .toList());
          final handB = _evaluateHand([..._communityCards, b.card1!, b.card2!]
              .whereType<CardModel>()
              .toList());
          final comparison = _compareHands(handA, handB);
          if (comparison == 'hand1') return -1;
          if (comparison == 'hand2') return 1;
          return 0;
        });
        losers = [losers.first];
      }

      losers.first.isLoser = true;
      if (!mounted) return;
      setState(() {
        _gameMessage = '${losers.first.name}${_getTranslatedText('is_loser')}';
        _isLoading = false;
      });
    } else {
      if (!mounted) return;
      setState(() {
        _gameMessage = _getTranslatedText('no_loser');
        _isLoading = false;
      });
    }
  }

  // 5枚のカードで構成される最強の役を評価する
  Map<String, dynamic> _evaluateHand(List<CardModel> hand) {
    hand.sort((a, b) => b.strength - a.strength);

    bool isFlush(List<CardModel> cards) {
      if (cards.length < 5) return false;
      return suits
          .any((suit) => cards.where((card) => card.suit == suit).length >= 5);
    }

    List<CardModel>? findStraight(List<CardModel> cards) {
      final uniqueStrengths = cards.map((c) => c.strength).toSet().toList()
        ..sort((a, b) => b - a);
      for (int i = 0; i <= uniqueStrengths.length - 5; i++) {
        if (uniqueStrengths[i] - uniqueStrengths[i + 4] == 4) {
          return List.generate(
              5,
              (j) => cards
                  .firstWhere((c) => c.strength == uniqueStrengths[i + j]));
        }
      }
      if (uniqueStrengths.contains(14) &&
          uniqueStrengths.contains(5) &&
          uniqueStrengths.contains(4) &&
          uniqueStrengths.contains(3) &&
          uniqueStrengths.contains(2)) {
        return [
          cards.firstWhere((c) => c.strength == 5),
          cards.firstWhere((c) => c.strength == 4),
          cards.firstWhere((c) => c.strength == 3),
          cards.firstWhere((c) => c.strength == 2),
          cards.firstWhere((c) => c.strength == 14)
        ];
      }
      return null;
    }

    final Map<int, int> valueCounts = {};
    for (var card in hand) {
      valueCounts[card.strength] = (valueCounts[card.strength] ?? 0) + 1;
    }

    final sortedValues = valueCounts.keys.toList()..sort((a, b) => b - a);

    if (isFlush(hand)) {
      final flushSuit = suits.firstWhere(
          (suit) => hand.where((card) => card.suit == suit).length >= 5);
      final flushCards = hand.where((card) => card.suit == flushSuit).toList()
        ..sort((a, b) => b.strength - a.strength);
      final straightFlush = findStraight(flushCards);
      if (straightFlush != null)
        return {
          'rank': 9,
          'kickers': straightFlush.map((c) => c.value).toList()
        };
    }

    final fourOfAKind =
        sortedValues.firstWhereOrNull((v) => valueCounts[v] == 4);
    if (fourOfAKind != null) {
      final kicker = sortedValues.firstWhereOrNull((v) => v != fourOfAKind);
      return {
        'rank': 8,
        'kickers': [
          values[fourOfAKind - 2],
          if (kicker != null) values[kicker - 2]
        ]
      };
    }

    final threeOfAKind =
        sortedValues.firstWhereOrNull((v) => valueCounts[v] == 3);
    final pair = sortedValues
        .firstWhereOrNull((v) => v != threeOfAKind && valueCounts[v] == 2);
    if (threeOfAKind != null && pair != null) {
      return {
        'rank': 7,
        'kickers': [values[threeOfAKind - 2], values[pair - 2]]
      };
    }

    if (isFlush(hand)) {
      final flushSuit = suits.firstWhere(
          (suit) => hand.where((card) => card.suit == suit).length >= 5);
      final flushCards = hand.where((card) => card.suit == flushSuit).toList()
        ..sort((a, b) => b.strength - a.strength);
      return {
        'rank': 6,
        'kickers': flushCards.take(5).map((c) => c.value).toList()
      };
    }

    final straight = findStraight(hand);
    if (straight != null) {
      return {'rank': 5, 'kickers': straight.map((c) => c.value).toList()};
    }

    if (threeOfAKind != null) {
      final kickers = sortedValues.where((v) => v != threeOfAKind).take(2);
      return {
        'rank': 4,
        'kickers': [
          values[threeOfAKind - 2],
          ...kickers.map((v) => values[v - 2])
        ]
      };
    }

    final pairs = sortedValues.where((v) => valueCounts[v] == 2).toList();
    if (pairs.length >= 2) {
      final kicker = sortedValues.firstWhereOrNull((v) => !pairs.contains(v));
      return {
        'rank': 3,
        'kickers': [
          values[pairs[0] - 2],
          values[pairs[1] - 2],
          if (kicker != null) values[kicker - 2]
        ]
      };
    }

    final onePair = sortedValues.firstWhereOrNull((v) => valueCounts[v] == 2);
    if (onePair != null) {
      final kickers = sortedValues.where((v) => v != onePair).take(3);
      return {
        'rank': 2,
        'kickers': [values[onePair - 2], ...kickers.map((v) => values[v - 2])]
      };
    }

    return {
      'rank': 1,
      'kickers': sortedValues.take(5).map((v) => values[v - 2]).toList()
    };
  }

  // 2つのハンドの強さを比較する
  String _compareHands(Map<String, dynamic> hand1, Map<String, dynamic> hand2) {
    if (hand1['rank']! > hand2['rank']!) return 'hand1';
    if (hand2['rank']! > hand1['rank']!) return 'hand2';

    final List<String> kickers1 = List.from(hand1['kickers']);
    final List<String> kickers2 = List.from(hand2['kickers']);

    for (int i = 0; i < kickers1.length; i++) {
      if (cardValuesMap[kickers1[i]]! > cardValuesMap[kickers2[i]]!)
        return 'hand1';
      if (cardValuesMap[kickers2[i]]! > cardValuesMap[kickers1[i]]!)
        return 'hand2';
    }
    return 'tie';
  }

  // --- UIビルド部分 ---
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardSize = screenWidth < 600 ? 55.0 : 80.0;
    final cardFontSize = screenWidth < 600 ? 12.0 : 18.0;
    final cardSuitSize = screenWidth < 600 ? 18.0 : 28.0;
    final playerInfoFontSize = screenWidth < 600 ? 10.0 : 12.0;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        color: Color(0xFF1A5F3A),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                _gameMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              _buildCommunityCards(),
              const SizedBox(height: 16),
              _buildPlayerGrid(
                  cardSize, playerInfoFontSize, cardFontSize, cardSuitSize),
              const SizedBox(height: 24),
              _buildControlPanel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityCards() {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardSize = screenWidth < 600 ? 55.0 : 80.0;
    final cardFontSize = screenWidth < 600 ? 12.0 : 18.0;
    final cardSuitSize = screenWidth < 600 ? 18.0 : 28.0;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0x7F1F2937),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: List.generate(5, (index) {
          final card =
              index < _communityCards.length ? _communityCards[index] : null;
          return _buildCard(card, cardSize, cardFontSize, cardSuitSize);
        }),
      ),
    );
  }

  Widget _buildPlayerGrid(double cardSize, double playerInfoFontSize,
      double cardFontSize, double cardSuitSize) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _playerCount,
      itemBuilder: (context, index) {
        return _buildPlayerContainer(_players[index], cardSize,
            playerInfoFontSize, cardFontSize, cardSuitSize);
      },
    );
  }

  Widget _buildPlayerContainer(PlayerModel player, double cardSize,
      double playerInfoFontSize, double cardFontSize, double cardSuitSize) {
    Color containerColor =
        player.isLoser ? const Color(0xFF1E3A8A) : const Color(0xFF1F2937);
    Color borderColor =
        player.isLoser ? const Color(0xFF3B82F6) : const Color(0xFF4B5563);

    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 4),
        boxShadow: player.isLoser
            ? [BoxShadow(color: const Color(0xFF3B82F6), blurRadius: 15)]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              player.name,
              style: TextStyle(
                fontSize: playerInfoFontSize + 4,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCard(player.card1, cardSize * 0.55, cardFontSize * 0.75,
                    cardSuitSize * 0.75),
                const SizedBox(width: 4),
                _buildCard(player.card2, cardSize * 0.55, cardFontSize * 0.75,
                    cardSuitSize * 0.75),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${_getTranslatedText('win_probability')}: ${player.winProbability.toStringAsFixed(0)}%',
              style: TextStyle(
                  fontSize: playerInfoFontSize, color: const Color(0xFFFACC15)),
              textAlign: TextAlign.center,
            ),
            Text(
              player.handName,
              style: TextStyle(
                  fontSize: playerInfoFontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFACC15)),
              textAlign: TextAlign.center,
            ),
            if (player.isLoser)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_getTranslatedText('loser'),
                      style: TextStyle(
                          color: const Color(0xFF3B82F6),
                          fontWeight: FontWeight.bold,
                          fontSize: playerInfoFontSize)),
                  const SizedBox(width: 5),
                  const Text('👎',
                      style: TextStyle(color: Color(0xFF3B82F6), fontSize: 16)),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      CardModel? card, double size, double fontSize, double suitSize) {
    if (card == null) {
      return Container(
        width: size,
        height: size * 1.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    final textColor = (card.suit == '♥️' || card.suit == '♦️')
        ? const Color(0xFFB91C1C)
        : const Color(0xFF1F2937);

    return Container(
      width: size,
      height: size * 1.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(card.value,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: textColor)),
            ),
          ),
          Text(card.suit,
              style: TextStyle(fontSize: suitSize, color: textColor)),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(card.value,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: textColor)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlPanel() {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: DropdownButtonFormField<int>(
            value: _playerCount,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.black),
              ),
              labelText: _getTranslatedText('player_count_label'),
              labelStyle: const TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
            ),
            dropdownColor: Colors.white,
            items: List.generate(9, (index) => index)
                .map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  '$value ${_getTranslatedText('player')}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            onChanged: (int? newValue) {
              if (newValue != null) {
                setState(() {
                  _playerCount = newValue;
                  _resetGame();
                });
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isLoading ? null : _startGame,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: const Color(0xFF16A34A),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            _isLoading
                ? _getTranslatedText('in_progress')
                : (_gameStarted
                    ? _getTranslatedText('play_again')
                    : _getTranslatedText('start_game')),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
