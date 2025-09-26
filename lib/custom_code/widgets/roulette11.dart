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
import 'package:drinking_game/custom_code/actions/show_interstitial_ad_custom.dart'
    as actions;

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
  int _spinCount = 0;

  // final Map<String, Map<String, dynamic>> localizedStrings = {
  //   'ja': {
  //     'roulette_title': '飲みゲー ルーレット',
  //     'segments_label': '分割数: ',
  //     'genre_label': 'ジャンルを選んでね',
  //     'spinning_text': '回転中...',
  //     'start_button': 'スタート',
  //     'result_prefix': '結果: 「',
  //     'result_suffix': '」に当てはまる人！',
  //     'genres': {
  //       'body': '身体的特徴',
  //       'past': '過去の経験・所属',
  //       'king': '王様ゲーム',
  //       'daily': '日常的な行動',
  //       'custom': 'カスタム',
  //     },
  //     'options': {
  //       'body': ['女', '左利き', 'メガネ', 'コンタクト', 'ピアス', '二重', '全員飲め', '男'],
  //       'past': ['運動部', '文化部', '理系', '文系', '一人暮らし', '実家暮らし', '留学経験', '全員飲め'],
  //       'king': [
  //         '選んだ2人飲め',
  //         '選んだ3人飲め',
  //         '回したやつ飲め',
  //         '回したやつ以外飲め',
  //         '選ばれたやつ飲め',
  //         '両隣と飲め',
  //         '両隣とハイタッチ',
  //         '全員飲め'
  //       ],
  //       'daily': [
  //         '朝食食べた',
  //         '全員飲め',
  //         '電車で来た',
  //         'MBTIがE',
  //         '全員飲む',
  //         'MBTIがI',
  //         'スマホ決済',
  //         '現金派'
  //       ],
  //       'custom': [],
  //     }
  //   },
  //   'en': {
  //     'roulette_title': 'Drinking Game Roulette',
  //     'segments_label': 'Segments: ',
  //     'genre_label': 'Choose a genre',
  //     'spinning_text': 'Spinning...',
  //     'start_button': 'Start',
  //     'result_prefix': 'Result: "',
  //     'result_suffix': '"!',
  //     'genres': {
  //       'body': 'Physical Traits',
  //       'past': 'Past Experience',
  //       'king': 'King\'s Game',
  //       'daily': 'Daily Habits',
  //       'custom': 'Custom',
  //     },
  //     'options': {
  //       'body': [
  //         'Female',
  //         'Left-handed',
  //         'Glasses',
  //         'Contacts',
  //         'Piercings',
  //         'Double eyelids',
  //         'Everyone drinks',
  //         'Male'
  //       ],
  //       'past': [
  //         'Sports club',
  //         'Cultural club',
  //         'Science major',
  //         'Liberal arts major',
  //         'Living alone',
  //         'Living at home',
  //         'Study abroad',
  //         'Everyone drinks'
  //       ],
  //       'king': [
  //         '2 chosen people drink',
  //         '3 chosen people drink',
  //         'The spinner drinks',
  //         'Everyone but the spinner drinks',
  //         'The chosen person drinks',
  //         'People next to you drink',
  //         'High-five your neighbors',
  //         'Everyone drinks'
  //       ],
  //       'daily': [
  //         'Had breakfast',
  //         'Everyone drinks',
  //         'Came by train',
  //         'MBTI is E',
  //         'Everyone drinks',
  //         'MBTI is I',
  //         'Phone payment',
  //         'Cash user'
  //       ],
  //       'custom': [],
  //     }
  //   }
  // };
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
    'ms': {
      'roulette_title': 'Roulette Permainan Minum',
      'segments_label': 'Bilangan Bahagian: ',
      'genre_label': 'Pilih genre',
      'spinning_text': 'Berlari...',
      'start_button': 'Mula',
      'result_prefix': 'Keputusan: "',
      'result_suffix': '" – orang yang sesuai!',
      'genres': {
        'body': 'Ciri Fizikal',
        'past': 'Pengalaman / Kehidupan Lampau',
        'king': 'Permainan Raja',
        'daily': 'Tindakan Harian',
        'custom': 'Tersuai',
      },
      'options': {
        'body': [
          'Perempuan',
          'Kidal',
          'Cermin Mata',
          'Lensa Sentuh',
          'Tindik',
          'Kelopak Mata Berganda',
          'Semua minum',
          'Lelaki'
        ],
        'past': [
          'Kelab Sukan',
          'Kelab Kebudayaan',
          'Jurusan Sains',
          'Jurusan Sastera',
          'Tinggal bersendirian',
          'Tinggal bersama keluarga',
          'Pengalaman belajar di luar negara',
          'Semua minum'
        ],
        'king': [
          '2 orang yang dipilih minum',
          '3 orang yang dipilih minum',
          'Pemusing minum',
          'Semua kecuali pemusing minum',
          'Orang yang dipilih minum',
          'Minum bersama jiran sebelah',
          'High-five dengan jiran sebelah',
          'Semua minum'
        ],
        'daily': [
          'Telah sarapan',
          'Semua minum',
          'Datang dengan kereta api',
          'MBTI ialah E',
          'Semua minum',
          'MBTI ialah I',
          'Bayar menggunakan telefon',
          'Menggunakan tunai'
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
    },
    'zh': {
      'roulette_title': '喝酒游戏轮盘',
      'segments_label': '分段数: ',
      'genre_label': '选择一个类别',
      'spinning_text': '旋转中...',
      'start_button': '开始',
      'result_prefix': '结果: "',
      'result_suffix': '"!',
      'genres': {
        'body': '身体特征',
        'past': '过去的经历',
        'king': '国王游戏',
        'daily': '日常习惯',
        'custom': '自定义',
      },
      'options': {
        'body': ['女性', '左撇子', '眼镜', '隐形眼镜', '耳洞', '双眼皮', '所有人喝', '男性'],
        'past': ['运动社团', '文化社团', '理科', '文科', '独居', '和家人同住', '留学经验', '所有人喝'],
        'king': [
          '选两个人喝',
          '选三个人喝',
          '转的人喝',
          '除了转的人都喝',
          '被选的人喝',
          '两边的人喝',
          '和两边击掌',
          '所有人喝'
        ],
        'daily': [
          '吃过早餐',
          '所有人喝',
          '坐电车来的',
          'MBTI是E',
          '所有人喝',
          'MBTI是I',
          '手机支付',
          '现金派'
        ],
        'custom': [],
      }
    },
    'fr': {
      'roulette_title': 'Roulette Jeu à Boire',
      'segments_label': 'Segments : ',
      'genre_label': 'Choisissez un genre',
      'spinning_text': 'En train de tourner...',
      'start_button': 'Commencer',
      'result_prefix': 'Résultat : "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Traits physiques',
        'past': 'Expérience passée',
        'king': 'Jeu du roi',
        'daily': 'Habitudes quotidiennes',
        'custom': 'Personnalisé',
      },
      'options': {
        'body': [
          'Femme',
          'Gaucher',
          'Lunettes',
          'Lentilles',
          'Piercings',
          'Paupières doubles',
          'Tout le monde boit',
          'Homme'
        ],
        'past': [
          'Club de sport',
          'Club culturel',
          'Scientifique',
          'Lettres',
          'Vit seul',
          'Vit chez les parents',
          'Étudier à l\'étranger',
          'Tout le monde boit'
        ],
        'king': [
          '2 choisis boivent',
          '3 choisis boivent',
          'Celui qui tourne boit',
          'Tous sauf le joueur boivent',
          'La personne choisie boit',
          'Les voisins boivent',
          'Tapez dans la main des voisins',
          'Tout le monde boit'
        ],
        'daily': [
          'A pris le petit déjeuner',
          'Tout le monde boit',
          'Venu en train',
          'MBTI est E',
          'Tout le monde boit',
          'MBTI est I',
          'Paiement par téléphone',
          'Paiement en espèces'
        ],
        'custom': [],
      }
    },
    'es': {
      'roulette_title': 'Ruleta de Juego de Beber',
      'segments_label': 'Segmentos: ',
      'genre_label': 'Elige un género',
      'spinning_text': 'Girando...',
      'start_button': 'Comenzar',
      'result_prefix': 'Resultado: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Rasgos físicos',
        'past': 'Experiencia pasada',
        'king': 'Juego del rey',
        'daily': 'Hábitos diarios',
        'custom': 'Personalizado',
      },
      'options': {
        'body': [
          'Mujer',
          'Zurdo',
          'Gafas',
          'Lentes de contacto',
          'Piercings',
          'Párpados dobles',
          'Todos beben',
          'Hombre'
        ],
        'past': [
          'Club deportivo',
          'Club cultural',
          'Ciencias',
          'Artes',
          'Vivir solo',
          'Vivir con la familia',
          'Estudiar en el extranjero',
          'Todos beben'
        ],
        'king': [
          '2 elegidos beben',
          '3 elegidos beben',
          'El que gira bebe',
          'Todos menos el que gira beben',
          'La persona elegida bebe',
          'Los de al lado beben',
          'Choca los cinco con vecinos',
          'Todos beben'
        ],
        'daily': [
          'Desayunó',
          'Todos beben',
          'Vino en tren',
          'MBTI es E',
          'Todos beben',
          'MBTI es I',
          'Pago con móvil',
          'Pago en efectivo'
        ],
        'custom': [],
      }
    },
    'de': {
      'roulette_title': 'Trinkspiel Roulette',
      'segments_label': 'Segmente: ',
      'genre_label': 'Wähle ein Genre',
      'spinning_text': 'Dreht...',
      'start_button': 'Start',
      'result_prefix': 'Ergebnis: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Körperliche Merkmale',
        'past': 'Vergangene Erfahrung',
        'king': 'Königsspiel',
        'daily': 'Tägliche Gewohnheiten',
        'custom': 'Benutzerdefiniert',
      },
      'options': {
        'body': [
          'Frau',
          'Linkshänder',
          'Brille',
          'Kontaktlinsen',
          'Piercings',
          'Doppellider',
          'Alle trinken',
          'Mann'
        ],
        'past': [
          'Sportverein',
          'Kulturverein',
          'Naturwissenschaften',
          'Geisteswissenschaften',
          'Allein lebend',
          'Bei Familie lebend',
          'Studium im Ausland',
          'Alle trinken'
        ],
        'king': [
          '2 gewählte trinken',
          '3 gewählte trinken',
          'Der Dreher trinkt',
          'Alle außer Dreher trinken',
          'Die gewählte Person trinkt',
          'Nachbarn trinken',
          'High-Five mit Nachbarn',
          'Alle trinken'
        ],
        'daily': [
          'Frühstück gegessen',
          'Alle trinken',
          'Mit Zug gekommen',
          'MBTI ist E',
          'Alle trinken',
          'MBTI ist I',
          'Handyzahlung',
          'Barzahler'
        ],
        'custom': [],
      }
    },
    'ko': {
      'roulette_title': '술 게임 룰렛',
      'segments_label': '분할 수: ',
      'genre_label': '장르를 선택하세요',
      'spinning_text': '회전 중...',
      'start_button': '시작',
      'result_prefix': '결과: "',
      'result_suffix': '"!',
      'genres': {
        'body': '신체적 특징',
        'past': '과거 경험',
        'king': '왕 게임',
        'daily': '일상 습관',
        'custom': '사용자 정의',
      },
      'options': {
        'body': ['여성', '왼손잡이', '안경', '렌즈', '피어싱', '쌍꺼풀', '모두 마셔', '남성'],
        'past': [
          '운동 동아리',
          '문화 동아리',
          '이과',
          '문과',
          '혼자 산다',
          '가족과 산다',
          '유학 경험',
          '모두 마셔'
        ],
        'king': [
          '선택된 2명 마셔',
          '선택된 3명 마셔',
          '돌린 사람 마셔',
          '돌린 사람 제외 모두 마셔',
          '선택된 사람 마셔',
          '옆 사람 마셔',
          '옆 사람과 하이파이브',
          '모두 마셔'
        ],
        'daily': [
          '아침 먹음',
          '모두 마셔',
          '기차로 옴',
          'MBTI가 E',
          '모두 마셔',
          'MBTI가 I',
          '휴대폰 결제',
          '현금파'
        ],
        'custom': [],
      }
    },
    'ru': {
      'roulette_title': 'Рулетка для пьянок',
      'segments_label': 'Сегменты: ',
      'genre_label': 'Выберите жанр',
      'spinning_text': 'Крутится...',
      'start_button': 'Старт',
      'result_prefix': 'Результат: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Физические черты',
        'past': 'Прошлый опыт',
        'king': 'Игра короля',
        'daily': 'Ежедневные привычки',
        'custom': 'Пользовательское',
      },
      'options': {
        'body': [
          'Женщина',
          'Левша',
          'Очки',
          'Линзы',
          'Пирсинг',
          'Двойные веки',
          'Все пьют',
          'Мужчина'
        ],
        'past': [
          'Спортивный клуб',
          'Культурный клуб',
          'Точные науки',
          'Гуманитарные науки',
          'Живет один',
          'Живет с семьей',
          'Опыт за границей',
          'Все пьют'
        ],
        'king': [
          'Выбранные 2 пьют',
          'Выбранные 3 пьют',
          'Крутящий пьет',
          'Все кроме крутящего пьют',
          'Выбранный пьет',
          'Соседи пьют',
          'Дай пять соседям',
          'Все пьют'
        ],
        'daily': [
          'Позавтракал',
          'Все пьют',
          'Приехал на поезде',
          'MBTI E',
          'Все пьют',
          'MBTI I',
          'Оплата телефоном',
          'Наличные'
        ],
        'custom': [],
      }
    },
    'vi': {
      'roulette_title': 'Vòng quay Uống rượu',
      'segments_label': 'Phần: ',
      'genre_label': 'Chọn thể loại',
      'spinning_text': 'Đang quay...',
      'start_button': 'Bắt đầu',
      'result_prefix': 'Kết quả: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Đặc điểm cơ thể',
        'past': 'Kinh nghiệm quá khứ',
        'king': 'Trò chơi Vua',
        'daily': 'Thói quen hàng ngày',
        'custom': 'Tùy chỉnh',
      },
      'options': {
        'body': [
          'Nữ',
          'Thuận tay trái',
          'Kính',
          'Kính áp tròng',
          'Xỏ khuyên',
          'Mắt hai mí',
          'Mọi người uống',
          'Nam'
        ],
        'past': [
          'Câu lạc bộ thể thao',
          'Câu lạc bộ văn hóa',
          'Khoa học tự nhiên',
          'Khoa học xã hội',
          'Sống một mình',
          'Sống cùng gia đình',
          'Du học',
          'Mọi người uống'
        ],
        'king': [
          '2 người được chọn uống',
          '3 người được chọn uống',
          'Người quay uống',
          'Tất cả trừ người quay uống',
          'Người được chọn uống',
          'Người bên cạnh uống',
          'Đập tay hàng xóm',
          'Mọi người uống'
        ],
        'daily': [
          'Ăn sáng rồi',
          'Mọi người uống',
          'Đi tàu đến',
          'MBTI là E',
          'Mọi người uống',
          'MBTI là I',
          'Thanh toán bằng điện thoại',
          'Dùng tiền mặt'
        ],
        'custom': [],
      }
    },
    'it': {
      'roulette_title': 'Roulette del Gioco alcolico',
      'segments_label': 'Segmenti: ',
      'genre_label': 'Scegli un genere',
      'spinning_text': 'Girando...',
      'start_button': 'Inizia',
      'result_prefix': 'Risultato: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Caratteristiche fisiche',
        'past': 'Esperienza passata',
        'king': 'Gioco del re',
        'daily': 'Abitudini quotidiane',
        'custom': 'Personalizzato',
      },
      'options': {
        'body': [
          'Donna',
          'Mancino',
          'Occhiali',
          'Lenti a contatto',
          'Piercing',
          'Doppie palpebre',
          'Tutti bevono',
          'Uomo'
        ],
        'past': [
          'Club sportivo',
          'Club culturale',
          'Scienze',
          'Lettere',
          'Vive da solo',
          'Vive con la famiglia',
          'Studio all\'estero',
          'Tutti bevono'
        ],
        'king': [
          '2 scelti bevono',
          '3 scelti bevono',
          'Chi gira beve',
          'Tutti tranne chi gira bevono',
          'La persona scelta beve',
          'Vicini bevono',
          'Dai il cinque ai vicini',
          'Tutti bevono'
        ],
        'daily': [
          'Ha fatto colazione',
          'Tutti bevono',
          'Venuto in treno',
          'MBTI è E',
          'Tutti bevono',
          'MBTI è I',
          'Pagamento con telefono',
          'Pagamento in contanti'
        ],
        'custom': [],
      }
    },
    'pt': {
      'roulette_title': 'Roleta do Jogo de Bebida',
      'segments_label': 'Segmentos: ',
      'genre_label': 'Escolha um gênero',
      'spinning_text': 'Girando...',
      'start_button': 'Iniciar',
      'result_prefix': 'Resultado: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Traços físicos',
        'past': 'Experiência passada',
        'king': 'Jogo do Rei',
        'daily': 'Hábitos diários',
        'custom': 'Personalizado',
      },
      'options': {
        'body': [
          'Feminino',
          'Canhoto',
          'Óculos',
          'Lentes de contato',
          'Piercings',
          'Pálpebras duplas',
          'Todos bebem',
          'Masculino'
        ],
        'past': [
          'Clube esportivo',
          'Clube cultural',
          'Ciências',
          'Humanas',
          'Mora sozinho',
          'Mora com a família',
          'Estudo no exterior',
          'Todos bebem'
        ],
        'king': [
          '2 escolhidos bebem',
          '3 escolhidos bebem',
          'Quem gira bebe',
          'Todos exceto quem gira bebem',
          'A pessoa escolhida bebe',
          'As pessoas ao lado bebem',
          'Dê um high-five nos vizinhos',
          'Todos bebem'
        ],
        'daily': [
          'Tomou café da manhã',
          'Todos bebem',
          'Veio de trem',
          'MBTI é E',
          'Todos bebem',
          'MBTI é I',
          'Pagamento por celular',
          'Usuário de dinheiro'
        ],
        'custom': [],
      }
    },
    'ar': {
      'roulette_title': 'روليت لعبة الشرب',
      'segments_label': 'الأقسام: ',
      'genre_label': 'اختر نوعًا',
      'spinning_text': 'جارٍ الدوران...',
      'start_button': 'ابدأ',
      'result_prefix': 'النتيجة: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'السمات الجسدية',
        'past': 'الخبرة السابقة',
        'king': 'لعبة الملك',
        'daily': 'العادات اليومية',
        'custom': 'مخصص',
      },
      'options': {
        'body': [
          'أنثى',
          'أعسر',
          'نظارات',
          'عدسات لاصقة',
          'ثقب الأذن',
          'جفون مزدوجة',
          'الجميع يشرب',
          'ذكر'
        ],
        'past': [
          'نادي رياضي',
          'نادي ثقافي',
          'علوم',
          'العلوم الإنسانية',
          'يعيش وحده',
          'يعيش مع العائلة',
          'تجربة دراسية في الخارج',
          'الجميع يشرب'
        ],
        'king': [
          'شخصان مختاران يشربان',
          'ثلاثة مختارين يشربون',
          'المُدوِّر يشرب',
          'الجميع ما عدا المُدوِّر يشربون',
          'الشخص المختار يشرب',
          'الجانبين يشربون',
          'صافح جيرانك',
          'الجميع يشرب'
        ],
        'daily': [
          'تناول الإفطار',
          'الجميع يشرب',
          'جاء بالقطار',
          'MBTI هو E',
          'الجميع يشرب',
          'MBTI هو I',
          'دفع عبر الهاتف',
          'يدفع نقدًا'
        ],
        'custom': [],
      }
    },
    'hi': {
      'roulette_title': 'ड्रिंकिंग गेम रूलैट',
      'segments_label': 'खंड: ',
      'genre_label': 'एक श्रेणी चुनें',
      'spinning_text': 'घूम रहा है...',
      'start_button': 'शुरू करें',
      'result_prefix': 'परिणाम: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'शारीरिक विशेषताएँ',
        'past': 'पिछला अनुभव',
        'king': 'किंग का गेम',
        'daily': 'दैनिक आदतें',
        'custom': 'कस्टम',
      },
      'options': {
        'body': [
          'महिला',
          'बाएँ हाथ वाला',
          'चश्मा',
          'कॉन्टैक्ट लेंस',
          'पियर्सिंग',
          'दोहरी पलकों',
          'सभी पिएं',
          'पुरुष'
        ],
        'past': [
          'खेल क्लब',
          'सांस्कृतिक क्लब',
          'विज्ञान',
          'मानविकी',
          'अकेला रहता है',
          'परिवार के साथ रहता है',
          'विदेश में पढ़ाई',
          'सभी पिएं'
        ],
        'king': [
          'चुने हुए 2 लोग पिएं',
          'चुने हुए 3 लोग पिएं',
          'जो घुमाता है वह पीए',
          'घुमाने वाले को छोड़कर सभी पीएं',
          'चुनी हुई व्यक्ति पीए',
          'पास के लोग पीएं',
          'नवियों से हाई-फाइव करें',
          'सभी पिएं'
        ],
        'daily': [
          'नाश्ता किया',
          'सभी पिएं',
          'ट्रेन से आए',
          'MBTI E है',
          'सभी पिएं',
          'MBTI I है',
          'फोन भुगतान',
          'नकद उपयोगकर्ता'
        ],
        'custom': [],
      }
    },
    'ms': {
      'roulette_title': 'Rolet Permainan Minum',
      'segments_label': 'Bilangan bahagian: ',
      'genre_label': 'Pilih genre',
      'spinning_text': 'Sedang berpusing...',
      'start_button': 'Mula',
      'result_prefix': 'Keputusan: "',
      'result_suffix': '"!',
      'genres': {
        'body': 'Ciri Fizikal',
        'past': 'Pengalaman lalu',
        'king': 'Permainan Raja',
        'daily': 'Tabiat harian',
        'custom': 'Tersuai',
      },
      'options': {
        'body': [
          'Perempuan',
          'Kidistang',
          'Cermin mata',
          'Lensa sentuh',
          'Tindik',
          'Kelopak berganda',
          'Semua minum',
          'Lelaki'
        ],
        'past': [
          'Kelab sukan',
          'Kelab kebudayaan',
          'Sains',
          'Seni',
          'Tinggal seorang',
          'Tinggal bersama keluarga',
          'Pengalaman belajar di luar negara',
          'Semua minum'
        ],
        'king': [
          '2 orang dipilih minum',
          '3 orang dipilih minum',
          'Pemusing minum',
          'Semua kecuali pemusing minum',
          'Orang yang dipilih minum',
          'Orang di sebelah minum',
          'High-five jiran',
          'Semua minum'
        ],
        'daily': [
          'Telah bersarapan',
          'Semua minum',
          'Datang dengan kereta api',
          'MBTI ialah E',
          'Semua minum',
          'MBTI ialah I',
          'Bayaran telefon',
          'Pengguna tunai'
        ],
        'custom': [],
      }
    },
  };

  String _resultText = '';
  bool _isSpinning = false;

  // String _getTranslatedText(String key) {
  //   final String languageCode = Localizations.localeOf(context).languageCode;
  //   if (languageCode == 'ja') {
  //     return localizedStrings['ja']![key]! as String;
  //   } else {
  //     return localizedStrings['en']![key]! as String;
  //   }
  // }

  // Map<String, String> _getTranslatedGenres() {
  //   final String languageCode = Localizations.localeOf(context).languageCode;
  //   if (languageCode == 'ja') {
  //     return localizedStrings['ja']!['genres'] as Map<String, String>;
  //   } else {
  //     return localizedStrings['en']!['genres'] as Map<String, String>;
  //   }
  // }

  // List<String> _getTranslatedOptions(String genreKey) {
  //   final String languageCode = Localizations.localeOf(context).languageCode;
  //   if (languageCode == 'ja') {
  //     return localizedStrings['ja']!['options']![genreKey] as List<String>;
  //   } else {
  //     return localizedStrings['en']!['options']![genreKey] as List<String>;
  //   }
  // }
  String _getTranslatedText(String key) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return localizedStrings[languageCode]?[key] ??
        localizedStrings['en']![key]! as String;
  }

  Map<String, String> _getTranslatedGenres() {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return (localizedStrings[languageCode]?['genres'] ??
        localizedStrings['en']!['genres']) as Map<String, String>;
  }

  List<String> _getTranslatedOptions(String genreKey) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return (localizedStrings[languageCode]?['options']?[genreKey] ??
        localizedStrings['en']!['options']![genreKey]) as List<String>;
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
      _spinCount++;
      _isSpinning = true;
      _resultText = '';
    });
    if (_spinCount % 2 == 0) {
      actions.showInterstitialAdCustom(); // ← ここで広告を表示
    }

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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       _getTranslatedText('genre_label'),
              //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //             color: Colors.white,
              //           ),
              //     ),
              //     const SizedBox(width: 8),
              //     Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 12),
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       child: DropdownButton<String>(
              //         value: _currentGenre,
              //         items: _getTranslatedGenres().keys.map((String key) {
              //           return DropdownMenuItem<String>(
              //             value: key,
              //             child: Text(
              //               _getTranslatedGenres()[key]!,
              //               style: const TextStyle(
              //                 fontSize: 15,
              //                 color: Colors.black,
              //               ),
              //             ),
              //           );
              //         }).toList(),
              //         onChanged: _isSpinning
              //             ? null
              //             : (newValue) {
              //                 if (newValue != null) {
              //                   _setGenre(newValue);
              //                 }
              //               },
              //         underline: Container(),
              //         icon: const Icon(Icons.arrow_drop_down,
              //             color: Colors.black),
              //       ),
              //     ),
              //   ],
              // ),
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
                  Expanded(
                    // ← 追加
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true, // ← これがポイント
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
                              overflow: TextOverflow.ellipsis, // ← 長い場合は省略
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
