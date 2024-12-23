import '/auth/firebase_auth/auth_util.dart';
import '/components/general_button_widget.dart';
import '/components/general_checkbox_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar01_clear/navbar01_clear_widget.dart';
import 'dart:ui';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  bool policyChecked = false;

  ///  State fields for stateful widgets in this page.

  // Model for Navbar01Clear component.
  late Navbar01ClearModel navbar01ClearModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '+# ### ### ## ##');
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for GeneralButton component.
  late GeneralButtonModel generalButtonModel;
  // Model for GeneralCheckbox component.
  late GeneralCheckboxModel generalCheckboxModel;

  @override
  void initState(BuildContext context) {
    navbar01ClearModel = createModel(context, () => Navbar01ClearModel());
    generalButtonModel = createModel(context, () => GeneralButtonModel());
    generalCheckboxModel = createModel(context, () => GeneralCheckboxModel());
  }

  @override
  void dispose() {
    navbar01ClearModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    generalButtonModel.dispose();
    generalCheckboxModel.dispose();
  }
}
