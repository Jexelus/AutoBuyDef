import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  UsersRecord? usr;

  ///  State fields for stateful widgets in this page.

  // State field(s) for userLogin widget.
  FocusNode? userLoginFocusNode;
  TextEditingController? userLoginTextController;
  String? Function(BuildContext, String?)? userLoginTextControllerValidator;
  // State field(s) for userPass widget.
  FocusNode? userPassFocusNode;
  TextEditingController? userPassTextController;
  late bool userPassVisibility;
  String? Function(BuildContext, String?)? userPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    userPassVisibility = false;
  }

  @override
  void dispose() {
    userLoginFocusNode?.dispose();
    userLoginTextController?.dispose();

    userPassFocusNode?.dispose();
    userPassTextController?.dispose();
  }
}
