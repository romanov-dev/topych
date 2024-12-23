import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/items_grid/items_grid_widget.dart';
import '/main/items_sort_filter_view/items_sort_filter_view_widget.dart';
import '/navbar/navbar03_text_search/navbar03_text_search_widget.dart';
import 'dart:ui';
import 'items_all_page_widget.dart' show ItemsAllPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemsAllPageModel extends FlutterFlowModel<ItemsAllPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Navbar03TextSearch component.
  late Navbar03TextSearchModel navbar03TextSearchModel;
  // Model for itemsGrid component.
  late ItemsGridModel itemsGridModel;
  // Model for itemsSortFilterView component.
  late ItemsSortFilterViewModel itemsSortFilterViewModel;

  @override
  void initState(BuildContext context) {
    navbar03TextSearchModel =
        createModel(context, () => Navbar03TextSearchModel());
    itemsGridModel = createModel(context, () => ItemsGridModel());
    itemsSortFilterViewModel =
        createModel(context, () => ItemsSortFilterViewModel());
  }

  @override
  void dispose() {
    navbar03TextSearchModel.dispose();
    itemsGridModel.dispose();
    itemsSortFilterViewModel.dispose();
  }
}
