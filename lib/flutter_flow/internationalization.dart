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

  static List<String> languages() => ['ja', 'en'];

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
  }) =>
      [jaText, enText][languageIndex] ?? '';

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
    },
  },
  // peoplePokerPage
  {
    'wl859ofa': {
      'ja': 'ポーカーくじ引き',
      'en': 'Poker lottery',
    },
    '4u7od7rj': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // roulettePage
  {
    'mp6r43pq': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // demonPage
  {
    'feinogcv': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // HomePage
  {
    'seoibtcp': {
      'ja': 'ゲームを選ぶ',
      'en': 'Choose a game',
    },
    '0cgbm1hq': {
      'ja': 'ルーレット',
      'en': 'roulette',
    },
    '9sgj9lg4': {
      'ja': 'ポーカー',
      'en': 'poker',
    },
    '9a5l7kpw': {
      'ja': '顔ゲーム',
      'en': 'Face Game',
    },
    'zisw65uo': {
      'ja': '山手線ゲーム',
      'en': 'Yamanote Line Game',
    },
    'jws4c1kg': {
      'ja': 'コイントス',
      'en': 'coin toss',
    },
    'by6g8m2r': {
      'ja': '大喜利',
      'en': 'Ogiri',
    },
    '78pxr4f1': {
      'ja': '早口言葉',
      'en': 'tongue twisters',
    },
    '1c45nahm': {
      'ja': '多数決ゲーム',
      'en': 'Majority vote game',
    },
    '3hj0do20': {
      'ja': 'フリップゲーム',
      'en': 'Majority vote game',
    },
    'c655xfec': {
      'ja': '5秒チャレンジゲーム',
      'en': 'Five Second Game',
    },
    'vwj8kkwc': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // yamanotePage
  {
    'bffw19hw': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // coinTossPage
  {
    '00thikd9': {
      'ja': '表',
      'en': 'table',
    },
    '8oiweb37': {
      'ja': 'or',
      'en': 'or',
    },
    'ub10vi3g': {
      'ja': '裏',
      'en': 'back',
    },
    'jkn7i2iq': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // IpponHomePage
  {
    '8z5p2n83': {
      'ja': '大喜利グランプリ',
      'en': 'Ogiri Grand Prix',
    },
    'dasy6aec': {
      'ja': '参加人数を選択してください',
      'en': 'Please select the number of participants',
    },
    '5fy18ffh': {
      'ja': '2人',
      'en': '2 ',
    },
    'xzpxarsy': {
      'ja': '3人',
      'en': '3 ',
    },
    'vrydt2sc': {
      'ja': '4人',
      'en': '4 ',
    },
    'voc0jcu6': {
      'ja': '5人',
      'en': '5 ',
    },
    '4c3lx39s': {
      'ja': '6人',
      'en': '6 ',
    },
    'ft1kol49': {
      'ja': '7人',
      'en': '7 ',
    },
    'e1gcyfdp': {
      'ja': '8人',
      'en': '8 ',
    },
    'u1ehamvx': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // IpponAnswerPage
  {
    'nqahyd47': {
      'ja': '大喜利ゲーム',
      'en': 'Ogiri Game',
    },
    'z9zto3bs': {
      'ja': 'お題',
      'en': 'Topic',
    },
    '0y4j1uii': {
      'ja': '面白い回答をどうぞ...',
      'en': 'Interesting answers here...',
    },
    'zv5rq76s': {
      'ja': '次のお題',
      'en': 'Next topic',
    },
    'mgdi4xd0': {
      'ja': '次の人へ',
      'en': 'To the next person',
    },
  },
  // IpponVotePage
  {
    'i2haey7v': {
      'ja': '投票タイム',
      'en': 'Voting Time',
    },
    '13h00tse': {
      'ja': '回答一覧',
      'en': 'List of answers',
    },
    'bojxa45w': {
      'ja': '投票終了',
      'en': 'Voting closed',
    },
    'oracg90q': {
      'ja': '1番面白かった回答に投票してください',
      'en': 'Vote for the most interesting answer',
    },
    '7jxbaz1d': {
      'ja': 'うーん',
      'en': 'Hmm',
    },
    'h15092ln': {
      'ja': 'これだ！',
      'en': 'This is it!',
    },
  },
  // IpponResult
  {
    'a05vijv1': {
      'ja': '結果発表！',
      'en': 'Results announced!',
    },
    '1pg2jyr8': {
      'ja': '優勝は',
      'en': 'The winner is',
    },
    'q1wo5tx6': {
      'ja': '回答：',
      'en': 'answer:',
    },
    'saz1kl1c': {
      'ja': '残念ながら... 罰ゲームです！',
      'en': 'Unfortunately... it\'s a penalty game!',
    },
    'x2rx6gvd': {
      'ja': '回答 : ',
      'en': 'Answer:',
    },
    'wbjkp91q': {
      'ja': 'プレイヤー3',
      'en': 'Player 3',
    },
    '1gbjt4cu': {
      'ja': '回答: \\\"もう少しの答え\\\"',
      'en': 'Answer: \\\"A few more answers\\\"',
    },
    'x2clsrxd': {
      'ja': 'もう一度遊ぶ',
      'en': 'Play again',
    },
  },
  // hayakutiPage
  {
    'c0uh5wz5': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // ipponEditPage
  {
    'nmkczor3': {
      'ja': '大喜利アプリ',
      'en': 'Ogiri app',
    },
    'lbj9wa4n': {
      'ja': '新しいお題をカテゴリごとに追加できます。',
      'en': 'You can add new topics by category.',
    },
    'k29rtfdi': {
      'ja': 'お題を記入する',
      'en': 'Enter the topic',
    },
    'ccmxcnte': {
      'ja': 'お題を入力してください...',
      'en': 'Enter your subject...',
    },
    'i0zir3ha': {
      'ja': '保存してゲームへ',
      'en': 'Save and go to game',
    },
  },
  // minorityPage
  {
    'hfren8di': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // gameListsPage
  {
    'fc7w311s': {
      'ja': '飲みゲーの一覧',
      'en': 'List of drinking games',
    },
    '3hhadh8t': {
      'ja': ': このアプリで遊べる',
      'en': 'App use',
    },
    'p00jq7a4': {
      'ja': 'ゲームを検索 ...',
      'en': 'Search for games...',
    },
    'leyujw6d': {
      'ja': 'Game List',
      'en': 'Game List',
    },
  },
  // backup
  {
    'iysc2h94': {
      'ja': 'ゲームを選ぶ',
      'en': 'Choose a game',
    },
    'm5al4ngf': {
      'ja': 'ルーレット',
      'en': 'roulette',
    },
    '044jv3yk': {
      'ja': 'ポーカー',
      'en': 'poker',
    },
    '29dgaja5': {
      'ja': '顔ゲーム',
      'en': 'Face Game',
    },
    '8ztysda8': {
      'ja': '山手線ゲーム',
      'en': 'Yamanote Line Game',
    },
    'edkb0l0y': {
      'ja': 'コイントス',
      'en': 'coin toss',
    },
    '2k8opu3u': {
      'ja': '大喜利',
      'en': 'Ogiri',
    },
    'bcks0u03': {
      'ja': '早口言葉',
      'en': 'tongue twisters',
    },
    'sznz9zpt': {
      'ja': '多数決ゲーム',
      'en': 'Majority vote game',
    },
    'xcopiyqx': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // gameDetailPage
  {
    '8j5o6p1i': {
      'ja': '← 戻る',
      'en': '← Back',
    },
    'p5vz60q3': {
      'ja': 'カテゴリー:',
      'en': 'Category:',
    },
    '1rbuk55k': {
      'ja': '難易度:',
      'en': 'Difficulty:',
    },
    '0ktkb9rg': {
      'ja': '初級',
      'en': 'Beginner',
    },
    'shiftuzl': {
      'ja': 'このアプリで遊ぶ:',
      'en': 'Play with this app:',
    },
    'xf8vqpmv': {
      'ja': '今すぐ遊ぶ',
      'en': 'Play now',
    },
  },
  // TrumpFlipPage
  {
    'zszkazbp': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // fiveSecondPage
  {
    'lnx79ic6': {
      'ja': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'ng87wssm': {
      'ja': '',
      'en': '',
    },
    'kc0vtds3': {
      'ja': '',
      'en': '',
    },
    '1m3xsnc2': {
      'ja': '',
      'en': '',
    },
    '3gz5z3tp': {
      'ja': '',
      'en': '',
    },
    'idou9fgx': {
      'ja': '',
      'en': '',
    },
    'eem0sl3i': {
      'ja': '',
      'en': '',
    },
    'uue6jhc1': {
      'ja': '',
      'en': '',
    },
    '45nzm93s': {
      'ja': '',
      'en': '',
    },
    '38j0tcxj': {
      'ja': '',
      'en': '',
    },
    '5qq85829': {
      'ja': '',
      'en': '',
    },
    'z3kvkhmb': {
      'ja': '',
      'en': '',
    },
    'x7jvnfop': {
      'ja': '',
      'en': '',
    },
    'np6dzoo2': {
      'ja': '',
      'en': '',
    },
    'pucxnrx4': {
      'ja': '',
      'en': '',
    },
    'pgk10wq0': {
      'ja': '',
      'en': '',
    },
    '6c4ghkpe': {
      'ja': '',
      'en': '',
    },
    '2lmjz1v6': {
      'ja': '',
      'en': '',
    },
    '2f5pumxe': {
      'ja': '',
      'en': '',
    },
    '98d7157x': {
      'ja': '',
      'en': '',
    },
    '3zysb24k': {
      'ja': '',
      'en': '',
    },
    'ozvr9ysg': {
      'ja': '',
      'en': '',
    },
    'a1zjonk6': {
      'ja': '',
      'en': '',
    },
    '2vywxvwj': {
      'ja': '',
      'en': '',
    },
    'pkkint6c': {
      'ja': '',
      'en': '',
    },
    '6lu402lz': {
      'ja': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
