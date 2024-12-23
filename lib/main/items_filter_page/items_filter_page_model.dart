import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/general_button_widget.dart';
import '/components/item_filters_param_cell_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'items_filter_page_widget.dart' show ItemsFilterPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemsFilterPageModel extends FlutterFlowModel<ItemsFilterPageWidget> {
  ///  Local state fields for this page.

  FilterTypeStruct? filters;
  void updateFiltersStruct(Function(FilterTypeStruct) updateFn) {
    updateFn(filters ??= FilterTypeStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for Slider widget.
  double? sliderValue;
  // Model for GeneralButton component.
  late GeneralButtonModel generalButtonModel1;
  // Model for GeneralButton component.
  late GeneralButtonModel generalButtonModel2;

  @override
  void initState(BuildContext context) {
    generalButtonModel1 = createModel(context, () => GeneralButtonModel());
    generalButtonModel2 = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalButtonModel1.dispose();
    generalButtonModel2.dispose();
  }
}
