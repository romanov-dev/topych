import '/admin/admin_item_cell/admin_item_cell_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import 'admin_items_page_widget.dart' show AdminItemsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminItemsPageModel extends FlutterFlowModel<AdminItemsPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? categorySelected;

  DocumentReference? storeSelected;

  DocumentReference? ref;

  ///  State fields for stateful widgets in this page.

  // Model for Navbar02Text component.
  late Navbar02TextModel navbar02TextModel;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  // State field(s) for TextFieldDescr widget.
  FocusNode? textFieldDescrFocusNode;
  TextEditingController? textFieldDescrTextController;
  String? Function(BuildContext, String?)?
      textFieldDescrTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  @override
  void initState(BuildContext context) {
    navbar02TextModel = createModel(context, () => Navbar02TextModel());
  }

  @override
  void dispose() {
    navbar02TextModel.dispose();
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldDescrFocusNode?.dispose();
    textFieldDescrTextController?.dispose();
  }
}
