import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/item_buy_bottom/item_buy_bottom_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'item_buy_view_widget.dart' show ItemBuyViewWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemBuyViewModel extends FlutterFlowModel<ItemBuyViewWidget> {
  ///  Local state fields for this component.

  int buyCount = 1;

  ///  State fields for stateful widgets in this component.

  // Model for itemBuyBottom component.
  late ItemBuyBottomModel itemBuyBottomModel;

  @override
  void initState(BuildContext context) {
    itemBuyBottomModel = createModel(context, () => ItemBuyBottomModel());
  }

  @override
  void dispose() {
    itemBuyBottomModel.dispose();
  }
}
