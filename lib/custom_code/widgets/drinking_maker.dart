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

import 'dart:math' as math;

class DrinkingMaker extends StatefulWidget {
  const DrinkingMaker({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DrinkingMaker> createState() => _DrinkingMakerState();
}

class _DrinkingMakerState extends State<DrinkingMaker>
    with TickerProviderStateMixin {
  // 状態管理
  String _view = 'home'; // home, play
  Map<String, dynamic>? _currentCard;
  List<Map<String, dynamic>> _history = [];
  bool _showHistory = false;
  bool _showConfirmClear = false;
  bool _isAnimating = false;
  int _adCounter = 0; // ★ 広告用のカウンター

  // アニメーション用
  late AnimationController _bounceController;
  late AnimationController _spinController;

  // 言語データ & お題翻訳
  final Map<String, Map<String, String>> _i18n = {
    'ja': {
      'app_title': '飲みゲー\nメイカー',
      'app_subtitle': 'STANDARD EDITION',
      'info_text': '順番にボタンを押して指示に従ってください',
      'btn_start': '開始する',
      'ready_title': '準備はいい？',
      'ready_subtitle': 'スマホを中心において開始してね',
      'btn_game_start': 'ゲーム開始',
      'btn_next': '次の指示',
      'btn_back_title': 'タイトルに戻る',
      'history_title': '指示の履歴',
      'history_clear': 'すべて消去する',
      'history_empty': '履歴はまだありません',
      'confirm_clear_title': '履歴をリセットしますか？',
      'confirm_clear_desc': 'これまでに出た全ての指示が消去されます。\nこの操作は取り消せません。',
      'btn_yes_clear': 'はい、すべて消去する',
      'btn_cancel': 'キャンセル',
      'btn_close': '閉じる',
      'drink': 'DRINK',
      'game': 'GAME',
      'rule': 'RULE',
      'truth': 'TRUTH',
      'dare': 'DARE',
      'special': 'SPECIAL',
      'ch_right': '右隣の人が半分飲む！',
      'ch_left': '左隣の人が半分飲む！',
      'ch_all': '全員で乾杯！半分ずつ飲む。',
      'ch_yamanote': '【山手線ゲーム】お題：お酒の種類。負けた人が半分飲む！',
      'ch_kokon': '【古今東西】お題：赤いもの。負けた人が半分飲む！',
      'ch_keigo': '【新ルール】これ以降、敬語禁止！破ったら半分飲む。',
      'ch_lefty': '【新ルール】これ以降、飲み物を飲む時は左手限定！',
      'ch_failure': '【暴露】最近した一番恥ずかしい失敗を話す。話したくないなら半分飲む！',
      'ch_phone': '【無茶振り】スマホの履歴にある最後に電話した人に「おやすみ」と送る。できないなら半分飲む！',
      'ch_you_drink': 'このボタンを押した人が半分飲む！',
      'ch_assign': 'このボタンを押した人が、誰か一人を指名して飲ませる！',
      'ch_yubisuma': '【指スマ】全員で勝負！最後に残った人が半分。',
      'ch_remain': '今、一番お酒が残っている人が半分飲む！',
      'ch_empty': '今、一番お酒が減っている人が半分追加！',
      'ch_countup': '【カウントアップ】1から順に数字を言う。3の倍数でアホになる。失敗したら半分。',
      'ch_oldest': '一番年上の人が半分飲む！',
      'ch_youngest': '一番年下の人が半分飲む！',
      'ch_black': '黒い服を着ている人、全員半分！',
      'ch_blood_a': '血液型がA型の人、全員半分！',
      'ch_far': '今日、一番遠くから来た人が半分！',
      'ch_janken': '【後出しジャンケン】ボタンを押した人と全員が勝負。わざと負けられなかったら半分！',
      'ch_hoi': '【あっち向いてホイ】隣の人と真剣勝負！負けたら半分。',
      'ch_katakana': '【新ルール】カタカナ語禁止！使ったら半分。',
      'ch_type': '【暴露】この中で「一番タイプな人」を指名。言えないなら半分！',
      'ch_nyan': '【無茶振り】5分間、語尾に「にゃん」をつけて喋る。忘れたら半分。',
      'ch_face_down': '全員スマホを伏せる。一番最後に伏せた人が半分飲む！',
      'ch_pointing': '全員で一斉に誰かを指さす。一番多く指された人が半分飲む！',
      'ch_sns': '最近SNSに投稿した人が半分飲む！',
      'ch_impression': '【第一印象ゲーム】「一番モテそうな人」をせーので指差し。選ばれた人が半分！',
      'ch_arimasu': '【新ルール】全員、語尾に「であります」をつける。忘れたら半分！',
      'ch_fix': '【暴露】この中で一番「直してほしいところ」がある人を指名。言えないなら半分！',
      'ch_animal': '【無茶振り】全力で動物のものまね。似てなかったら半分！',
      'ch_battery': 'スマホの充電が一番少ない人が半分飲む！',
      'ch_name_a': '名前に「あ」が入っている人、全員半分飲む！',
      'ch_niramekko': '【にらめっこ】ボタンを押した人と右隣の人が勝負！笑ったら半分。',
      'ch_finger': '【新ルール】お酒を飲むときは必ず小指を立てること。忘れたら半分！',
      'ch_last_order': '一番最近お酒を注文（または追加）した人が半分飲む！',
    },
    'en': {
      'app_title': 'Drinking Game\nMaker',
      'app_subtitle': 'STANDARD EDITION',
      'info_text': 'Take turns pressing the button and follow instructions',
      'btn_start': 'START',
      'ready_title': 'Ready?',
      'ready_subtitle': 'Place the phone in the center and start',
      'btn_game_start': 'Game Start',
      'btn_next': 'Next Card',
      'btn_back_title': 'Back to Title',
      'history_title': 'History',
      'history_clear': 'Clear All',
      'history_empty': 'No history yet',
      'confirm_clear_title': 'Reset history?',
      'confirm_clear_desc':
          'All previous instructions will be deleted.\nThis action cannot be undone.',
      'btn_yes_clear': 'Yes, Clear All',
      'btn_cancel': 'Cancel',
      'btn_close': 'Close',
      'drink': 'DRINK',
      'game': 'GAME',
      'rule': 'RULE',
      'truth': 'TRUTH',
      'dare': 'DARE',
      'special': 'SPECIAL',
      'ch_right': 'Person to your right drinks half!',
      'ch_left': 'Person to your left drinks half!',
      'ch_all': 'Cheers! Everyone drinks half.',
      'ch_yamanote':
          '[Category Game] Topic: Types of alcohol. Loser drinks half!',
      'ch_kokon': '[Category Game] Topic: Red things. Loser drinks half!',
      'ch_keigo':
          '[New Rule] No formal speech allowed! If you break it, drink half.',
      'ch_lefty': '[New Rule] Use only your left hand to drink!',
      'ch_failure':
          '[Truth] Tell your most embarrassing story. If you refuse, drink half!',
      'ch_phone':
          '[Dare] Send "Good night" to the last person you called. If you refuse, drink half!',
      'ch_you_drink': 'The person who pressed this button drinks half!',
      'ch_assign': 'Assign someone to drink half!',
      'ch_yubisuma':
          '[Yubisuma] Everyone plays! The last one standing drinks half.',
      'ch_remain': 'The person with the most drink left drinks half!',
      'ch_empty': 'The person with the least drink left adds half!',
      'ch_countup':
          '[Count Up] 1, 2, 3... at multiples of 3, act silly. Failure drinks half.',
      'ch_oldest': 'The oldest person drinks half!',
      'ch_youngest': 'The youngest person drinks half!',
      'ch_black': 'Everyone wearing black drinks half!',
      'ch_blood_a': 'Everyone with Type A blood drinks half!',
      'ch_far': 'The person who traveled furthest to be here drinks half!',
      'ch_janken':
          '[Rock Paper Scissors] Person who pressed the button vs everyone. If you fail to lose on purpose, drink half!',
      'ch_hoi': '[Look Over There] Battle your neighbor! Loser drinks half.',
      'ch_katakana':
          '[New Rule] No Loanwords (Katakana words) allowed! If you break it, drink half.',
      'ch_type':
          '[Truth] Point to your "crush" in the room. If you refuse, drink half!',
      'ch_nyan':
          '[Dare] Add "Meow" to the end of your sentences for 5 mins. Forget? Drink half.',
      'ch_face_down': 'Everyone place phones face down. Last one drinks half!',
      'ch_pointing': 'Everyone point to someone. Most pointed drinks half!',
      'ch_sns': 'The person who posted on SNS most recently drinks half!',
      'ch_impression':
          '[First Impression] Point to the person most likely to be popular. Selected drinks half!',
      'ch_arimasu':
          '[New Rule] Add "Sir/Ma\'am" to every sentence. Forget? Drink half.',
      'ch_fix':
          '[Truth] Point to the person who should fix something about themselves. Refuse? Drink half!',
      'ch_animal': '[Dare] Animal impression! If it\'s not good, drink half!',
      'ch_battery': 'Person with the lowest phone battery drinks half!',
      'ch_name_a': 'Everyone whose name contains "A" drinks half!',
      'ch_niramekko':
          '[Staring Contest] Button presser vs right neighbor. First to laugh drinks half.',
      'ch_finger':
          '[New Rule] Stick your pinky out while drinking. Forget? Drink half!',
      'ch_last_order': 'The last person to order a drink drinks half!',
    },
    'ms': {
      'app_title': 'Permainan\nMinum',
      'app_subtitle': 'EDISI STANDARD',
      'info_text': 'Bergilir-gilir tekan butang dan ikut arahan',
      'btn_start': 'MULA',
      'ready_title': 'Sedia?',
      'ready_subtitle': 'Letakkan telefon di tengah dan mula',
      'btn_game_start': 'Mula Permainan',
      'btn_next': 'Seterusnya',
      'btn_back_title': 'Kembali ke Tajuk',
      'history_title': 'Sejarah',
      'history_clear': 'Padam Semua',
      'history_empty': 'Tiada sejarah lagi',
      'confirm_clear_title': 'Reset sejarah?',
      'confirm_clear_desc':
          'Semua arahan sebelumnya akan dipadamkan.\nTindakan ini tidak boleh dibatalkan.',
      'btn_yes_clear': 'Ya, Padam Semua',
      'btn_cancel': 'Batal',
      'btn_close': 'Tutup',
      'drink': 'MINUM',
      'game': 'PERMAINAN',
      'rule': 'PERATURAN',
      'truth': 'KEBENARAN',
      'dare': 'CABARAN',
      'special': 'ISTIMEWA',
      'ch_right': 'Orang di sebelah kanan anda minum separuh!',
      'ch_left': 'Orang di sebelah kiri anda minum separuh!',
      'ch_all': 'Semua minum separuh!',
      'ch_yamanote':
          '[Permainan Kategori] Topik: Jenis alkohol. Yang kalah minum separuh!',
      'ch_kokon':
          '[Permainan Kategori] Topik: Benda merah. Yang kalah minum separuh!',
      'ch_keigo':
          '[Peraturan Baru] Dilarang bercakap formal! Siapa langgar, minum separuh.',
      'ch_lefty': '[Peraturan Baru] Gunakan tangan kiri sahaja untuk minum!',
      'ch_failure':
          '[Kebenaran] Ceritakan kegagalan paling memalukan anda. Jika enggan, minum separuh!',
      'ch_phone':
          '[Cabaran] Hantar "Selamat malam" kepada orang terakhir anda panggil. Jika gagal, minum separuh!',
      'ch_you_drink': 'Orang yang tekan butang ini minum separuh!',
      'ch_assign': 'Pilih seseorang untuk minum separuh!',
      'ch_yubisuma':
          '[Yubisuma] Semua lawan! Yang terakhir kalah minum separuh.',
      'ch_remain': 'Siapa paling banyak baki minuman, minum separuh!',
      'ch_empty': 'Siapa paling sikit baki minuman, tambah separuh!',
      'ch_countup':
          '[Count Up] 1, 2, 3... setiap gandaan 3, jadi kelakar. Gagal? Minum separuh.',
      'ch_oldest': 'Orang paling tua minum separuh!',
      'ch_youngest': 'Orang paling muda minum separuh!',
      'ch_black': 'Sesiapa memakai baju hitam, minum separuh!',
      'ch_blood_a': 'Sesiapa berdarah Jenis A, minum separuh!',
      'ch_far': 'Siapa datang dari paling jauh, minum separuh!',
      'ch_janken': '[Jan-ken-pon] Sengaja kalah. Gagal? Minum separuh!',
      'ch_hoi': '[Look Over There] Lawan jiran sebelah! Kalah minum separuh.',
      'ch_katakana':
          '[Peraturan Baru] Dilarang guna kata pinjaman asing! Langgar? Minum separuh.',
      'ch_type':
          '[Kebenaran] Siapa "crush" anda di sini? Enggan beritahu? Minum separuh!',
      'ch_nyan':
          '[Cabaran] Tambah "Meow" setiap ayat selama 5 minit. Lupa? Minum separuh.',
      'ch_face_down':
          'Semua letak telefon tertelungkup. Siapa lambat minum separuh!',
      'ch_pointing':
          'Semua tunjuk orang. Siapa paling banyak ditunjuk minum separuh!',
      'ch_sns': 'Siapa baru post di SNS, minum separuh!',
      'ch_impression':
          '[Tanggapan Pertama] Siapa paling popular? Orang terpilih minum separuh!',
      'ch_arimasu':
          '[Peraturan Baru] Tambah "Tuan/Puan" setiap ayat. Lupa? Minum separuh.',
      'ch_fix':
          '[Kebenaran] Tunjuk orang yang perlu betulkan perangai. Enggan? Minum separuh!',
      'ch_animal':
          '[Cabaran] Ajuk bunyi haiwan! Jika tak serupa, minum separuh!',
      'ch_battery': 'Siapa bateri telefon paling rendah, minum separuh!',
      'ch_name_a': 'Siapa nama ada huruf "A", minum separuh!',
      'ch_niramekko':
          '[Niramekko] Jangan ketawa! Siapa ketawa dulu minum separuh.',
      'ch_finger':
          '[Peraturan Baru] Angkat jari kelingking masa minum. Lupa? Minum separuh!',
      'ch_last_order': 'Orang terakhir yang pesan minuman, minum separuh!',
    },
    'ru': {
      'app_title': 'Drinking\nMaker',
      'app_subtitle': 'СТАНДАРТНОЕ ИЗДАНИЕ',
      'info_text': 'По очереди нажимайте на кнопку и следуйте инструкциям',
      'btn_start': 'НАЧАТЬ',
      'ready_title': 'Готовы?',
      'ready_subtitle': 'Положите телефон в центр и начинайте',
      'btn_game_start': 'Начать игру',
      'btn_next': 'Следующий',
      'btn_back_title': 'В заголовок',
      'history_title': 'История',
      'history_clear': 'Очистить все',
      'history_empty': 'Истории пока нет',
      'confirm_clear_title': 'Сбросить историю?',
      'confirm_clear_desc':
          'Все предыдущие инструкции будут удалены.\nЭто действие нельзя отменить.',
      'btn_yes_clear': 'Да, очистить все',
      'btn_cancel': 'Отмена',
      'btn_close': 'Закрыть',
      'drink': 'ПИТЬ',
      'game': 'ИГРА',
      'rule': 'ПРАВИЛО',
      'truth': 'ПРАВДА',
      'dare': 'ВЫЗОВ',
      'special': 'СПЕЦ',
      'ch_right': 'Сосед справа пьет половину!',
      'ch_left': 'Сосед слева пьет половину!',
      'ch_all': 'Все пьют по половине!',
      'ch_yamanote':
          '[Категории] Тема: Виды алкоголя. Проигравший пьет половину!',
      'ch_kokon': '[Категории] Тема: Красные вещи. Проигравший пьет половину!',
      'ch_keigo':
          '[Новое правило] Никакой официальной речи! Нарушитель пьет половину.',
      'ch_lefty': '[Новое правило] Пейте только левой рукой!',
      'ch_failure':
          '[Правда] Расскажите о самом позорном провале. Или пейте половину!',
      'ch_phone':
          '[Вызов] Отправьте "Спокойной ночи" последнему контакту. Или пейте половину!',
      'ch_you_drink': 'Тот, кто нажал кнопку, пьет половину!',
      'ch_assign': 'Выберите того, кто выпьет половину!',
      'ch_yubisuma': '[Юбисума] Играют все! Последний выживший пьет половину.',
      'ch_remain': 'У кого больше всего осталось в стакане, пьет половину!',
      'ch_empty': 'У кого меньше всего осталось, доливает половину!',
      'ch_countup':
          '[Счет] На каждое число кратное 3 делайте глупость. Ошибка — пьешь половину.',
      'ch_oldest': 'Самый старший пьет половину!',
      'ch_youngest': 'Самый младший пьет половину!',
      'ch_black': 'Все, кто в черном, пьют половину!',
      'ch_blood_a': 'Все со 2-й группой крови (A), пьют половину!',
      'ch_far': 'Кто приехал издалека, пьет половину!',
      'ch_janken': '[Цу-е-фа] Нарочно проиграйте. Не вышло? Пейте половину!',
      'ch_hoi': '[Посмотри туда] Битва с соседом! Проигравший пьет половину.',
      'ch_katakana':
          '[Новое правило] Никаких иностранных заимствований! Нарушитель пьет половину.',
      'ch_type':
          '[Правда] Кто вам симпатичен здесь? Не скажете — пейте половину!',
      'ch_nyan':
          '[Вызов] Добавляйте "Мяу" к каждой фразе 5 минут. Забыли? Пьете половину.',
      'ch_face_down':
          'Все кладут телефоны экраном вниз. Последний пьет половину!',
      'ch_pointing':
          'Все указывают пальцем. На кого больше всего покажут, пьет половину!',
      'ch_sns': 'Кто последним постил в соцсетях, пьет половину!',
      'ch_impression':
          '[Первое впечатление] Кто самый популярный? Избранный пьет половину!',
      'ch_arimasu':
          '[Новое правило] Добавляйте "Сэр/Мэм" к каждой фразе. Забыли? Пьете половину.',
      'ch_fix':
          '[Правда] Покажите на того, кому стоит в себе что-то исправить. Отказ — пьешь половину!',
      'ch_animal':
          '[Вызов] Изобразите животное! Если не похоже — пейте половину!',
      'ch_battery': 'У кого меньше всего заряда на телефоне, пьет половину!',
      'ch_name_a': 'Все, в чьем имени есть буква "А", пьют половину!',
      'ch_niramekko': '[Гляделки] Кто первым засмеется, тот пьет половину.',
      'ch_finger':
          '[Новое правило] Оттопыривайте мизинец, когда пьете. Забыли? Пьете половину!',
      'ch_last_order': 'Тот, кто последним заказывал напиток, пьет половину!',
    },
    'vi': {
      'app_title': 'Máy Làm\nTrò Chơi',
      'app_subtitle': 'PHIÊN BẢN TIÊU CHUẨN',
      'info_text': 'Thay phiên nhau nhấn nút và làm theo hướng dẫn',
      'btn_start': 'BẮT ĐẦU',
      'ready_title': 'Sẵn sàng?',
      'ready_subtitle': 'Đặt điện thoại vào giữa và bắt đầu',
      'btn_game_start': 'Bắt đầu trò chơi',
      'btn_next': 'Tiếp theo',
      'btn_back_title': 'Quay lại tiêu đề',
      'history_title': 'Lịch sử',
      'history_clear': 'Xóa tất cả',
      'history_empty': 'Chưa có lịch sử',
      'confirm_clear_title': 'Đặt lại lịch sử?',
      'confirm_clear_desc':
          'Tất cả các hướng dẫn trước đó sẽ bị xóa.\nHành động này không thể hoàn tác.',
      'btn_yes_clear': 'Có, xóa tất cả',
      'btn_cancel': 'Hủy',
      'btn_close': 'Đóng',
      'drink': 'UỐNG',
      'game': 'TRÒ CHƠI',
      'rule': 'QUY TẮC',
      'truth': 'SỰ THẬT',
      'dare': 'THỬ THÁCH',
      'special': 'ĐẶC BIỆT',
      'ch_right': 'Người bên phải uống một nửa!',
      'ch_left': 'Người bên trái uống một nửa!',
      'ch_all': 'Tất cả cùng uống một nửa!',
      'ch_yamanote':
          '[Trò chơi Phân loại] Chủ đề: Các loại rượu. Người thua uống một nửa!',
      'ch_kokon':
          '[Trò chơi Phân loại] Chủ đề: Đồ vật màu đỏ. Người thua uống một nửa!',
      'ch_keigo':
          '[Quy tắc Mới] Không được nói chuyện trang trọng! Ai vi phạm uống một nửa.',
      'ch_lefty': '[Quy tắc Mới] Chỉ được dùng tay trái để uống!',
      'ch_failure':
          '[Sự thật] Kể về thất bại đáng xấu hổ nhất của bạn. Nếu không uống một nửa!',
      'ch_phone':
          '[Thử thách] Gửi "Chúc ngủ ngon" cho người bạn vừa gọi. Nếu không uống một nửa!',
      'ch_you_drink': 'Người vừa nhấn nút này phải uống một nửa!',
      'ch_assign': 'Chỉ định một người phải uống một nửa!',
      'ch_yubisuma':
          '[Yubisuma] Tất cả cùng chơi! Người cuối cùng uống một nửa.',
      'ch_remain': 'Người còn nhiều đồ uống nhất phải uống một nửa!',
      'ch_empty': 'Người còn ít đồ uống nhất phải rót thêm một nửa!',
      'ch_countup':
          '[Đếm số] 1, 2, 3... ở bội số của 3 phải làm hành động ngốc nghếch. Thua uống một nửa.',
      'ch_oldest': 'Người lớn tuổi nhất uống một nửa!',
      'ch_youngest': 'Người trẻ tuổi nhất uống một nửa!',
      'ch_black': 'Ai mặc đồ đen phải uống một nửa!',
      'ch_blood_a': 'Ai có nhóm máu A phải uống một nửa!',
      'ch_far': 'Người đi xa nhất để đến đây phải uống một nửa!',
      'ch_janken':
          '[Oẳn tù tì] Phải cố tình để thua. Không làm được uống một nửa!',
      'ch_hoi': '[Nhìn hướng kia] Đấu với người bên cạnh! Thua uống một nửa.',
      'ch_katakana':
          '[Quy tắc Mới] Cấm dùng từ mượn tiếng nước ngoài! Vi phạm uống một nửa.',
      'ch_type':
          '[Sự thật] Ai là mẫu người lý tưởng của bạn ở đây? Không nói uống một nửa!',
      'ch_nyan':
          '[Thử thách] Thêm từ "Meo" vào cuối mỗi câu trong 5 phút. Quên uống một nửa.',
      'ch_face_down': 'Tất cả úp điện thoại xuống. Ai chậm nhất uống một nửa!',
      'ch_pointing':
          'Tất cả cùng chỉ tay. Người bị chỉ nhiều nhất uống một nửa!',
      'ch_sns': 'Ai vừa đăng bài lên mạng xã hội phải uống một nửa!',
      'ch_impression':
          '[Ấn tượng đầu tiên] Ai là người có vẻ đào hoa nhất? Người đó uống một nửa!',
      'ch_arimasu':
          '[Quy tắc Mới] Phải thêm "Thưa ngài/bà" vào mỗi câu. Quên uống một nửa.',
      'ch_fix':
          '[Sự thật] Chỉ ra người cần sửa đổi tính nết. Không nói uống một nửa!',
      'ch_animal':
          '[Thử thách] Bắt chước tiếng thú! Nếu không giống uống một nửa!',
      'ch_battery': 'Ai còn ít pin điện thoại nhất uống một nửa!',
      'ch_name_a': 'Ai tên có chữ "A" uống một nửa!',
      'ch_niramekko': '[Thi nhìn] Ai cười trước phải uống một nửa.',
      'ch_finger':
          '[Quy tắc Mới] Phải giơ ngón út khi uống. Quên uống một nửa!',
      'ch_last_order': 'Người vừa gọi đồ uống cuối cùng phải uống một nửa!',
    },
    'ko': {
      'app_title': '술게임\n메이커',
      'app_subtitle': 'STANDARD EDITION',
      'info_text': '차례대로 버튼을 누르고 지시에 따르세요',
      'btn_start': '시작하기',
      'ready_title': '준비됐나요?',
      'ready_subtitle': '스마트폰을 가운데에 두고 시작하세요',
      'btn_game_start': '게임 시작',
      'btn_next': '다음 지시',
      'btn_back_title': '타이틀로 돌아가기',
      'history_title': '지시 이력',
      'history_clear': '모두 삭제',
      'history_empty': '이력이 없습니다',
      'confirm_clear_title': '이력을 리셋할까요?',
      'confirm_clear_desc': '지금까지의 모든 지시가 삭제됩니다.\n이 작업은 되돌릴 수 없습니다.',
      'btn_yes_clear': '네, 모두 삭제합니다',
      'btn_cancel': '취소',
      'btn_close': '닫기',
      'drink': '마시기',
      'game': '게임',
      'rule': '규칙',
      'truth': '진실',
      'dare': '도전',
      'special': '특별',
      'ch_right': '오른쪽 사람이 절반 마시기!',
      'ch_left': '왼쪽 사람이 절반 마시기!',
      'ch_all': '다 같이 건배! 모두 절반 마시기.',
      'ch_yamanote': '[카테고리 게임] 주제: 술 종류. 패배자 절반 마시기!',
      'ch_kokon': '[카테고리 게임] 주제: 빨간 것. 패배자 절반 마시기!',
      'ch_keigo': '[새로운 규칙] 경어 금지! 어기면 절반 마시기.',
      'ch_lefty': '[새로운 규칙] 술 마실 때 왼손만 사용하기!',
      'ch_failure': '[진실] 최근의 가장 창피한 실수 말하기. 거부하면 절반 마시기!',
      'ch_phone': '[도전] 마지막 통화한 사람에게 "잘 자"라고 문자 보내기. 실패 시 절반 마시기!',
      'ch_you_drink': '버튼을 누른 당신이 절반 마시기!',
      'ch_assign': '마실 사람 한 명 지목하기!',
      'ch_yubisuma': '[아이엠그라운드] 다 같이 승부! 마지막 한 명 절반 마시기.',
      'ch_remain': '술이 가장 많이 남은 사람 절반 마시기!',
      'ch_empty': '술이 가장 적게 남은 사람 절반 추가!',
      'ch_countup': '[카운트업] 1, 2, 3... 3의 배수에서 바보짓 하기. 실패 시 절반 마시기.',
      'ch_oldest': '가장 연장자가 절반 마시기!',
      'ch_youngest': '막내가 절반 마시기!',
      'ch_black': '검은 옷 입은 사람 모두 절반 마시기!',
      'ch_blood_a': 'A형인 사람 모두 절반 마시기!',
      'ch_far': '가장 멀리서 온 사람 절반 마시기!',
      'ch_janken': '[청개구리 가위바위보] 일부러 지기. 못 이기면(?) 절반 마시기!',
      'ch_hoi': '[참참참] 옆 사람과 승부! 지면 절반 마시기.',
      'ch_katakana': '[새로운 규칙] 외래어(카타카나) 금지! 어기면 절반 마시기.',
      'ch_type': '[진실] 이 중에서 이상형 지목하기. 거부하면 절반 마시기!',
      'ch_nyan': '[도전] 5분간 말끝에 "~냥" 붙이기. 잊으면 절반 마시기.',
      'ch_face_down': '모두 폰 뒤집기. 가장 늦은 사람 절반 마시기!',
      'ch_pointing': '다 같이 지목하기. 가장 많이 지목된 사람 절반 마시기!',
      'ch_sns': '최근 SNS에 게시물 올린 사람 절반 마시기!',
      'ch_impression': '[첫인상 게임] 가장 인기 많을 것 같은 사람 지목. 당첨자 절반 마시기!',
      'ch_arimasu': '[새로운 규칙] 말끝에 "~이지 말입니다" 붙이기. 잊으면 절반 마시기.',
      'ch_fix': '[진실] 고쳐줬으면 하는 점 말하기. 거부하면 절반 마시기!',
      'ch_animal': '[도전] 동물 흉내 내기! 안 비슷하면 절반 마시기!',
      'ch_battery': '배터리 가장 적은 사람 절반 마시기!',
      'ch_name_a': '이름에 "ㅏ"가 들어가는 사람 모두 절반 마시기!',
      'ch_niramekko': '[눈싸움] 웃으면 절반 마시기.',
      'ch_finger': '[새로운 규칙] 마실 때 새끼손가락 세우기. 잊으면 절반 마시기!',
      'ch_last_order': '마지막으로 술 주문한 사람 절반 마시기!',
    },
  };

  final List<Map<String, dynamic>> _challenges = [
    {'type': 'drink', 'key': 'ch_right', 'color': Colors.red[500]},
    {'type': 'drink', 'key': 'ch_left', 'color': Colors.red[500]},
    {'type': 'drink', 'key': 'ch_all', 'color': Colors.orange[600]},
    {'type': 'game', 'key': 'ch_yamanote', 'color': Colors.blue[500]},
    {'type': 'game', 'key': 'ch_kokon', 'color': Colors.blue[500]},
    {'type': 'rule', 'key': 'ch_keigo', 'color': Colors.purple[600]},
    {'type': 'rule', 'key': 'ch_lefty', 'color': Colors.purple[600]},
    {'type': 'truth', 'key': 'ch_failure', 'color': Colors.green[600]},
    {'type': 'dare', 'key': 'ch_phone', 'color': Colors.amber[600]},
    {'type': 'drink', 'key': 'ch_you_drink', 'color': Colors.red[600]},
    {'type': 'drink', 'key': 'ch_assign', 'color': Colors.red[700]},
    {'type': 'game', 'key': 'ch_yubisuma', 'color': Colors.blue[600]},
    {'type': 'special', 'key': 'ch_remain', 'color': Colors.indigo[600]},
    {'type': 'special', 'key': 'ch_empty', 'color': Colors.pink[600]},
    {'type': 'game', 'key': 'ch_countup', 'color': Colors.blue[400]},
    {'type': 'drink', 'key': 'ch_oldest', 'color': Colors.red[500]},
    {'type': 'drink', 'key': 'ch_youngest', 'color': Colors.red[500]},
    {'type': 'drink', 'key': 'ch_black', 'color': Colors.blueGrey[700]},
    {'type': 'drink', 'key': 'ch_blood_a', 'color': Colors.red[500]},
    {'type': 'drink', 'key': 'ch_far', 'color': Colors.orange[500]},
    {'type': 'game', 'key': 'ch_janken', 'color': Colors.blue[500]},
    {'type': 'game', 'key': 'ch_hoi', 'color': Colors.cyan[600]},
    {'type': 'rule', 'key': 'ch_katakana', 'color': Colors.purple[600]},
    {'type': 'truth', 'key': 'ch_type', 'color': Colors.green[600]},
    {'type': 'dare', 'key': 'ch_nyan', 'color': Colors.amber[600]},
    {'type': 'special', 'key': 'ch_face_down', 'color': Colors.pink[600]},
    {'type': 'special', 'key': 'ch_pointing', 'color': Colors.redAccent[700]},
    {'type': 'drink', 'key': 'ch_sns', 'color': Colors.red[400]},
    {'type': 'game', 'key': 'ch_impression', 'color': Colors.blue[600]},
    {'type': 'rule', 'key': 'ch_arimasu', 'color': Colors.purple[400]},
    {'type': 'truth', 'key': 'ch_fix', 'color': Colors.green[500]},
    {'type': 'dare', 'key': 'ch_animal', 'color': Colors.amber[700]},
    {'type': 'special', 'key': 'ch_battery', 'color': Colors.indigo[400]},
    {'type': 'drink', 'key': 'ch_name_a', 'color': Colors.red[600]},
    {'type': 'game', 'key': 'ch_niramekko', 'color': Colors.cyan[500]},
    {'type': 'rule', 'key': 'ch_finger', 'color': Colors.purple[500]},
    {'type': 'special', 'key': 'ch_last_order', 'color': Colors.orange[600]},
  ];

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _spinController.dispose();
    super.dispose();
  }

  // 端末の言語を取得して翻訳を返すヘルパー
  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    final Map<String, String>? languageMap = _i18n[languageCode];
    // 言語が見つからない場合は英語、それでもない場合はキーをそのまま返す
    return languageMap?[key] ?? _i18n['en']![key] ?? key;
  }

