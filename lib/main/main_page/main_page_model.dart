import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/categories_horizontal_widget.dart';
import '/components/common_text_widget.dart';
import '/components/need_auth_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/item_cell/item_cell_widget.dart';
import '/menu/bottom_menu/bottom_menu_widget.dart';
import 'dart:ui';
import 'main_page_widget.dart' show MainPageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? categorySelected;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for categoriesHorizontal component.
  late CategoriesHorizontalModel categoriesHorizontalModel;
  // Model for BottomMenu component.
  late BottomMenuModel bottomMenuModel;

  @override
  void initState(BuildContext context) {
    categoriesHorizontalModel =
        createModel(context, () => CategoriesHorizontalModel());
    bottomMenuModel = createModel(context, () => BottomMenuModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    categoriesHorizontalModel.dispose();
    bottomMenuModel.dispose();
  }
}
