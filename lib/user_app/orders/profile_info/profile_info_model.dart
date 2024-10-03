import '/flutter_flow/flutter_flow_util.dart';
import 'profile_info_widget.dart' show ProfileInfoWidget;
import 'package:flutter/material.dart';

class ProfileInfoModel extends FlutterFlowModel<ProfileInfoWidget> {
  ///  State fields for stateful widgets in this component.

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
