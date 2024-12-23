import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar01_clear/navbar01_clear_widget.dart';
import 'dart:ui';
import 'admin_banners_page_widget.dart' show AdminBannersPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminBannersPageModel extends FlutterFlowModel<AdminBannersPageWidget> {
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
