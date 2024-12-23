import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general_button_widget.dart';
import '/components/general_checkbox_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar01_clear/navbar01_clear_widget.dart';
import 'dart:ui';
import 'profile_categories_page_widget.dart' show ProfileCategoriesPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileCategoriesPageModel
    extends FlutterFlowModel<ProfileCategoriesPageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> categoriesSelected = [];
  void addToCategoriesSelected(DocumentReference item) =>
      categoriesSelected.add(item);
  void removeFromCategoriesSelected(DocumentReference item) =>
      categoriesSelected.remove(item);
  void removeAtIndexFromCategoriesSelected(int index) =>
      categoriesSelected.removeAt(index);
  void insertAtIndexInCategoriesSelected(int index, DocumentReference item) =>
      categoriesSelected.insert(index, item);
  void updateCategoriesSelectedAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      categoriesSelected[index] = updateFn(categoriesSelected[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Navbar01Clear component.
  late Navbar01ClearModel navbar01ClearModel;
  // Model for GeneralButton component.
  late GeneralButtonModel generalButtonModel1;
  // Model for GeneralButton component.
  late GeneralButtonModel generalButtonModel2;

  @override
  void initState(BuildContext context) {
    navbar01ClearModel = createModel(context, () => Navbar01ClearModel());
    generalButtonModel1 = createModel(context, () => GeneralButtonModel());
    generalButtonModel2 = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    navbar01ClearModel.dispose();
    generalButtonModel1.dispose();
    generalButtonModel2.dispose();
  }
}
