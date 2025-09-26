import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ja', 'en', 'ru', 'vi', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? jaText = '',
    String? enText = '',
    String? ruText = '',
    String? viText = '',
    String? msText = '',
  }) =>
      [jaText, enText, ruText, viText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // pokerOnlyPage
  {
    'aohgx1yf': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // peoplePokerPage
  {
    'wl859ofa': {
      'ja': 'ポーカーくじ引き',
      'en': 'Poker lottery',
      'ms': 'Loteri poker',
      'ru': 'Покерная лотерея',
      'vi': 'Xổ số Poker',
    },
    '4u7od7rj': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // roulettePage
  {
    'mp6r43pq': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // demonPage
  {
    'feinogcv': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // HomePage
  {
    'seoibtcp': {
      'ja': 'ゲームを選ぶ',
      'en': 'Choose a game',
      'ms': 'Pilih permainan',
      'ru': 'Выберите игру',
      'vi': 'Chọn một trò chơi',
    },
    '0cgbm1hq': {
      'ja': 'ルーレット',
      'en': 'roulette',
      'ms': 'rolet',
      'ru': 'рулетка',
      'vi': 'cò quay',
    },
    '9sgj9lg4': {
      'ja': 'ポーカー',
      'en': 'poker',
      'ms': 'poker',
      'ru': 'покер',
      'vi': 'bài xì phé',
    },
    '9a5l7kpw': {
      'ja': '顔ゲーム',
      'en': 'Face Game',
      'ms': 'Permainan Muka',
      'ru': 'Игра в лицо',
      'vi': 'Trò chơi khuôn mặt',
    },
    'zisw65uo': {
      'ja': '山手線ゲーム',
      'en': 'Yamanote Line Game',
      'ms': 'Permainan Talian Yamanote',
      'ru': 'Игра «Линия Яманотэ»',
      'vi': 'Trò chơi Yamanote Line',
    },
    'yu882gci': {
      'ja': 'フルーツと爆弾ゲーム',
      'en': 'Fruits and Bombs Game',
      'ms': 'Permainan Buah-buahan dan Bom',
      'ru': 'Игра «Фрукты и бомбы»',
      'vi': 'Trò chơi trái cây và bom',
    },
    'by6g8m2r': {
      'ja': '大喜利',
      'en': 'Ogiri',
      'ms': 'Ogiri',
      'ru': 'Огири',
      'vi': 'Ogiri',
    },
    '78pxr4f1': {
      'ja': '早口言葉',
      'en': 'tongue twisters',
      'ms': 'berbelit lidah',
      'ru': 'скороговорки',
      'vi': 'những câu nói khó phát âm',
    },
    '1c45nahm': {
      'ja': '多数決ゲーム',
      'en': 'Majority vote game',
      'ms': 'Permainan undian majoriti',
      'ru': 'Игра большинства голосов',
      'vi': 'Trò chơi bỏ phiếu đa số',
    },
    '3hj0do20': {
      'ja': 'フリップゲーム',
      'en': 'Flip Game',
      'ms': 'Permainan Flip',
      'ru': 'Игра «Переверни»',
      'vi': 'Trò chơi lật',
    },
    'c655xfec': {
      'ja': '5秒チャレンジゲーム',
      'en': '5-Second Challenge Game',
      'ms': 'Permainan Cabaran 5 Saat',
      'ru': '5-секундная игра-вызов',
      'vi': 'Trò chơi thử thách 5 giây',
    },
    'jws4c1kg': {
      'ja': 'コイントス',
      'en': 'coin toss',
      'ms': 'balingan syiling',
      'ru': 'подбрасывание монеты',
      'vi': 'tung đồng xu',
    },
    'vwj8kkwc': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // yamanotePage
  {
    'bffw19hw': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // coinTossPage
  {
    '00thikd9': {
      'ja': '表',
      'en': 'table',
      'ms': 'meja',
      'ru': 'стол',
      'vi': 'bàn',
    },
    '8oiweb37': {
      'ja': 'or',
      'en': 'or',
      'ms': 'atau',
      'ru': 'или',
      'vi': 'hoặc',
    },
    'ub10vi3g': {
      'ja': '裏',
      'en': 'back',
      'ms': 'belakang',
      'ru': 'назад',
      'vi': 'mặt sau',
    },
    'jkn7i2iq': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // IpponHomePage
  {
    '8z5p2n83': {
      'ja': '大喜利グランプリ',
      'en': 'Ogiri Grand Prix',
      'ms': 'Grand Prix Ogiri',
      'ru': 'Гран-при Огири',
      'vi': 'Giải Grand Prix Ogiri',
    },
    'dasy6aec': {
      'ja': '参加人数を選択してください',
      'en': 'Please select the number of participants',
      'ms': 'Sila pilih bilangan peserta',
      'ru': 'Пожалуйста, выберите количество участников',
      'vi': 'Vui lòng chọn số lượng người tham gia',
    },
    '5fy18ffh': {
      'ja': '2人',
      'en': '2',
      'ms': '2',
      'ru': '2 ',
      'vi': '2',
    },
    'xzpxarsy': {
      'ja': '3人',
      'en': '3',
      'ms': '3',
      'ru': '3',
      'vi': '3 ',
    },
    'vrydt2sc': {
      'ja': '4人',
      'en': '4 ',
      'ms': '4',
      'ru': '4',
      'vi': '4',
    },
    'voc0jcu6': {
      'ja': '5人',
      'en': '5 ',
      'ms': '5',
      'ru': '5',
      'vi': '5',
    },
    '4c3lx39s': {
      'ja': '6人',
      'en': '6 ',
      'ms': '6',
      'ru': '6',
      'vi': '6',
    },
    'ft1kol49': {
      'ja': '7人',
      'en': '7 ',
      'ms': '7',
      'ru': '7',
      'vi': '7',
    },
    'e1gcyfdp': {
      'ja': '8人',
      'en': '8 ',
      'ms': '8',
      'ru': '8',
      'vi': '8',
    },
    'u1ehamvx': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // IpponAnswerPage
  {
    'nqahyd47': {
      'ja': '大喜利ゲーム',
      'en': 'Ogiri Game',
      'ms': 'Permainan Ogiri',
      'ru': 'Игра Огири',
      'vi': 'Trò chơi Ogiri',
    },
    'z9zto3bs': {
      'ja': 'お題',
      'en': 'Topic',
      'ms': 'Topik',
      'ru': 'Тема',
      'vi': 'Đề tài',
    },
    '0y4j1uii': {
      'ja': '面白い回答をどうぞ...',
      'en': 'Interesting answers here...',
      'ms': 'Jawapan menarik disini...',
      'ru': 'Интересные ответы здесь...',
      'vi': 'Câu trả lời thú vị ở đây...',
    },
    'zv5rq76s': {
      'ja': '次のお題',
      'en': 'Next topic',
      'ms': 'Topik seterusnya',
      'ru': 'Следующая тема',
      'vi': 'Chủ đề tiếp theo',
    },
    'mgdi4xd0': {
      'ja': '次の人へ',
      'en': 'To the next person',
      'ms': 'Kepada orang seterusnya',
      'ru': 'К следующему человеку',
      'vi': 'Gửi đến người tiếp theo',
    },
  },
  // IpponVotePage
  {
    'i2haey7v': {
      'ja': '投票タイム',
      'en': 'Voting Time',
      'ms': 'Masa Mengundi',
      'ru': 'Время голосования',
      'vi': 'Thời gian bỏ phiếu',
    },
    '13h00tse': {
      'ja': '回答一覧',
      'en': 'List of answers',
      'ms': 'Senarai jawapan',
      'ru': 'Список ответов',
      'vi': 'Danh sách câu trả lời',
    },
    'bojxa45w': {
      'ja': '投票終了',
      'en': 'Voting closed',
      'ms': 'Undian ditutup',
      'ru': 'Голосование закрыто',
      'vi': 'Đã đóng bình chọn',
    },
    'oracg90q': {
      'ja': '1番面白かった回答に投票してください',
      'en': 'Vote for the most interesting answer',
      'ms': 'Undi untuk jawapan yang paling menarik',
      'ru': 'Проголосуйте за самый интересный ответ',
      'vi': 'Bình chọn cho câu trả lời thú vị nhất',
    },
    '7jxbaz1d': {
      'ja': 'うーん',
      'en': 'Hmm',
      'ms': 'Hmm',
      'ru': 'Хм',
      'vi': 'Ừm',
    },
    'h15092ln': {
      'ja': 'これだ！',
      'en': 'This is it!',
      'ms': 'Ini dia!',
      'ru': 'Вот оно!',
      'vi': 'Chính là nó!',
    },
  },
  // IpponResult
  {
    'a05vijv1': {
      'ja': '結果発表！',
      'en': 'Results announced!',
      'ms': 'Keputusan diumumkan!',
      'ru': 'Результаты объявлены!',
      'vi': 'Kết quả đã được công bố!',
    },
    '1pg2jyr8': {
      'ja': '優勝は',
      'en': 'The winner is',
      'ms': 'Pemenangnya ialah',
      'ru': 'Победителем становится',
      'vi': 'Người chiến thắng là',
    },
    'q1wo5tx6': {
      'ja': '回答：',
      'en': 'answer:',
      'ms': 'jawapan:',
      'ru': 'отвечать:',
      'vi': 'trả lời:',
    },
    'saz1kl1c': {
      'ja': '残念ながら... 罰ゲームです！',
      'en': 'Unfortunately... it\'s a penalty game!',
      'ms': 'Malangnya... ia adalah permainan penalti!',
      'ru': 'К сожалению... это пенальти!',
      'vi': 'Thật không may... đây là một trận đấu phạt đền!',
    },
    'x2rx6gvd': {
      'ja': '回答 : ',
      'en': 'Answer:',
      'ms': 'Jawapan:',
      'ru': 'Отвечать:',
      'vi': 'Trả lời:',
    },
    'wbjkp91q': {
      'ja': 'プレイヤー3',
      'en': 'Player 3',
      'ms': 'Pemain 3',
      'ru': 'Игрок 3',
      'vi': 'Người chơi 3',
    },
    '1gbjt4cu': {
      'ja': '回答: \\\"もう少しの答え\\\"',
      'en': 'Answer: \\\"A few more answers\\\"',
      'ms': 'Jawapan: \\\"Beberapa lagi jawapan\\\"',
      'ru': 'Ответ: \\\"Еще несколько ответов\\\"',
      'vi': 'Trả lời: \\\"Thêm một vài câu trả lời nữa\\\"',
    },
    'x2clsrxd': {
      'ja': 'もう一度遊ぶ',
      'en': 'Play again',
      'ms': 'Main lagi',
      'ru': 'Играть снова',
      'vi': 'Chơi lại',
    },
  },
  // hayakutiPage
  {
    'c0uh5wz5': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // ipponEditPage
  {
    'nmkczor3': {
      'ja': '大喜利アプリ',
      'en': 'Ogiri app',
      'ms': 'Apl Ogiri',
      'ru': 'Приложение Огири',
      'vi': 'Ứng dụng Ogiri',
    },
    'lbj9wa4n': {
      'ja': '新しいお題をカテゴリごとに追加できます。',
      'en': 'You can add new topics by category.',
      'ms': 'Anda boleh menambah topik baharu mengikut kategori.',
      'ru': 'Вы можете добавлять новые темы по категориям.',
      'vi': 'Bạn có thể thêm chủ đề mới theo danh mục.',
    },
    'k29rtfdi': {
      'ja': 'お題を記入する',
      'en': 'Enter the topic',
      'ms': 'Masukkan topik',
      'ru': 'Введите тему',
      'vi': 'Nhập chủ đề',
    },
    'ccmxcnte': {
      'ja': 'お題を入力してください...',
      'en': 'Enter your subject...',
      'ms': 'Masukkan subjek anda...',
      'ru': 'Введите тему...',
      'vi': 'Nhập chủ đề của bạn...',
    },
    'i0zir3ha': {
      'ja': '保存してゲームへ',
      'en': 'Save and go to game',
      'ms': 'Simpan dan pergi ke permainan',
      'ru': 'Сохранить и перейти к игре',
      'vi': 'Lưu và vào trò chơi',
    },
  },
  // minorityPage
  {
    'hfren8di': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // gameListsPage
  {
    'fc7w311s': {
      'ja': '飲みゲーの一覧',
      'en': 'List of drinking games',
      'ms': 'Senarai permainan minum',
      'ru': 'Список игр с употреблением алкоголя',
      'vi': 'Danh sách các trò chơi uống rượu',
    },
    '3hhadh8t': {
      'ja': ': このアプリで遊べる',
      'en': ': You can play with this app',
      'ms': ': Anda boleh bermain dengan aplikasi ini',
      'ru': ': Вы можете играть с этим приложением',
      'vi': ': Bạn có thể chơi với ứng dụng này',
    },
    'p00jq7a4': {
      'ja': 'ゲームを検索 ...',
      'en': 'Search for games...',
      'ms': 'Cari permainan...',
      'ru': 'Поиск игр...',
      'vi': 'Tìm kiếm trò chơi...',
    },
    'leyujw6d': {
      'ja': 'Game List',
      'en': 'Game List',
      'ms': 'Senarai Permainan',
      'ru': 'Список игр',
      'vi': 'Danh sách trò chơi',
    },
  },
  // backup
  {
    'iysc2h94': {
      'ja': 'ゲームを選ぶ',
      'en': 'Choose a game',
      'ms': 'Pilih permainan',
      'ru': 'Выберите игру',
      'vi': 'Chọn một trò chơi',
    },
    'm5al4ngf': {
      'ja': 'ルーレット',
      'en': 'roulette',
      'ms': 'rolet',
      'ru': 'рулетка',
      'vi': 'cò quay',
    },
    '044jv3yk': {
      'ja': 'ポーカー',
      'en': 'poker',
      'ms': 'poker',
      'ru': 'покер',
      'vi': 'bài xì phé',
    },
    '29dgaja5': {
      'ja': '顔ゲーム',
      'en': 'Face Game',
      'ms': 'Permainan Muka',
      'ru': 'Игра в лицо',
      'vi': 'Trò chơi khuôn mặt',
    },
    '8ztysda8': {
      'ja': '山手線ゲーム',
      'en': 'Yamanote Line Game',
      'ms': 'Permainan Talian Yamanote',
      'ru': 'Игра «Линия Яманотэ»',
      'vi': 'Trò chơi Yamanote Line',
    },
    'edkb0l0y': {
      'ja': 'コイントス',
      'en': 'coin toss',
      'ms': 'balingan syiling',
      'ru': 'подбрасывание монеты',
      'vi': 'tung đồng xu',
    },
    '2k8opu3u': {
      'ja': '大喜利',
      'en': 'Ogiri',
      'ms': 'Ogiri',
      'ru': 'Огири',
      'vi': 'Ogiri',
    },
    'bcks0u03': {
      'ja': '早口言葉',
      'en': 'tongue twisters',
      'ms': 'berbelit lidah',
      'ru': 'скороговорки',
      'vi': 'những câu nói khó phát âm',
    },
    'sznz9zpt': {
      'ja': '多数決ゲーム',
      'en': 'Majority vote game',
      'ms': 'Permainan undian majoriti',
      'ru': 'Игра большинства голосов',
      'vi': 'Trò chơi bỏ phiếu đa số',
    },
    'xcopiyqx': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // gameDetailPage
  {
    '8j5o6p1i': {
      'ja': '← 戻る',
      'en': '← Back',
      'ms': '← Kembali',
      'ru': '← Назад',
      'vi': '← Quay lại',
    },
    'p5vz60q3': {
      'ja': 'カテゴリー:',
      'en': 'Category:',
      'ms': 'Kategori:',
      'ru': 'Категория:',
      'vi': 'Loại:',
    },
    '1rbuk55k': {
      'ja': '難易度:',
      'en': 'Difficulty:',
      'ms': 'Kesukaran:',
      'ru': 'Уровень сложности:',
      'vi': 'Khó khăn:',
    },
    '0ktkb9rg': {
      'ja': '初級',
      'en': 'Beginner',
      'ms': 'pemula',
      'ru': 'Новичок',
      'vi': 'Người mới bắt đầu',
    },
    'shiftuzl': {
      'ja': 'このアプリで遊ぶ:',
      'en': 'Play with this app:',
      'ms': 'Main dengan aplikasi ini:',
      'ru': 'Играйте с этим приложением:',
      'vi': 'Chơi với ứng dụng này:',
    },
    'xf8vqpmv': {
      'ja': '今すぐ遊ぶ',
      'en': 'Play now',
      'ms': 'Main sekarang',
      'ru': 'Играть сейчас',
      'vi': 'Chơi ngay',
    },
  },
  // TrumpFlipPage
  {
    'zszkazbp': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // fiveSecondPage
  {
    'lnx79ic6': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // fruitPage
  {
    'vqp4rw5b': {
      'ja': 'Home',
      'en': 'Home',
      'ms': 'Rumah',
      'ru': 'Дом',
      'vi': 'Trang chủ',
    },
  },
  // Miscellaneous
  {
    'ng87wssm': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'kc0vtds3': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '1m3xsnc2': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '3gz5z3tp': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'idou9fgx': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'eem0sl3i': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'uue6jhc1': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '45nzm93s': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '38j0tcxj': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '5qq85829': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'z3kvkhmb': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'x7jvnfop': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'np6dzoo2': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'pucxnrx4': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'pgk10wq0': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '6c4ghkpe': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '2lmjz1v6': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '2f5pumxe': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '98d7157x': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '3zysb24k': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'ozvr9ysg': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'a1zjonk6': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '2vywxvwj': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    'pkkint6c': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
    '6lu402lz': {
      'ja': '',
      'en': '',
      'ms': '',
      'ru': '',
      'vi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
