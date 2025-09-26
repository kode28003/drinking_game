// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:drinking_game/flutter_flow/admob_util.dart' as admob;

Future showInterstitialAdCustom() async {
  // Add your function code here!
  await admob.showInterstitialAd();
  // await admob.loadInterstitialAd(
  //   'ca-app-pub-6843318091304139~3018067073', // ← テストID（Android用）
  //   () {
  //     // 成功時
  //     print("Interstitial ad loaded");
  //     //admob.showInterstitialAd();
  //   },
  //   () {
  //     // 失敗時
  //     print("Failed to load interstitial ad");
  //   },
  // );
  admob.loadInterstitialAd(
    "",
    "ca-app-pub-6843318091304139/3140365667",
    false,
  );
}
