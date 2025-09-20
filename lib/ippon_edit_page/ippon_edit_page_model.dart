import '/flutter_flow/flutter_flow_util.dart';
import 'ippon_edit_page_widget.dart' show IpponEditPageWidget;
import 'package:flutter/material.dart';

class IpponEditPageModel extends FlutterFlowModel<IpponEditPageWidget> {
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
