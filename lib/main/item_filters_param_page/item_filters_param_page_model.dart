import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/general_checkbox_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import 'item_filters_param_page_widget.dart' show ItemFiltersParamPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemFiltersParamPageModel
    extends FlutterFlowModel<ItemFiltersParamPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Navbar02Text component.
  late Navbar02TextModel navbar02TextModel;

  @override
  void initState(BuildContext context) {
    navbar02TextModel = createModel(context, () => Navbar02TextModel());
  }

  @override
  void dispose() {
    navbar02TextModel.dispose();
  }
}
