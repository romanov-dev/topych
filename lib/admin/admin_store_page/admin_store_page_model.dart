import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import 'admin_store_page_widget.dart' show AdminStorePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdminStorePageModel extends FlutterFlowModel<AdminStorePageWidget> {
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
  // State field(s) for TextFieldColor widget.
  FocusNode? textFieldColorFocusNode;
  TextEditingController? textFieldColorTextController;
  String? Function(BuildContext, String?)?
      textFieldColorTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

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

    textFieldColorFocusNode?.dispose();
    textFieldColorTextController?.dispose();
  }
}