  void _startGame() {
    setState(() {
      _view = 'play';
      _currentCard = null;
      _history = [];
    });
  }

  void _drawCard() async {
    if (_isAnimating) return;
    setState(() => _isAnimating = true);
    _spinController.forward(from: 0);

    // ★ 広告ロジック: 2回に1回表示
    _adCounter++;
    if (_adCounter % 5 == 0) {
      await actions.showInterstitialAdCustom();
    }

    await Future.delayed(const Duration(milliseconds: 400));

    setState(() {
      final random = math.Random();
      final card = _challenges[random.nextInt(_challenges.length)];
      final now = DateTime.now();
      final timeStr =
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

      _currentCard = {...card, 'timestamp': timeStr};
      _history.insert(0, _currentCard!);
      _isAnimating = false;
    });
  }

  void _clearHistory() {
    setState(() {
      _history = [];
      _showConfirmClear = false;
    });
  }

  void _resetGame() {
    setState(() {
      _view = 'home';
      _currentCard = null;
      _history = [];
      _showHistory = false;
      _showConfirmClear = false;
    });
  }

  IconData _getIcon(String type) {
    switch (type) {
      case 'drink':
        return Icons.sports_bar;
      case 'game':
        return Icons.play_arrow;
      case 'rule':
        return Icons.gavel;
      case 'truth':
        return Icons.people;
      case 'dare':
        return Icons.refresh;
      case 'special':
        return Icons.star;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      decoration: const BoxDecoration(color: Color(0xFF166534)),
      child: Stack(
        children: [
          _view == 'home' ? _buildHomeView() : _buildPlayView(),
          if (_showHistory) _buildHistoryOverlay(),
        ],
      ),
    );
  }

