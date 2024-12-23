import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_button_model.dart';
export 'radio_button_model.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({
    super.key,
    bool? selected,
  }) : this.selected = selected ?? false;

  final bool selected;

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  late RadioButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioButtonModel());
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
        if (widget!.selected)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/radio.svg',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.cover,
            ),
          ),
        if (!widget!.selected)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/radioUnselected.svg',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
