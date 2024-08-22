import '/flutter_flow/flutter_flow_util.dart';
import 'update_name_of_user_widget.dart' show UpdateNameOfUserWidget;
import 'package:flutter/material.dart';

class UpdateNameOfUserModel extends FlutterFlowModel<UpdateNameOfUserWidget> {
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
