import '/admin/admin_category_cell/admin_category_cell_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar01_clear/navbar01_clear_widget.dart';
import 'dart:ui';
import 'admin_categories_page_widget.dart' show AdminCategoriesPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminCategoriesPageModel
    extends FlutterFlowModel<AdminCategoriesPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? editRef;

  ///  State fields for stateful widgets in this page.

  // Model for Navbar01Clear component.
  late Navbar01ClearModel navbar01ClearModel;

  @override
  void initState(BuildContext context) {
    navbar01ClearModel = createModel(context, () => Navbar01ClearModel());
  }

  @override
  void dispose() {
    navbar01ClearModel.dispose();
  }
}
