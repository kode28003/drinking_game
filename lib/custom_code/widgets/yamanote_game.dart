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
        'Vegetables in supermarkets',
        'Manga/Anime titles',
        'Historical figures',
        'Things at school',
        'Sports',
        'Country names',
        'Animals',
        'Japanese prefectures',
        'Drinks',
        'Japanese train stations',
        'Game titles',
        'Flowers',
        'Alcoholic beverages',
        'Movie titles',
        'Anime characters',
        'Japanese cities',
        'World heritage sites',
        'SNS platforms',
        'Body parts',
        'Convenience store desserts',
        'Japanese foods',
        'Foods from around the world',
        'Music genres',
        'Fruits',
        'Home appliances',
        'Car brands',
        'Disney characters',
        'Studio Ghibli works',
        'Fashion brands',
        'Stationery',
        'Snacks for alcohol',
        'Sports players',
        'Japanese festivals',
        'Foreign capitals',
        'Constellations',
        'Japanese Sengoku warlords',
        'World historical figures'
      ]
    },
    'ru': {
      'game_title': 'Игра Яманотэ',
      'get_topic_button': 'Получить тему',
      'empty_topic': ' ? ',
      'topics': [
        'Товары из магазина у дома',
        'Что едят на завтрак',
        'Овощи в супермаркете',
        'Названия манги/аниме',
        'Исторические личности',
        'Что есть в школе',
        'Виды спорта',
        'Названия стран',
        'Животные',
        'Префектуры Японии',
        'Напитки',
        'Станции Японии',
        'Названия игр',
        'Цветы',
        'Виды алкоголя',
        'Названия фильмов',
        'Персонажи аниме',
        'Города Японии',
        'Объекты Всемирного наследия',
        'Социальные сети',
        'Части тела',
        'Десерты из магазина у дома',
        'Японские блюда',
        'Блюда мира',
        'Музыкальные жанры',
        'Фрукты',
        'Бытовая техника',
        'Автомобильные бренды',
        'Персонажи Disney',
        'Работы студии Ghibli',
        'Модные бренды',
        'Канцелярия',
        'Закуски к алкоголю',
        'Имена спортсменов',
        'Японские фестивали',
        'Столицы других стран',
        'Названия созвездий',
        'Японские полководцы',
        'Великие люди мира'
      ]
    },
    'ms': {
      'game_title': 'Permainan Laluan Yamanote',
      'get_topic_button': 'Dapatkan Topik',
      'empty_topic': ' ? ',
      'topics': [
        'Barang yang dijual di kedai serbaneka',
        'Makanan untuk sarapan',
        'Sayur-sayuran di pasar raya',
        'Tajuk Manga/Anime',
        'Tokoh sejarah',
        'Benda di sekolah',
        'Sukan',
        'Nama negara di luar negara',
        'Haiwan',
        'Prefektur Jepun',
        'Minuman',
        'Nama stesen Jepun',
        'Tajuk permainan',
        'Bunga',
        'Nama minuman keras',
        'Tajuk filem',
        'Watak Anime',
        'Nama bandar Jepun',
        'Tapak Warisan Dunia',
        'Nama perkhidmatan SNS',
        'Bahagian badan',
        'Pencuci mulut kedai serbaneka',
        'Makanan Jepun',
        'Makanan seluruh dunia',
        'Genre muzik',
        'Buah-buahan',
        'Peralatan rumah',
        'Pengeluar kereta',
        'Watak Disney',
        'Karya Studio Ghibli',
        'Jenama fesyen',
        'Alat tulis',
        'Snek untuk minuman keras',
        'Nama pemain sukan',
        'Pesta Jepun',
        'Ibu kota asing',
        'Nama buruj',
        'Warlord Sengoku Jepun',
        'Tokoh terkenal dunia'
      ]
    },
    'vi': {
      'game_title': 'Trò chơi Yamanote',
      'get_topic_button': 'Lấy chủ đề',
      'empty_topic': ' ? ',
      'topics': [
        'Đồ bán ở cửa hàng tiện lợi',
        'Món ăn sáng',
        'Rau ở siêu thị',
        'Tên manga/anime',
        'Nhân vật lịch sử',
        'Đồ vật trong trường học',
        'Các môn thể thao',
        'Tên quốc gia',
        'Động vật',
        'Tỉnh của Nhật Bản',
        'Đồ uống',
        'Tên ga tàu ở Nhật',
        'Tên trò chơi',
        'Hoa',
        'Tên rượu',
        'Tên phim',
        'Nhân vật anime',
        'Thành phố Nhật Bản',
        'Di sản thế giới',
        'Tên mạng xã hội',
        'Bộ phận cơ thể',
        'Món tráng miệng ở cửa hàng tiện lợi',
        'Món ăn Nhật Bản',
        'Món ăn trên thế giới',
        'Thể loại nhạc',
        'Trái cây',
        'Đồ điện gia dụng',
        'Hãng xe hơi',
        'Nhân vật Disney',
        'Tác phẩm của Ghibli',
        'Thương hiệu thời trang',
        'Dụng cụ văn phòng',
        'Món nhậu',
        'Tên vận động viên thể thao',
        'Lễ hội Nhật Bản',
        'Thủ đô nước ngoài',
        'Tên chòm sao',
        'Tướng quân thời Chiến Quốc Nhật',
        'Danh nhân thế giới'
      ]
    },
    'ko': {
      'game_title': '야마노테선 게임',
      'get_topic_button': '주제 뽑기',
      'empty_topic': ' ? ',
      'topics': [
        '편의점에서 파는 물건',
        '아침에 먹는 음식',
        '마트에 있는 채소',
        '웹툰·애니메이션 제목',
        '역사적 인물',
        '학교에 있는 것',
        '스포츠',
        '나라 이름',
        '동물',
        '한국의 시·도',
        '음료수',
        '한국의 지하철역 이름',
        '게임 제목',
        '꽃 이름',
        '술 이름',
        '영화 제목',
        '애니메이션 캐릭터',
        '한국의 도시 이름',
        '유네스코 세계유산',
        'SNS 서비스 이름',
        '신체 부위',
        '편의점 디저트',
        '한국 음식',
        '세계의 음식',
        '음악 장르',
        '과일',
        '가전제품',
        '자동차 브랜드',
        '디즈니 캐릭터',
        '한국 드라마 제목',
        '패션 브랜드',
        '문구류',
        '술안주',
        '스포츠 선수 이름',
        '한국의 축제',
        '외국의 수도',
        '별자리 이름',
        '한국의 역사적 무장',
        '세계의 위인'
      ]
    },
  };

  late String currentTopic;
  int playCount = 0;

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
    playCount++; // ボタンが押されるたびにカウント
    final random = Random();
    final topics = _getTranslatedTopics();
    final newTopic = topics[random.nextInt(topics.length)];
    setState(() {
      currentTopic = newTopic;
    });
    if (playCount % 4 == 0) {
      actions.showInterstitialAdCustom();
    }
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
