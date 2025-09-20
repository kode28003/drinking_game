import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ippon_answer_page_widget.dart' show IpponAnswerPageWidget;
import 'package:flutter/material.dart';

class IpponAnswerPageModel extends FlutterFlowModel<IpponAnswerPageWidget> {
  ///  Local state fields for this page.

  int playerNum = 1;

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
