import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'general_checkbox_model.dart';
export 'general_checkbox_model.dart';

class GeneralCheckboxWidget extends StatefulWidget {
  const GeneralCheckboxWidget({
    super.key,
    bool? checked,
  }) : this.checked = checked ?? false;

  final bool checked;

  @override
  State<GeneralCheckboxWidget> createState() => _GeneralCheckboxWidgetState();
}

class _GeneralCheckboxWidgetState extends State<GeneralCheckboxWidget> {
  late GeneralCheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneralCheckboxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget!.checked)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Checkbox-checked.png',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.cover,
            ),
          ),
        if (!widget!.checked)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Checkbox_uchecked.png',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
