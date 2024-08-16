import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_request_widget.dart' show NewRequestWidget;
import 'package:flutter/material.dart';

class NewRequestModel extends FlutterFlowModel<NewRequestWidget> {
  ///  Local state fields for this component.

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  ///  State fields for stateful widgets in this component.

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
