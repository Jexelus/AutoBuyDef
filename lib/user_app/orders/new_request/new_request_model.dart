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

  final formKey = GlobalKey<FormState>();
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
  String? _carmodelTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't2lkc368' /* Поле обязательно для заполнени... */,
      );
    }

    return null;
  }

  // State field(s) for caryear widget.
  FocusNode? caryearFocusNode;
  TextEditingController? caryearTextController;
  String? Function(BuildContext, String?)? caryearTextControllerValidator;
  String? _caryearTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0fpi243w' /* Поле обязательно для заполнени... */,
      );
    }

    return null;
  }

  // State field(s) for mileage widget.
  FocusNode? mileageFocusNode;
  TextEditingController? mileageTextController;
  String? Function(BuildContext, String?)? mileageTextControllerValidator;
  String? _mileageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zd1s7745' /* Поле обязательно для заполнени... */,
      );
    }

    return null;
  }

  // State field(s) for enginetype widget.
  String? enginetypeValue;
  FormFieldController<String>? enginetypeValueController;
  // State field(s) for enignecapacity widget.
  FocusNode? enignecapacityFocusNode;
  TextEditingController? enignecapacityTextController;
  String? Function(BuildContext, String?)?
      enignecapacityTextControllerValidator;
  String? _enignecapacityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3hr75cqw' /* Поле обязательно для заполнени... */,
      );
    }

    return null;
  }

  // State field(s) for bodycolor widget.
  FocusNode? bodycolorFocusNode;
  TextEditingController? bodycolorTextController;
  String? Function(BuildContext, String?)? bodycolorTextControllerValidator;
  String? _bodycolorTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ce394z4q' /* Поле обязательно для заполнени... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in submit widget.
  OrdersRecord? newOrder;

  @override
  void initState(BuildContext context) {
    carmodelTextControllerValidator = _carmodelTextControllerValidator;
    caryearTextControllerValidator = _caryearTextControllerValidator;
    mileageTextControllerValidator = _mileageTextControllerValidator;
    enignecapacityTextControllerValidator =
        _enignecapacityTextControllerValidator;
    bodycolorTextControllerValidator = _bodycolorTextControllerValidator;
  }

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