  Widget _buildHomeView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _bounceController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -15 * _bounceController.value),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.sports_bar,
                        size: 100, color: Colors.amber),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            Text(
              _getTranslatedText('app_title'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.1),
            ),
            const SizedBox(height: 8),
            Text(
              _getTranslatedText('app_subtitle'),
              style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5)),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: _startGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF166534),
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.bolt),
                  const SizedBox(width: 8),
                  Text(_getTranslatedText('btn_start'),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(_getTranslatedText('info_text'),
                style: TextStyle(
                    fontSize: 10, color: Colors.white.withOpacity(0.4))),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayView() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    _showHistory = true;
                    _showConfirmClear = false;
                  }),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.history,
                            size: 16, color: Colors.amber),
                        const SizedBox(width: 8),
                        Text(
                            "${_getTranslatedText('history_title')} (${_history.length})",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Text(
                  "LIVE SESSION",
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.3),
                      letterSpacing: 2),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: _currentCard == null
                    ? _buildReadyCard()
                    : _buildInstructionCard(),
              ),
            ),
            const SizedBox(height: 24),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _drawCard,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      backgroundColor: Colors.amber[600],
                      foregroundColor: Colors.white,
                      elevation: 8,
                    ),
                    child: _isAnimating
                        ? const SizedBox(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 3))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(_currentCard == null
                                  ? Icons.play_arrow
                                  : Icons.refresh),
                              const SizedBox(width: 12),
                              Text(
                                  _currentCard == null
                                      ? _getTranslatedText('btn_game_start')
                                      : _getTranslatedText('btn_next'),
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900)),
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton.icon(
                  onPressed: _resetGame,
                  icon: const Icon(Icons.rotate_left, size: 16),
                  label: Text(_getTranslatedText('btn_back_title')),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(0.5)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadyCard() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 400, maxHeight: 450),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.play_circle_filled,
              size: 80, color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 24),
          Text(_getTranslatedText('ready_title'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          const SizedBox(height: 8),
          Text(_getTranslatedText('ready_subtitle'),
              style: TextStyle(color: Colors.white.withOpacity(0.5))),
        ],
      ),
    );
  }

  Widget _buildInstructionCard() {
    return AnimatedScale(
      scale: _isAnimating ? 0.95 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 450),
        decoration: BoxDecoration(
          color: _currentCard!['color'],
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ],
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 8),
        ),
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(_getIcon(_currentCard!['type']),
                    size: 60, color: Colors.white),
              ),
              const SizedBox(height: 12),
              Text(_getTranslatedText(_currentCard!['type']),
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2)),
              const SizedBox(height: 20),
              Text(
                _getTranslatedText(_currentCard!['key']),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 10, color: Colors.black26)],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF064e3b),
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            padding: const EdgeInsets.all(32),
            child: _showConfirmClear
                ? _buildConfirmClearUI()
                : _buildHistoryListUI(),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryListUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_getTranslatedText('history_title'),
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
                GestureDetector(
                  onTap: _history.isEmpty
                      ? null
                      : () => setState(() => _showConfirmClear = true),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline,
                            size: 14,
                            color: _history.isEmpty
                                ? Colors.white24
                                : Colors.redAccent),
                        const SizedBox(width: 4),
                        Text(
                          _getTranslatedText('history_clear'),
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: _history.isEmpty
                                  ? Colors.white24
                                  : Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () => setState(() => _showHistory = false),
              icon: const Icon(Icons.close, size: 30, color: Colors.white),
            )
          ],
        ),
        const SizedBox(height: 24),
        Expanded(
          child: _history.isEmpty
              ? Center(
                  child: Text(_getTranslatedText('history_empty'),
                      style: const TextStyle(
                          color: Colors.white38, fontStyle: FontStyle.italic)))
              : ListView.separated(
                  itemCount: _history.length,
                  separatorBuilder: (ctx, idx) => const SizedBox(height: 12),
                  itemBuilder: (ctx, idx) {
                    final item = _history[idx];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                            left: BorderSide(color: item['color'], width: 4)),
                      ),
                      child: Row(
                        children: [
                          Icon(_getIcon(item['type']),
                              size: 24, color: item['color']),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_getTranslatedText(item['key']),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.white)),
                                const SizedBox(height: 4),
                                Text(item['timestamp'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white.withOpacity(0.3))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => setState(() => _showHistory = false),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.1),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            child: Text(_getTranslatedText('btn_close'),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmClearUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.warning_amber_rounded,
            size: 80, color: Colors.redAccent),
        const SizedBox(height: 24),
        Text(_getTranslatedText('confirm_clear_title'),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.white)),
        const SizedBox(height: 12),
        Text(_getTranslatedText('confirm_clear_desc'),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _clearHistory,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: Text(_getTranslatedText('btn_yes_clear'),
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () => setState(() => _showConfirmClear = false),
          child: Text(_getTranslatedText('btn_cancel'),
              style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
