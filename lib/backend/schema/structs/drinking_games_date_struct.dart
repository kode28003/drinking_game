// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrinkingGamesDateStruct extends BaseStruct {
  DrinkingGamesDateStruct({
    String? title,
    String? description,
    int? minPlayers,
    int? recommendStar,
    String? subTitle,
    bool? isOnlyJapan,
    bool? useThisApp,
    String? thisAppNav,
    String? titleEn,
    String? descriptionEn,
    String? subTitleEn,
  })  : _title = title,
        _description = description,
        _minPlayers = minPlayers,
        _recommendStar = recommendStar,
        _subTitle = subTitle,
        _isOnlyJapan = isOnlyJapan,
        _useThisApp = useThisApp,
        _thisAppNav = thisAppNav,
        _titleEn = titleEn,
        _descriptionEn = descriptionEn,
        _subTitleEn = subTitleEn;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "minPlayers" field.
  int? _minPlayers;
  int get minPlayers => _minPlayers ?? 0;
  set minPlayers(int? val) => _minPlayers = val;

  void incrementMinPlayers(int amount) => minPlayers = minPlayers + amount;

  bool hasMinPlayers() => _minPlayers != null;

  // "recommendStar" field.
  int? _recommendStar;
  int get recommendStar => _recommendStar ?? 0;
  set recommendStar(int? val) => _recommendStar = val;

  void incrementRecommendStar(int amount) =>
      recommendStar = recommendStar + amount;

  bool hasRecommendStar() => _recommendStar != null;

  // "subTitle" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  set subTitle(String? val) => _subTitle = val;

  bool hasSubTitle() => _subTitle != null;

  // "isOnlyJapan" field.
  bool? _isOnlyJapan;
  bool get isOnlyJapan => _isOnlyJapan ?? false;
  set isOnlyJapan(bool? val) => _isOnlyJapan = val;

  bool hasIsOnlyJapan() => _isOnlyJapan != null;

  // "useThisApp" field.
  bool? _useThisApp;
  bool get useThisApp => _useThisApp ?? false;
  set useThisApp(bool? val) => _useThisApp = val;

  bool hasUseThisApp() => _useThisApp != null;

  // "thisAppNav" field.
  String? _thisAppNav;
  String get thisAppNav => _thisAppNav ?? '';
  set thisAppNav(String? val) => _thisAppNav = val;

  bool hasThisAppNav() => _thisAppNav != null;

  // "titleEn" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  set titleEn(String? val) => _titleEn = val;

  bool hasTitleEn() => _titleEn != null;

  // "descriptionEn" field.
  String? _descriptionEn;
  String get descriptionEn => _descriptionEn ?? '';
  set descriptionEn(String? val) => _descriptionEn = val;

  bool hasDescriptionEn() => _descriptionEn != null;

  // "subTitleEn" field.
  String? _subTitleEn;
  String get subTitleEn => _subTitleEn ?? '';
  set subTitleEn(String? val) => _subTitleEn = val;

  bool hasSubTitleEn() => _subTitleEn != null;

  static DrinkingGamesDateStruct fromMap(Map<String, dynamic> data) =>
      DrinkingGamesDateStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        minPlayers: castToType<int>(data['minPlayers']),
        recommendStar: castToType<int>(data['recommendStar']),
        subTitle: data['subTitle'] as String?,
        isOnlyJapan: data['isOnlyJapan'] as bool?,
        useThisApp: data['useThisApp'] as bool?,
        thisAppNav: data['thisAppNav'] as String?,
        titleEn: data['titleEn'] as String?,
        descriptionEn: data['descriptionEn'] as String?,
        subTitleEn: data['subTitleEn'] as String?,
      );

  static DrinkingGamesDateStruct? maybeFromMap(dynamic data) => data is Map
      ? DrinkingGamesDateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'minPlayers': _minPlayers,
        'recommendStar': _recommendStar,
        'subTitle': _subTitle,
        'isOnlyJapan': _isOnlyJapan,
        'useThisApp': _useThisApp,
        'thisAppNav': _thisAppNav,
        'titleEn': _titleEn,
        'descriptionEn': _descriptionEn,
        'subTitleEn': _subTitleEn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'minPlayers': serializeParam(
          _minPlayers,
          ParamType.int,
        ),
        'recommendStar': serializeParam(
          _recommendStar,
          ParamType.int,
        ),
        'subTitle': serializeParam(
          _subTitle,
          ParamType.String,
        ),
        'isOnlyJapan': serializeParam(
          _isOnlyJapan,
          ParamType.bool,
        ),
        'useThisApp': serializeParam(
          _useThisApp,
          ParamType.bool,
        ),
        'thisAppNav': serializeParam(
          _thisAppNav,
          ParamType.String,
        ),
        'titleEn': serializeParam(
          _titleEn,
          ParamType.String,
        ),
        'descriptionEn': serializeParam(
          _descriptionEn,
          ParamType.String,
        ),
        'subTitleEn': serializeParam(
          _subTitleEn,
          ParamType.String,
        ),
      }.withoutNulls;

  static DrinkingGamesDateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DrinkingGamesDateStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        minPlayers: deserializeParam(
          data['minPlayers'],
          ParamType.int,
          false,
        ),
        recommendStar: deserializeParam(
          data['recommendStar'],
          ParamType.int,
          false,
        ),
        subTitle: deserializeParam(
          data['subTitle'],
          ParamType.String,
          false,
        ),
        isOnlyJapan: deserializeParam(
          data['isOnlyJapan'],
          ParamType.bool,
          false,
        ),
        useThisApp: deserializeParam(
          data['useThisApp'],
          ParamType.bool,
          false,
        ),
        thisAppNav: deserializeParam(
          data['thisAppNav'],
          ParamType.String,
          false,
        ),
        titleEn: deserializeParam(
          data['titleEn'],
          ParamType.String,
          false,
        ),
        descriptionEn: deserializeParam(
          data['descriptionEn'],
          ParamType.String,
          false,
        ),
        subTitleEn: deserializeParam(
          data['subTitleEn'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DrinkingGamesDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DrinkingGamesDateStruct &&
        title == other.title &&
        description == other.description &&
        minPlayers == other.minPlayers &&
        recommendStar == other.recommendStar &&
        subTitle == other.subTitle &&
        isOnlyJapan == other.isOnlyJapan &&
        useThisApp == other.useThisApp &&
        thisAppNav == other.thisAppNav &&
        titleEn == other.titleEn &&
        descriptionEn == other.descriptionEn &&
        subTitleEn == other.subTitleEn;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        minPlayers,
        recommendStar,
        subTitle,
        isOnlyJapan,
        useThisApp,
        thisAppNav,
        titleEn,
        descriptionEn,
        subTitleEn
      ]);
}

DrinkingGamesDateStruct createDrinkingGamesDateStruct({
  String? title,
  String? description,
  int? minPlayers,
  int? recommendStar,
  String? subTitle,
  bool? isOnlyJapan,
  bool? useThisApp,
  String? thisAppNav,
  String? titleEn,
  String? descriptionEn,
  String? subTitleEn,
}) =>
    DrinkingGamesDateStruct(
      title: title,
      description: description,
      minPlayers: minPlayers,
      recommendStar: recommendStar,
      subTitle: subTitle,
      isOnlyJapan: isOnlyJapan,
      useThisApp: useThisApp,
      thisAppNav: thisAppNav,
      titleEn: titleEn,
      descriptionEn: descriptionEn,
      subTitleEn: subTitleEn,
    );
