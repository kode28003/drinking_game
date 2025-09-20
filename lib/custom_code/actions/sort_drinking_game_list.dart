// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future sortDrinkingGameList(List<DrinkingGamesDateStruct> appstate) async {
  // Add your function code here!
  final newList = List<DrinkingGamesDateStruct>.from(appstate);

// recommendStar 高い順に並び替え
  newList.sort((a, b) => b.recommendStar.compareTo(a.recommendStar));

// AppState を更新して再描画
  FFAppState().drinkingGameStates = newList;
}
