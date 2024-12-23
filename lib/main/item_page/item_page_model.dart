import '/backend/backend.dart';
import '/components/common_text_widget.dart';
import '/components/review_cell_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/item_buy_bottom/item_buy_bottom_widget.dart';
import '/main/item_cell/item_cell_widget.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'item_page_widget.dart' show ItemPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPageModel extends FlutterFlowModel<ItemPageWidget> {
  ///  Local state fields for this page.

  String? activeImage;

  ///  State fields for stateful widgets in this page.

  // Model for Navbar02Text component.
  late Navbar02TextModel navbar02TextModel;
  ItemRecord? containerPreviousSnapshot;
  // Model for itemBuyBottom component.
  late ItemBuyBottomModel itemBuyBottomModel;

  @override
  void initState(BuildContext context) {
    navbar02TextModel = createModel(context, () => Navbar02TextModel());
    itemBuyBottomModel = createModel(context, () => ItemBuyBottomModel());
  }

  @override
  void dispose() {
    navbar02TextModel.dispose();
    itemBuyBottomModel.dispose();
  }
}
