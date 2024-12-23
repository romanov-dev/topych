import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'general_button_model.dart';
export 'general_button_model.dart';

class GeneralButtonWidget extends StatefulWidget {
  const GeneralButtonWidget({
    super.key,
    required this.title,
    bool? isActive,
    required this.onTap,
    double? height,
    this.bgColor,
    Color? textColor,
  })  : this.isActive = isActive ?? false,
        this.height = height ?? 58.0,
        this.textColor = textColor ?? Colors.white;

  final String? title;
  final bool isActive;
  final Future Function()? onTap;
  final double height;
  final Color? bgColor;
  final Color textColor;

  @override
  State<GeneralButtonWidget> createState() => _GeneralButtonWidgetState();
}

class _GeneralButtonWidgetState extends State<GeneralButtonWidget> {
  late GeneralButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        if (widget!.isActive) {
          await widget.onTap?.call();
        }
      },
      text: widget!.title!,
      options: FFButtonOptions(
        width: double.infinity,
        height: widget!.height,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget!.bgColor != null
            ? widget!.bgColor
            : (widget!.isActive
                ? FlutterFlowTheme.of(context).primary
                : Color(0xFFCECED1)),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'involve',
              color:
                  widget!.textColor == null ? Colors.white : widget!.textColor,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              useGoogleFonts: false,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
