import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<IpponsStruct> _ipponAppState = [
    IpponsStruct.fromSerializableMap(jsonDecode(
        '{\"ipponUserName\":\"Hello World\",\"ipponEvaluated\":\"false\",\"ipponAnswer\":\"Hello World\",\"sortRandomNum\":\"0\"}'))
  ];
  List<IpponsStruct> get ipponAppState => _ipponAppState;
  set ipponAppState(List<IpponsStruct> value) {
    _ipponAppState = value;
  }

  void addToIpponAppState(IpponsStruct value) {
    ipponAppState.add(value);
  }

  void removeFromIpponAppState(IpponsStruct value) {
    ipponAppState.remove(value);
  }

  void removeAtIndexFromIpponAppState(int index) {
    ipponAppState.removeAt(index);
  }

  void updateIpponAppStateAtIndex(
    int index,
    IpponsStruct Function(IpponsStruct) updateFn,
  ) {
    ipponAppState[index] = updateFn(_ipponAppState[index]);
  }

  void insertAtIndexInIpponAppState(int index, IpponsStruct value) {
    ipponAppState.insert(index, value);
  }

  List<String> _ipponTheme = [
    'こんな〇〇は嫌だ。その理由とは？',
    '「はぁ〜、もう疲れたなぁ...」とため息をつくお地蔵さん。その理由とは？',
    '「嘘だろ…？」コンビニの店員が思わずつぶやいた。何があった？',
    '居酒屋で注文した料理が来る前に、店員さんが一言。なんて言った？',
    '早口言葉のプロが唯一言えない早口言葉とは？',
    'もしも、猫が人間になったら、最初にすることとは？',
    'もしも体が透明になったら、7番最初に何をしたい？',
    'もしも、空を自由に飛べたら、2番最初に何をしたい？',
    'もしも、信号機が全て赤色になったら、どうなる？',
    '宇宙人とのファーストコンタクト。第一声で何を言う？',
    'タイムマシンで過去に行ったら、歴史を変えずに何をしたい？',
    '昔々あるところに…って、どんな昔話？',
    '「いや、そこは謝れよ！」どんな状況？',
    '未来の教科書に載っていた衝撃の一文とは？',
    '世界一やる気のないスーパーヒーローの必殺技とは？',
    '一番テンションが下がるサプライズパーティーの内容とは？',
    '「こんな自動販売機はいやだ」何が出てきた？',
    '「世界一おしゃれな給食」どんなメニュー？',
    '「通知表に新しい項目が追加」何の評価？',
    'こんな先生は嫌だどんな先生？',
    '新しいスポーツ「おにごっこボール」。ルールを一言で説明してください。',
    'AIが絶対に言わない一言。',
    '居酒屋で隣の席から聞こえてきた衝撃の一言。',
    '「人生ゲーム」に新しいマスを追加してください。',
    'おじいちゃんがTikTokでバズった理由。',
    '世界一使えない超能力とは？',
    '5年後のコンビニに絶対置いてある商品。',
    '宇宙人が初めて地球で食べたものとは？',
    '面接で落ちる人が言いがちな一言。',
    '一番盛り上がらないプロポーズの言葉。'
  ];
  List<String> get ipponTheme => _ipponTheme;
  set ipponTheme(List<String> value) {
    _ipponTheme = value;
  }

  void addToIpponTheme(String value) {
    ipponTheme.add(value);
  }

  void removeFromIpponTheme(String value) {
    ipponTheme.remove(value);
  }

  void removeAtIndexFromIpponTheme(int index) {
    ipponTheme.removeAt(index);
  }

  void updateIpponThemeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ipponTheme[index] = updateFn(_ipponTheme[index]);
  }

  void insertAtIndexInIpponTheme(int index, String value) {
    ipponTheme.insert(index, value);
  }

  int _odaiNum = 0;
  int get odaiNum => _odaiNum;
  set odaiNum(int value) {
    _odaiNum = value;
  }

  bool _isAdShow = false;
  bool get isAdShow => _isAdShow;
  set isAdShow(bool value) {
    _isAdShow = value;
  }

  int _tryGameTime = 0;
  int get tryGameTime => _tryGameTime;
  set tryGameTime(int value) {
    _tryGameTime = value;
  }

  List<String> _ipponThemeEnglish = [
    'Describe the worst possible roommate.',
    'What would a very passive-aggressive robot sound like?',
    'Tell us something that would instantly ruin a wedding.',
    'What might you hear at a haunted Starbucks?',
    'What’s something that sounds illegal but isn’t?',
    'What’s the weirdest thing to say while hugging someone?',
    'Give a terrible opening line for a motivational speech.',
    'Describe a horror movie... starring vegetables.',
    'What would a toddler say if they were 40 years old?',
    'What does your phone secretly think about you?',
    'Describe the world’s most confusing app.',
    'What would a villain say before starting their 9-to-5 office job?',
    'What happens when a ghost gets a job at a call center?',
    'What’s something you should never say during a job interview?',
    'Describe a cooking show hosted by someone who can’t cook.',
    'What would Shakespeare do if he were alive today?',
    'What might a duck say if it were sick of being a duck?',
    'Describe the worst souvenir someone could bring back from space.',
    'What does the moon complain about when no one’s looking?',
    'What’s the real reason dinosaurs went extinct?',
    'A new sport, “Tag Ball.” Explain the rules in one sentence.',
    'Something an AI would never say.',
    'A shocking line overheard at an izakaya.',
    'Add a new square to the Game of Life.',
    'Why did Grandpa go viral on TikTok?',
    'What’s the most useless superpower in the world?',
    'What was the first thing an alien ate on Earth?',
    'A line people often say that gets them rejected in interviews.',
    'A creature God accidentally created.',
    'The least romantic marriage proposal ever.'
  ];
  List<String> get ipponThemeEnglish => _ipponThemeEnglish;
  set ipponThemeEnglish(List<String> value) {
    _ipponThemeEnglish = value;
  }

  void addToIpponThemeEnglish(String value) {
    ipponThemeEnglish.add(value);
  }

  void removeFromIpponThemeEnglish(String value) {
    ipponThemeEnglish.remove(value);
  }

  void removeAtIndexFromIpponThemeEnglish(int index) {
    ipponThemeEnglish.removeAt(index);
  }

  void updateIpponThemeEnglishAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ipponThemeEnglish[index] = updateFn(_ipponThemeEnglish[index]);
  }

  void insertAtIndexInIpponThemeEnglish(int index, String value) {
    ipponThemeEnglish.insert(index, value);
  }

  List<DrinkingGamesDateStruct> _drinkingGameStates = [
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"スーパーマリオゲーム\",\"description\":\"参加者が順番に「スー！」「パー！」「マリ！」「オ！」とリズムよく言っていくゲームです。\\n次のラウンドでは「スーパー！」「マリオ！」と続け、さらに次のラウンドからは「スーパーマリオ！」に加えて「コイン！」を回数分言うようになります。\\nラウンドが進むたびに『コイン！』の回数が増えていきます。\\n言い間違えたり、リズムを崩したり、順番を間違えた人が罰ゲームとしてお酒を飲みます。\",\"minPlayers\":\"2\",\"recommendStar\":\"3\",\"subTitle\":\"順番に「スーパーマリオ」をリズムよく言っていくゲームです。\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"false\",\"titleEn\":\"Super Mario Game\",\"descriptionEn\":\"Players take turns saying \'Suu!\', \'Paa!\', \'Mari!\', \'O!\' in rhythm. In the next round, it becomes \'Super!\' \'Mario!\', and from the following rounds, \'Super Mario!\' is followed by \'Coin!\' repeated according to the round number. As rounds progress, the number of \'Coin!\' increases, making it harder. Anyone who makes a mistake, breaks the rhythm, or misses their turn must drink as a penalty.\",\"subTitleEn\":\"Say \'Super Mario!\' and \'Coin!\' in rhythm as the game progresses\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"どすこい\",\"description\":\"親（進行役）がひらがな1文字を指定して『どすこい！〇！』と発表します。\\n例えば『どすこい！か！』と言った場合、参加者は親指を0〜数本立てます。\\n立てた親指の本数と同じ文字数で、その文字から始まる単語を言わなければなりません（例：親指を2本立てた場合は『カメ』など）。\\n言うときは必ず『カメどすこい！』のように語尾に『どすこい！』をつけます。\\n早い者勝ちで言葉を埋めていき、最後まで単語が言えなかった人やルールを間違えた人がお酒を飲みます。\\n語彙力と瞬発力が試される盛り上がりゲームです。\",\"minPlayers\":\"2\",\"recommendStar\":\"5\",\"subTitle\":\"ひらがなから始まる単語を早い者勝ちで言うゲームです。\",\"isOnlyJapan\":\"true\",\"useThisApp\":\"false\",\"titleEn\":\"Dosukoi Game\",\"descriptionEn\":\"The leader picks an alphabet letter and says \'Dosukoi! (letter)!\'. For example, \'Dosukoi! B!\'. Players raise 0–several thumbs, then must shout out a word starting with that letter with the same number of characters (e.g., 2 thumbs: \'Be\'). Every word must be finished with \'Dosukoi!\' (e.g., \'Be Dosukoi!\'). It\'s a race to respond — anyone who fails to answer in time or makes a mistake drinks. A lively party game that mixes language, reflexes, and lots of laughs.\",\"subTitleEn\":\"Make words starting with a given letter, or drink if you fail.\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"ルパン三世ゲーム\",\"description\":\"親がルパン三世のオープニングテーマ曲の冒頭部分全員で歌います。\\n親が音楽に合わせて指をさしていきます。\\n「トゥル」「トゥル」と続け、7回目に指された人が全員から「ルパンザサード！」とコールされ負けとなります。\\n負けた人はコールに合わせてお酒を飲むルールです。\\nリズム感とスリルが盛り上がりを生むゲームです。\\n\\n※ポイントは、親の人がランダムの運ゲーであることをアピールしてからスタートすることです\",\"minPlayers\":\"3\",\"recommendStar\":\"2\",\"subTitle\":\"ルパン三世のオープニング曲の冒頭に合わせて1人を指差す完全ランダムなゲームです。\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"false\",\"titleEn\":\"Lupin the Third Game\",\"descriptionEn\":\"The leader and all players start by singing the intro of Lupin the Third’s opening theme. The leader points to players in rhythm with each \'Turu\', choosing randomly. On the 7th \'Turu\', the chosen player is called out by everyone with \'Lupin the Third!\' and loses. The loser must drink to the call. A key point: the leader must emphasize at the start that it’s a pure game of chance. Rhythm, suspense, and luck make this an exciting drinking game.\",\"subTitleEn\":\"Pass the rhythm with Lupin the Third’s theme; the chosen one drinks.\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"山手線ゲーム\",\"description\":\"まず参加者全員で順番を決めます。\\n「山手線ゲーム！」と掛け声をかけてスタート。最初の人が駅名などのお題を言い、その後手拍子を2回打って次の人へ回します。\\n時計回りで順番にお題に沿った回答をリズムよく言っていき、間違えたり、思いつかなかったり、リズムが崩れた人が負けでお酒を飲みます。\\n駅名以外にも「動物」「食べ物」などのお題を自由に設定して遊べます。\",\"minPlayers\":\"2\",\"recommendStar\":\"4\",\"subTitle\":\"リズムに合わせて順番にお題を答えていく定番の飲み会ゲームです。\\n例えば駅名やフルーツ、芸能人など、幅広いテーマで遊べます。\\nこのアプリでは自動的に様々なジャンルのテーマを提示してくれるので、より手軽に盛り上がれます。\\n答えられなかったり、繰り返したり、リズムを外した人は罰ゲームとしてお酒を飲みましょう。\",\"isOnlyJapan\":\"true\",\"useThisApp\":\"true\",\"thisAppNav\":\"yamanote\",\"titleEn\":\"Yamanote Line Game\",\"descriptionEn\":\"A classic drinking game where players take turns answering in rhythm according to a theme. Examples include station names, fruits, or celebrities. In this app, themes are provided automatically from a wide range of categories, making it easier and more fun to play. Anyone who fails to answer, repeats, or breaks the rhythm must drink as a penalty.\",\"subTitleEn\":\"Players take turns saying words that match the theme.\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"コイントスゲーム\",\"description\":\"参加者が順番にコインを投げます。\\n表か裏かを予想して呼び、その結果が外れたら飲む。\\n連続で予想を当てられた人はチャレンジとして別のルールを追加するなどアレンジ可能です。\",\"minPlayers\":\"2\",\"recommendStar\":\"1\",\"subTitle\":\"コイン投げで表裏を予想する単純ゲームです。\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"true\",\"thisAppNav\":\"cointoss\",\"titleEn\":\"Coin Toss\",\"descriptionEn\":\"Players take turns tossing a coin and calling heads or tails. If the guess is wrong, the player must drink. Those who guess correctly several times in a row can add new challenge rules, making the game customizable. A simple yet exciting drinking game of luck and courage.\",\"subTitleEn\":\"Guess heads or tails; drink if you’re wrong\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"マイノリティゲーム\",\"description\":\"お題を出して、参加者全員がそのお題に対してどっち派などの選択をします。\\nランダムで少数派または多数派が飲みます。\\nお題は「コーヒー派／紅茶派」「朝型／夜型」など簡単なものがおすすめ。\",\"minPlayers\":\"3\",\"recommendStar\":\"3\",\"subTitle\":\"多数派か少数派がランダムで飲むゲームです。\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"false\",\"thisAppNav\":\"minority\",\"titleEn\":\"Minority Game\",\"descriptionEn\":\"Players are given a topic and must choose their preference, such as \'Coffee or Tea?\' or \'Morning person or Night owl?\'. After everyone chooses, either the minority or the majority group is randomly selected to drink. With this app, topics are automatically provided, and the drinking side is randomly chosen, keeping the game fair and fun. It’s a simple yet unpredictable game that always sparks laughter!\",\"subTitleEn\":\"Choose your side and see if you\'re in the minority or majority.\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"早口言葉ゲーム\",\"description\":\"参加者全員が順番に早口言葉を言っていくシンプルなゲームです。\\n例えば「生麦生米生卵」や「赤巻紙青巻紙黄巻紙」などの定番の早口言葉を使います。\\n言いにくくなったり噛んだりしたらその人がお酒を飲むルールです。このアプリでは制限時間つきで早口言葉を行うことができるのでオススメです！\",\"minPlayers\":\"2\",\"recommendStar\":\"4\",\"subTitle\":\"早口言葉で噛んだら飲むチャレンジゲームです。\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"true\",\"thisAppNav\":\"hayakuti\",\"titleEn\":\"Tongue Twister Game\",\"descriptionEn\":\"A simple game where all participants take turns saying tongue twisters.\\nFor example, phrases like “She sells seashells by the seashore” or “Peter Piper picked a peck of pickled peppers.”\\nIf someone stumbles or mispronounces the phrase, they have to drink.\\nWith this app, you can also play with a time limit, making it even more exciti\",\"subTitleEn\":\"Take turns saying tongue twisters; mess up and drink.\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"ルーレットゲーム\",\"description\":\"ルーレットで出た目に関する人が飲むゲームです。\\n例えば、二重や一人暮らしなどです。\\n当てはまる人が飲むという形式なので全員で盛り上がれます。\\n\",\"minPlayers\":\"2\",\"recommendStar\":\"5\",\"subTitle\":\"ルーレットで出た結果に従うゲームです。\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"true\",\"thisAppNav\":\"roulette\",\"titleEn\":\"Roulette Game\",\"descriptionEn\":\"A roulette decides a random topic, and anyone who matches the condition has to drink. For example, \'People with double eyelids\' or \'People living alone\'. If multiple players match, everyone drinks together, making it lively and fun. It also sparks conversation naturally. With this app, the roulette spins automatically and presents the topics, so you can start playing instantly with no preparation needed!\",\"subTitleEn\":\"Spin the roulette and whoever matches the topic has to drink\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"大喜利\",\"description\":\"アプリがランダムにお題を出します。参加者は制限時間内に面白い答えを考えて発表します。\\n一番ウケなかった人やタイムオーバーの人がお酒を飲みます。笑いながら盛り上がるゲームです。\",\"minPlayers\":\"2\",\"recommendStar\":\"2\",\"subTitle\":\"アプリでお題を出して回答するゲームです。\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"true\",\"thisAppNav\":\"ogiri\",\"titleEn\":\"ogiri\",\"descriptionEn\":\"The app gives a random prompt. Players must come up with a funny answer within the time limit. The least funny or slowest player drinks. A game full of laughs!\",\"subTitleEn\":\"Answer prompts from the app!\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"ポーカーくじ引き\",\"description\":\"参加者はアプリでカードが配られて、ポーカーの役を作ります。\\n最も弱い役の人や役が揃わなかった人がお酒を飲みます。\\nテキサスホールデム形式で行えるおしゃれなくじ引きです。\",\"minPlayers\":\"2\",\"recommendStar\":\"4\",\"subTitle\":\"ポーカー形式で出た役が最も弱い人が飲む\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"true\",\"thisAppNav\":\"poker\",\"titleEn\":\"Poker Lottery Drink\",\"descriptionEn\":\"Players are dealt cards via the app and form poker hands in Texas Hold\'em style.\\n The player with the weakest hand or no hand drinks. \\nA stylish lottery game\",\"subTitleEn\":\"The player with the weakest hand drinks!\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"トランプフリップゲーム\",\"description\":\"プレイヤーは順番にトランプのカードをめくります。\\nめくったカードがJ、Q、K、またはジョーカーだった場合、その人がお酒を飲みます。\\n運とドキドキ感が楽しめるシンプルな飲みゲーです。\",\"minPlayers\":\"2\",\"recommendStar\":\"5\",\"subTitle\":\"カードをめくってJ、Q、K、ジョーカーが出たら飲むゲームです。\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"true\",\"thisAppNav\":\"flip\",\"titleEn\":\"Trump Flip Game\",\"descriptionEn\":\"Players take turns flipping a card. If the card is J, Q, K, or Joker, the player drinks. A simple and exciting game of luck and suspense!\",\"subTitleEn\":\"Flip a card ; drink if it’s J, Q, K, or Joker\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"歌を歌えゲーム\",\"description\":\"①みんなで「歌を歌え、歌歌え♪」と掛け声をします。\\n② 最初の人が『うたを』と言ってランダムに1人を指します。\\n③ 指された人は『うたえ』と言って、さらにランダムに1人を指します。\\n④ 指された人は『歌手名』を言って、ランダムに1人を指します。\\n⑤ 指された人は、その歌手の曲を何でもいいので1フレーズ歌います。\\n誰よりも早く歌えたらセーフです。\\n⑥ 歌えなかった人や遅れてしまった人が負けとなり、お酒を飲むルールです。音楽好きが盛り上がるリズム＆瞬発力ゲームです。\",\"minPlayers\":\"3\",\"recommendStar\":\"3\",\"subTitle\":\"みんなでリズムに合わせて歌手を指名し、曲を歌うゲーム！\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"false\",\"thisAppNav\":\"\",\"titleEn\":\"Sing A Song Game\",\"descriptionEn\":\"①Everyone chants together: “Sing a song, sing, sing♪”\\n②The first player says “Sing a” and points to someone at random.\\n③The chosen player says “Song” and points to another player.\\n④That player must call out the name of a singer and point to someone else.\\n⑤The chosen player must sing a phrase from any song by that singer. \\nIf they sing faster than anyone else, they’re safe.\\n⑥If they fail to sing or are too slow, they lose and must drink. This is a rhythm-and-reflex party game that music lovers will especially enjoy.\",\"subTitleEn\":\"Call out a singer and sing their song in a fast-paced party game\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"指差しゲーム\",\"description\":\"参加者全員で「せーの！」の掛け声と同時に誰かを指差します。\\nもし2人がお互いを同時に指差した場合、その2人はペアとなり一緒にお酒を飲みます。\\n単純ながら盛り上がる、偶然の一致を楽しむゲームです。\",\"minPlayers\":\"4\",\"recommendStar\":\"4\",\"subTitle\":\"せーので指を指して、指が合ったら飲むゲーム！\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"false\",\"thisAppNav\":\"\",\"titleEn\":\"Pointing Game\",\"descriptionEn\":\"All players point at someone at the same time after shouting \'Ready, Go!\'. \\nIf two players point at each other, they form a pair and must drink together. \\nA simple yet exciting game that thrives on coincidence and laughter.\",\"subTitleEn\":\"On \'Ready, Go!\' point at someone — if you point at each other, you both drink!\"}')),
    DrinkingGamesDateStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"5秒チャレンジゲーム\",\"description\":\"参加者が順番に心の中で5秒を数えます。\\n自分の感覚で「ここだ！」と思ったタイミングでストップを宣言します。\\n5秒に一番近かった人が勝ち、遠かった人がお酒を飲むルールです。\\nシンプルながら集中力と感覚が試される盛り上がりゲームです。\",\"minPlayers\":\"2\",\"recommendStar\":\"4\",\"subTitle\":\"5秒を心の中で数えてピッタリで止めるゲーム！\",\"isOnlyJapan\":\"false\",\"useThisApp\":\"true\",\"thisAppNav\":\"five\",\"titleEn\":\"5 Second Challenge\",\"descriptionEn\":\"Players take turns silently counting 5 seconds in their head. \\nAt the moment they believe 5 seconds have passed, they must call \'Stop!\'. \\nThe player closest to exactly 5 seconds wins, while the one farthest away must drink. \\nA simple yet thrilling game that tests focus, timing, and intuition.\",\"subTitleEn\":\"Count to 5 seconds in your head and stop exactly on time!\"}'))
  ];
  List<DrinkingGamesDateStruct> get drinkingGameStates => _drinkingGameStates;
  set drinkingGameStates(List<DrinkingGamesDateStruct> value) {
    _drinkingGameStates = value;
  }

  void addToDrinkingGameStates(DrinkingGamesDateStruct value) {
    drinkingGameStates.add(value);
  }

  void removeFromDrinkingGameStates(DrinkingGamesDateStruct value) {
    drinkingGameStates.remove(value);
  }

  void removeAtIndexFromDrinkingGameStates(int index) {
    drinkingGameStates.removeAt(index);
  }

  void updateDrinkingGameStatesAtIndex(
    int index,
    DrinkingGamesDateStruct Function(DrinkingGamesDateStruct) updateFn,
  ) {
    drinkingGameStates[index] = updateFn(_drinkingGameStates[index]);
  }

  void insertAtIndexInDrinkingGameStates(
      int index, DrinkingGamesDateStruct value) {
    drinkingGameStates.insert(index, value);
  }
}
