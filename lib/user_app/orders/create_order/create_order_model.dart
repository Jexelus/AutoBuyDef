import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_order_widget.dart' show CreateOrderWidget;
import 'package:flutter/material.dart';

class CreateOrderModel extends FlutterFlowModel<CreateOrderWidget> {
  ///  Local state fields for this page.

  String? newOrderId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // State field(s) for carmodel widget.
  FocusNode? carmodelFocusNode;
  TextEditingController? carmodelTextController;
  String? Function(BuildContext, String?)? carmodelTextControllerValidator;
  // State field(s) for caryear widget.
  FocusNode? caryearFocusNode;
  TextEditingController? caryearTextController;
  String? Function(BuildContext, String?)? caryearTextControllerValidator;
  // State field(s) for mileage widget.
  FocusNode? mileageFocusNode;
  TextEditingController? mileageTextController;
  String? Function(BuildContext, String?)? mileageTextControllerValidator;
  // State field(s) for enginetype widget.
  String? enginetypeValue;
  FormFieldController<String>? enginetypeValueController;
  // State field(s) for enignecapacity widget.
  FocusNode? enignecapacityFocusNode;
  TextEditingController? enignecapacityTextController;
  String? Function(BuildContext, String?)?
      enignecapacityTextControllerValidator;
  // State field(s) for bodycolor widget.
  FocusNode? bodycolorFocusNode;
  TextEditingController? bodycolorTextController;
  String? Function(BuildContext, String?)? bodycolorTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in submit widget.
  OrdersRecord? newOrder;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    carmodelFocusNode?.dispose();
    carmodelTextController?.dispose();

    caryearFocusNode?.dispose();
    caryearTextController?.dispose();

    mileageFocusNode?.dispose();
    mileageTextController?.dispose();

    enignecapacityFocusNode?.dispose();
    enignecapacityTextController?.dispose();

    bodycolorFocusNode?.dispose();
    bodycolorTextController?.dispose();
  }
}
