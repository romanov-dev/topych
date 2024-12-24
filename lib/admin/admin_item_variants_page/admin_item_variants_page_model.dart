import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import 'admin_item_variants_page_widget.dart' show AdminItemVariantsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdminItemVariantsPageModel
    extends FlutterFlowModel<AdminItemVariantsPageWidget> {
  ///  Local state fields for this page.

  List<ParamValueStruct> paramValues = [];
  void addToParamValues(ParamValueStruct item) => paramValues.add(item);
  void removeFromParamValues(ParamValueStruct item) => paramValues.remove(item);
  void removeAtIndexFromParamValues(int index) => paramValues.removeAt(index);
  void insertAtIndexInParamValues(int index, ParamValueStruct item) =>
      paramValues.insert(index, item);
  void updateParamValuesAtIndex(
          int index, Function(ParamValueStruct) updateFn) =>
      paramValues[index] = updateFn(paramValues[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Navbar02Text component.
  late Navbar02TextModel navbar02TextModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    navbar02TextModel = createModel(context, () => Navbar02TextModel());
  }

  @override
  void dispose() {
    navbar02TextModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
