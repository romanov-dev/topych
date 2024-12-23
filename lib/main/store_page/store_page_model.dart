import '/backend/backend.dart';
import '/components/common_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/item_cell/item_cell_widget.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import 'store_page_widget.dart' show StorePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StorePageModel extends FlutterFlowModel<StorePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Navbar02Text component.
  late Navbar02TextModel navbar02TextModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    navbar02TextModel = createModel(context, () => Navbar02TextModel());
  }

  @override
  void dispose() {
    navbar02TextModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
