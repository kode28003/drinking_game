import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<IpponsStruct> shuffleAppStateList(List<IpponsStruct> ippons) {
  final newList = List<IpponsStruct>.from(ippons);
  newList.shuffle();
  return newList;
}

List<DrinkingGamesDateStruct> simpleSearchFromdrinkingGames(
  List<DrinkingGamesDateStruct> beforeGameLists,
  String? searchText,
) {
  // if (searchText == null || searchText.trim().isEmpty) {
  //   // 検索文字が空なら全件返す
  //   return beforeGameLists;
  // }

  // final query = searchText.trim().toLowerCase();

  // // title に検索文字を含むものをフィルタ
  // return beforeGameLists.where((game) {
  //   final title = game.title?.toLowerCase() ?? '';
  //   return title.contains(query);
  // }).toList();

  if (searchText == null || searchText.trim().isEmpty) {
    // 検索文字が空なら全件返す
    return beforeGameLists;
  }

  final query = searchText.trim().toLowerCase();

  // 日本語かどうか判定（ひらがな、カタカナ、漢字を含むか）
  final isJapanese = RegExp(r'[\u3040-\u30FF\u4E00-\u9FFF]').hasMatch(query);

  return beforeGameLists.where((game) {
    final targetTitle = isJapanese
        ? (game.title?.toLowerCase() ?? '')
        : (game.titleEn?.toLowerCase() ?? '');
    return targetTitle.contains(query);
  }).toList();
}
