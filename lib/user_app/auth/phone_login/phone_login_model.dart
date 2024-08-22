import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'phone_login_widget.dart' show PhoneLoginWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneLoginModel extends FlutterFlowModel<PhoneLoginWidget> {
  ///  Local state fields for this page.

  UsersRecord? usr;

  ///  State fields for stateful widgets in this page.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '+## ##-####-####');
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
