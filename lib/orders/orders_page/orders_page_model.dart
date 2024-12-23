import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/menu/bottom_menu/bottom_menu_widget.dart';
import 'dart:ui';
import 'orders_page_widget.dart' show OrdersPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdersPageModel extends FlutterFlowModel<OrdersPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BottomMenu component.
  late BottomMenuModel bottomMenuModel;

  @override
  void initState(BuildContext context) {
    bottomMenuModel = createModel(context, () => BottomMenuModel());
  }

  @override
  void dispose() {
    bottomMenuModel.dispose();
  }
}
