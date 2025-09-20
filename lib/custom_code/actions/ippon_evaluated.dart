// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future ipponEvaluated(List<IpponsStruct> appstate) async {
  final newList = List<IpponsStruct>.from(appstate);

  // points の大きい順に並べ替え（降順ソート）
  newList.sort((a, b) => b.points.compareTo(a.points));

  if (newList.isNotEmpty) {
    // 最大 points を取得
    final maxPoints = newList.first.points;

    // 最大 points を持つ要素の ipponEvaluated を true に更新
    for (var i = 0; i < newList.length; i++) {
      if (newList[i].points == maxPoints) {
        newList[i].ipponEvaluated = true; // ← 直接代入
      } else {
        newList[i].ipponEvaluated = false; // ← 必要ならリセット
      }
    }
  }

  // AppState を更新
  FFAppState().ipponAppState = newList;
}
