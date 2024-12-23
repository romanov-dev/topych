import '/components/radio_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'items_sort_view_widget.dart' show ItemsSortViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemsSortViewModel extends FlutterFlowModel<ItemsSortViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for radioButton component.
  late RadioButtonModel radioButtonModel1;
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel2;

  @override
  void initState(BuildContext context) {
    radioButtonModel1 = createModel(context, () => RadioButtonModel());
    radioButtonModel2 = createModel(context, () => RadioButtonModel());
  }

  @override
  void dispose() {
    radioButtonModel1.dispose();
    radioButtonModel2.dispose();
  }
}
