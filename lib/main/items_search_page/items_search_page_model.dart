import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/categories_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/items_grid/items_grid_widget.dart';
import '/main/items_sort_filter_view/items_sort_filter_view_widget.dart';
import 'dart:ui';
import 'items_search_page_widget.dart' show ItemsSearchPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemsSearchPageModel extends FlutterFlowModel<ItemsSearchPageWidget> {
  ///  Local state fields for this page.

  bool showHistory = false;

  DocumentReference? categorySearch;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for categoriesHorizontal component.
  late CategoriesHorizontalModel categoriesHorizontalModel;
  // Model for itemsGrid component.
  late ItemsGridModel itemsGridModel;
  // Model for itemsSortFilterView component.
  late ItemsSortFilterViewModel itemsSortFilterViewModel;

  @override
  void initState(BuildContext context) {
    categoriesHorizontalModel =
        createModel(context, () => CategoriesHorizontalModel());
    itemsGridModel = createModel(context, () => ItemsGridModel());
    itemsSortFilterViewModel =
        createModel(context, () => ItemsSortFilterViewModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    categoriesHorizontalModel.dispose();
    itemsGridModel.dispose();
    itemsSortFilterViewModel.dispose();
  }
}
