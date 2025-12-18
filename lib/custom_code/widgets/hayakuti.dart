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
  // final Map<String, Map<String, dynamic>> _localizedStrings = {
  //   'ja': {
  //     'game_title': '早口言葉ゲーム',
  //     'start_message': 'スタートボタンを押して挑戦！',
  //     'success_message': 'おめでとうございます！成功です！',
  //     'failure_message': '時間切れ...残念ながら失敗です',
  //     'win_text': '素晴らしい！',
  //     'lose_text': 'もう一度挑戦してみますか？',
  //     'start_button': 'スタート',
  //     'say_it_button': '言えた！',
  //     'tongue_twisters': [
  //       '生麦生米生卵',
  //       '隣の客はよく柿食う客だ',
  //       '赤巻紙青巻紙黄巻紙',
  //       '蛙ぴょこぴょこ三ぴょこぴょこ合わせてぴょこぴょこ六ぴょこぴょこ',
  //       '東京特許許可局長',
  //       'この釘は引き抜きにくい釘だ',
  //       '坊主が屏風に上手に坊主の絵を描いた',
  //       'スモモもモモもモモのうち',
  //       '庭には二羽鶏がいる',
  //       '老若男女にゃニャーニャー',
  //       '引き抜きにくい釘抜き',
  //       'よっぱらいが酔っぱらってよろよろと寄ってきて、よろよろよろけてよろこんだ',
  //       '今日の今日に来て今日言わなかった',
  //       '除雪車除雪作業中',
  //       '新春シャンソンショー',
  //       '隣の竹やぶに竹立てかけたのは竹立てかけたかったから竹立てかけた',
  //       '手術室、診察室、手術室',
  //       '赤パジャマ青パジャマ黄パジャマ',
  //       '骨粗鬆症訴訟勝訴',
  //       '美術室技術室手術室',
  //       '隣の客はよく柿食う客だが柿食う客はよく牡蠣食う客だ',
  //       'バスガス爆発バスガス爆発バスガス爆発',
  //       '貨客船の旅客と旅客機の客',
  //       '青巻紙赤巻紙黄巻紙茶巻紙',
  //       '隣の竹垣に竹立てかけた',
  //       '肩固かったから買った肩叩き器',
  //       '瓜売りが瓜売りに来て瓜売り残して瓜売り帰る',
  //       '裏庭には二羽ニワトリがいる',
  //       'ライスライスカレーライス',
  //       'ジャズ歌手がジャズシャンソンショーでジャズを歌う',
  //       '東京特許許可局で特許許可却下',
  //       'マグマ大使のママとマママグマ大使',
  //       'この竹垣に竹立てかけたかったから竹立てかけた',
  //       '借りた皿洗う皿借りる皿',
  //       '肩叩き機叩きながら語った'
  //     ]
  //   },
  //   'en': {
  //     'game_title': 'Tongue Twister Game',
  //     'start_message': 'Press start to begin!',
  //     'success_message': 'Congratulations! You succeeded!',
  //     'failure_message': 'Time\'s up... You failed.',
  //     'win_text': 'Amazing!',
  //     'lose_text': 'Would you like to try again?',
  //     'start_button': 'Start',
  //     'say_it_button': 'I said it!',
  //     'tongue_twisters': [
  //       'Peter Piper picked a peck of pickled peppers.',
  //       'How much wood would a woodchuck chuck if a woodchuck could chuck wood?',
  //       'She sells seashells by the seashore.',
  //       'Betty Botter bought some butter, but she said the butter’s bitter.',
  //       'A big black bug bit a big black dog on his big black nose.',
  //       'I scream, you scream, we all scream for ice cream.',
  //       'Fuzzy Wuzzy was a bear. Fuzzy Wuzzy had no hair.',
  //       'Unique New York. Unique New York.',
  //       'Red lorry, yellow lorry.',
  //       'Six slimy snails sailed silently.',
  //       'I saw Susie sitting in a shoeshine shop.',
  //       'Can you can a can as a canner can can a can?',
  //       'I slit the sheet, the sheet I slit, and on the slitted sheet I sit.',
  //       'Fred fed Ted bread and Ted fed Fred bread.',
  //       'Lesser leather never weathered wetter weather better.',
  //       'Nine nice night nurses nursing nicely.',
  //       'Which wristwatches are Swiss wristwatches?',
  //       'How can a clam cram in a clean cream can?',
  //       'Near an ear, a nearer ear, a nearly eerie ear.',
  //       'Six sleek swans swam swiftly southwards.',
  //       'Brisk brave brigadiers brandished broad bright blades.',
  //       'Irish wristwatch, Swiss wristwatch.',
  //       'Four fine fresh fish for you.',
  //       'Shut up the shutters and sit in the shop.',
  //       'Truly rural, truly rural, truly rural.'
  //     ]
  //   },
  // };

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
        'Red lorry, yellow lorry.',
        'I scream, you scream, we all scream for ice cream.',
        'Fuzzy Wuzzy was a bear. Fuzzy Wuzzy had no hair.',
        'Unique New York. Unique New York.',
        'Six slippery snails slid slowly southward.',
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
        'Truly rural, truly rural, truly rural.',
        'The great Greek grape growers grow great Greek grapes.',
        'She sees cheese, she sees cheese, she sees cheese.',
        'A big black bug bit a big black bear.',
        'I wish to wish the wish you wish to wish.',
        'Six sick hicks nick six slick bricks.',
        'Fred fed Ted bread and Ted fed Fred bread again.'
      ]
    },
    'de': {
      'game_title': 'Zungenbrecher-Spiel',
      'start_message': 'Drücke Start und versuche es!',
      'success_message': 'Herzlichen Glückwunsch! Erfolgreich!',
      'failure_message': 'Zeit abgelaufen... Leider gescheitert.',
      'win_text': 'Großartig!',
      'lose_text': 'Möchtest du es nochmal versuchen?',
      'start_button': 'Start',
      'say_it_button': 'Gesagt!',
      'tongue_twisters': [
        'Fischers Fritze fischt frische Fische.',
        'Blaukraut bleibt Blaukraut und Brautkleid bleibt Brautkleid.',
        'Zwischen zwei Zwetschgenzweigen sitzen zwei zwitschernde Schwalben.',
        'Der Cottbuser Postkutscher putzt den Cottbuser Postkutschkasten.',
        'Zehn zahme Ziegen zogen zehn Zentner Zucker zum Zoo.',
        'Wenn Fliegen hinter Fliegen fliegen, fliegen Fliegen Fliegen nach.',
        'Der Potsdamer Postkutscher postet postwendend.',
        'Die Katze tritt die Treppe krumm.',
        'Bier brauen, Bäcker backen, Blätter blättern.',
        'Der dicke Dieter drehte den dünnen Daumen.',
        'Schnecken erschrecken schnell.',
        'Klaus klebt kluge Klemmen.',
        'Widerwärtige Wiesel wischen weite Wege.',
        'Schöne Schuhe schaukeln schnell.',
        'Große Grüne Gurken grinsen gern.',
        'Fünf flinke Frösche frassen fröhlich Fliegen.',
        'Bunte Blumen blühen bunt.',
        'Kranke Krähen krächzen krumm.',
        'Rotes Rind rennt rundum rasch.',
        'Schlaue Schlangen schlängeln sich schnell.',
        'Vier flinke Fische fischen fröhlich.',
        'Bunte Blätter blasen bei böigem Wind.',
        'Zehn zahme Ziegen zogen zehn Zentner Zucker zum Zoo.',
        'Fische frischen Fluss frei.',
        'Tante Trudels Trompeten trällern toll.',
        'Blauer Ballon bläst blätternd.',
        'Schöne Schwäne schwimmen schnell.',
        'Kleine Kinder können keine Kekse kriegen.',
        'Peter packt Paprika perfekt.',
        'Rote Rosen riechen reizend.'
      ]
    },
    'ru': {
      'game_title': 'Игра со скороговорками',
      'start_message': 'Нажми старт и попробуй!',
      'success_message': 'Поздравляем! Успех!',
      'failure_message': 'Время вышло... К сожалению, неудача.',
      'win_text': 'Отлично!',
      'lose_text': 'Хочешь попробовать снова?',
      'start_button': 'Старт',
      'say_it_button': 'Сказал!',
      'tongue_twisters': [
        'Карл у Клары украл кораллы, а Клара у Карла украла кларнет.',
        'Шла Саша по шоссе и сосала сушку.',
        'От топота копыт пыль по полю летит.',
        'У четырёх черепах четыре черепашонка.',
        'Как у наших у ворот, так и у соседей.',
        'Сидит ежик на ёлке.',
        'Кукушка кукушонку купила капюшон.',
        'На дворе трава, на траве дрова.',
        'Клара крала кораллы, Карл крал кларнет.',
        'Три толстяка тянут три толстых тачки.',
        'Шла Саша по шоссе и сосала сушку.',
        'Летят летучие летучие мыши.',
        'Саша шла по шоссе и сосала сушку.',
        'Варвара варит варенье.',
        'Воробьи воробьят воркуют.',
        'Семь семян семечки сеяли.',
        'Кот котят кормит.',
        'Петя перепел петуха.',
        'Васька варит варенье в вазе.',
        'Четыре черепахи через черепах.',
        'Сорока сорок сорочек сорвала.',
        'Мороз морозил морковь.',
        'Саша шла по шоссе и сосала сушку.',
        'Жёлтые жёлуди жёлтели жутко.',
        'Котята котят котятами катают.',
        'Лягушка прыгала по лужам.',
        'Семь старых собак спят.',
        'Бабка на бабке бабку забабахала.',
        'Шестеро шустрых щенят.',
        'Три трещины трещат треском.',
        'Ветер в волосах вьётся.'
      ]
    },
    'ms': {
      'game_title': 'Permainan Lidah Berbelit',
      'start_message': 'Tekan butang Mula untuk mencuba!',
      'success_message': 'Tahniah! Anda berjaya!',
      'failure_message': 'Masa tamat... Malangnya anda gagal',
      'win_text': 'Hebat!',
      'lose_text': 'Adakah anda mahu mencuba lagi?',
      'start_button': 'Mula',
      'say_it_button': 'Saya sudah kata!',
      'tongue_twisters': [
        'Ali beli ayam, Ayam beli Ali',
        'Kapal kayu kapal kayu kapal kayu',
        'Siapa suka soto, soto suka siapa',
        'Lima limau lima lima limau lima limau',
        'Bapa bawa buku besar, buku besar bawa bapa',
        'Kucing kecil, kucing kecik kucing kecil',
        'Burung biru bertenggek di batu biru',
        'Bola besar berbunyi bila dibaling',
        'Tiga tikus tikus tiga tikus',
        'Kereta kuda ke kedai kuda',
        'Papan putih penuh penuh papan',
        'Ikan ikan ikan ikan ikan ikan',
        'Satu satu sotong sotong satu',
        'Bunga biru berbau busuk',
        'Tali tali tali tergantung tergantung',
        'Ayam ayam ayam ayam ayam ayam',
        'Baju baru baju biru baju baru',
        'Kopi kopi kopi kopi kopi kopi',
        'Mata mata mata mata mata mata',
        'Buku buku buku buku buku buku',
        'Lagu lagu lagu lagu lagu lagu',
        'Pantai pantai pantai pantai pantai pantai',
        'Malam malam malam malam malam malam',
        'Rumah rumah rumah rumah rumah rumah',
        'Hujan hujan hujan hujan hujan hujan',
        'Anak anak anak anak anak anak',
        'Kerusi kerusi kerusi kerusi kerusi kerusi',
        'Sayur sayur sayur sayur sayur sayur',
        'Buah buah buah buah buah buah',
        'Bas bas bas bas bas bas',
        'Kereta kereta kereta kereta kereta kereta',
      ],
    },
    'vi': {
      'game_title': 'Trò chơi nói nhanh',
      'start_message': 'Nhấn bắt đầu để thử thách!',
      'success_message': 'Chúc mừng! Bạn đã thành công!',
      'failure_message': 'Hết giờ... Rất tiếc, bạn thất bại.',
      'win_text': 'Tuyệt vời!',
      'lose_text': 'Bạn có muốn thử lại không?',
      'start_button': 'Bắt đầu',
      'say_it_button': 'Tôi đã nói!',
      'tongue_twisters': [
        'Lúa nếp là lúa nếp làng, lúa lên lớp lớp lòng nàng lâng lâng.',
        'Con cá sấu xấu xí nằm xếp xó.',
        'Chị Trinh trồng trinh trinh trên trảng trống.',
        'Nồi đồng nấu ốc, nồi đất nấu ếch.',
        'Sân si sao sớm say sưa.',
        'Tôi thích thích thú thích thú thật nhiều.',
        'Ba bà bán bánh bột bắp.',
        'Chó chồm chồm chồm chồm.',
        'Cá chép chui qua chỗ chật chội.',
        'Bảy bảy bảy bé bảy bảy bé bảy bảy.',
        'Chuột chũi chui chui chui chuột.',
        'Chim chích chòe chích chòe chích chòe.',
        'Cậu cậu cậu cậu cậu cậu.',
        'Tôm tép tít tít tít.',
        'Bún bò bảy bảy bảy bún bò bảy bảy.',
        'Cua cua chui chui cua.',
        'Chị chỉ chối chối chỉ.',
        'Bảy bà bán bánh bao bảy bảy.',
        'Bảy bó bún bó bảy bảy.',
        'Chim chích chòe chíp chíp chíp.',
        'Cá cắn cá cắn cá cắn.',
        'Bảy bà bán bún bò bảy bảy.',
        'Con cá chép chui qua chỗ chật.',
        'Chim chào mào chao chao.',
        'Cua cào cào cua cào.',
        'Tôm tép tít tít tít.',
        'Bà ba bán bánh bột bắp bảy bảy.',
        'Bảy bé bán bún bò bảy bảy.',
        'Chị Châu chở chậu chua.',
        'Cá cảnh chảy chảy chảy.',
        'Cua cào cào cua cào cào.'
      ]
    },
    'ko': {
      'game_title': '말 빨리 하기 게임',
      'start_message': '시작을 눌러 도전해 보세요!',
      'success_message': '축하합니다! 성공했어요!',
      'failure_message': '시간 초과… 아쉽게도 실패했어요.',
      'win_text': '대단해요!',
      'lose_text': '다시 도전할까요?',
      'start_button': '시작',
      'say_it_button': '말했어요!',
      'tongue_twisters': [
        '간장 공장 공장장은 강 공장장이고 된장 공장 공장장은 공 공장장이다.',
        '저기 저 뜰에 뜰꽃은 철철철철 뜰꽃이다.',
        '내가 그린 기린 그림은 잘 그린 기린 그림이고 네가 그린 기린 그림은 잘 못 그린 기린 그림이다.',
        '백 법학 박사와 박 법학 백사.',
        '경찰청 철창살은 외철창살이고 검찰청 철창살은 쌍철창살이다.',
        '신진 샴푸와 신신 샴푸.',
        '청평콩찰떡은 찰콩찰떡이고 홍평콩찰떡은 콩찰찰떡이다.',
        '앞집 팥죽은 붉은 팥죽이고 뒷집 콩죽은 검은 콩죽이다.',
        '저 분은 백 법학 박사이고 이 분은 박 법학 백사이다.',
        '목동 로타리 로터리.',
        '알콩달콩 알밤 알밤.',
        '칠월 칠일은 칠석이다.',
        '서울특별시 특허허가과 허가과장 허과장.',
        '한양 양장점 양장 양장점.',
        '김치 찌개 찌개 김치.',
        '콩깍지 껍질은 깐 콩깍지 껍질이다.',
        '사과를 사과하는 사과 장수.',
        '말 말 말 말 많은 말.',
        '바람 불어 바람개비 빙빙 돈다.',
        '밤 말 밤 말 밤 말.',
        '닭 잡아 닭장에 닭 넣자.',
        '차 차 차 차 찬 차.',
        '들들들 들깨 들기름.',
        '별별 사람들이 별별 별을 본다.',
        '토끼 통통 통통 토끼.',
        '고기 굽는 고기 굽는 고기집.',
        '빨간 벽돌집과 파란 벽돌집.',
        '산 속 숲속 산삼.',
        '참참참 참기름.',
        '콩콩콩 콩나물.'
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
