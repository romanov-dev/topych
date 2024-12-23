import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general_button_widget.dart';
import '/components/need_auth_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/item_buy_view/item_buy_view_widget.dart';
import 'dart:ui';
import 'item_buy_bottom_widget.dart' show ItemBuyBottomWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ItemBuyBottomModel extends FlutterFlowModel<ItemBuyBottomWidget> {
  ///  State fields for stateful widgets in this component.

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
