// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IpponsStruct extends BaseStruct {
  IpponsStruct({
    String? ipponUserName,
    bool? ipponEvaluated,
    String? ipponAnswer,
    int? sortRandomNum,
    int? points,
  })  : _ipponUserName = ipponUserName,
        _ipponEvaluated = ipponEvaluated,
        _ipponAnswer = ipponAnswer,
        _sortRandomNum = sortRandomNum,
        _points = points;

  // "ipponUserName" field.
  String? _ipponUserName;
  String get ipponUserName => _ipponUserName ?? '';
  set ipponUserName(String? val) => _ipponUserName = val;

  bool hasIpponUserName() => _ipponUserName != null;

  // "ipponEvaluated" field.
  bool? _ipponEvaluated;
  bool get ipponEvaluated => _ipponEvaluated ?? false;
  set ipponEvaluated(bool? val) => _ipponEvaluated = val;

  bool hasIpponEvaluated() => _ipponEvaluated != null;

  // "ipponAnswer" field.
  String? _ipponAnswer;
  String get ipponAnswer => _ipponAnswer ?? '';
  set ipponAnswer(String? val) => _ipponAnswer = val;

  bool hasIpponAnswer() => _ipponAnswer != null;

  // "sortRandomNum" field.
  int? _sortRandomNum;
  int get sortRandomNum => _sortRandomNum ?? 0;
  set sortRandomNum(int? val) => _sortRandomNum = val;

  void incrementSortRandomNum(int amount) =>
      sortRandomNum = sortRandomNum + amount;

  bool hasSortRandomNum() => _sortRandomNum != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  set points(int? val) => _points = val;

  void incrementPoints(int amount) => points = points + amount;

  bool hasPoints() => _points != null;

  static IpponsStruct fromMap(Map<String, dynamic> data) => IpponsStruct(
        ipponUserName: data['ipponUserName'] as String?,
        ipponEvaluated: data['ipponEvaluated'] as bool?,
        ipponAnswer: data['ipponAnswer'] as String?,
        sortRandomNum: castToType<int>(data['sortRandomNum']),
        points: castToType<int>(data['points']),
      );

  static IpponsStruct? maybeFromMap(dynamic data) =>
      data is Map ? IpponsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ipponUserName': _ipponUserName,
        'ipponEvaluated': _ipponEvaluated,
        'ipponAnswer': _ipponAnswer,
        'sortRandomNum': _sortRandomNum,
        'points': _points,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ipponUserName': serializeParam(
          _ipponUserName,
          ParamType.String,
        ),
        'ipponEvaluated': serializeParam(
          _ipponEvaluated,
          ParamType.bool,
        ),
        'ipponAnswer': serializeParam(
          _ipponAnswer,
          ParamType.String,
        ),
        'sortRandomNum': serializeParam(
          _sortRandomNum,
          ParamType.int,
        ),
        'points': serializeParam(
          _points,
          ParamType.int,
        ),
      }.withoutNulls;

  static IpponsStruct fromSerializableMap(Map<String, dynamic> data) =>
      IpponsStruct(
        ipponUserName: deserializeParam(
          data['ipponUserName'],
          ParamType.String,
          false,
        ),
        ipponEvaluated: deserializeParam(
          data['ipponEvaluated'],
          ParamType.bool,
          false,
        ),
        ipponAnswer: deserializeParam(
          data['ipponAnswer'],
          ParamType.String,
          false,
        ),
        sortRandomNum: deserializeParam(
          data['sortRandomNum'],
          ParamType.int,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'IpponsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IpponsStruct &&
        ipponUserName == other.ipponUserName &&
        ipponEvaluated == other.ipponEvaluated &&
        ipponAnswer == other.ipponAnswer &&
        sortRandomNum == other.sortRandomNum &&
        points == other.points;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [ipponUserName, ipponEvaluated, ipponAnswer, sortRandomNum, points]);
}

IpponsStruct createIpponsStruct({
  String? ipponUserName,
  bool? ipponEvaluated,
  String? ipponAnswer,
  int? sortRandomNum,
  int? points,
}) =>
    IpponsStruct(
      ipponUserName: ipponUserName,
      ipponEvaluated: ipponEvaluated,
      ipponAnswer: ipponAnswer,
      sortRandomNum: sortRandomNum,
      points: points,
    );
