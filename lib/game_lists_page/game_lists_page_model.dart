import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'game_lists_page_widget.dart' show GameListsPageWidget;
import 'package:flutter/material.dart';

class GameListsPageModel extends FlutterFlowModel<GameListsPageWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  List<DrinkingGamesDateStruct> searchedList = [];
  void addToSearchedList(DrinkingGamesDateStruct item) =>
      searchedList.add(item);
  void removeFromSearchedList(DrinkingGamesDateStruct item) =>
      searchedList.remove(item);
  void removeAtIndexFromSearchedList(int index) => searchedList.removeAt(index);
  void insertAtIndexInSearchedList(int index, DrinkingGamesDateStruct item) =>
      searchedList.insert(index, item);
  void updateSearchedListAtIndex(
          int index, Function(DrinkingGamesDateStruct) updateFn) =>
      searchedList[index] = updateFn(searchedList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
