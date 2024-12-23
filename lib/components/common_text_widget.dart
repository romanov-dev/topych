import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'common_text_model.dart';
export 'common_text_model.dart';

class CommonTextWidget extends StatefulWidget {
  const CommonTextWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<CommonTextWidget> createState() => _CommonTextWidgetState();
}

class _CommonTextWidgetState extends State<CommonTextWidget> {
  late CommonTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommonTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      valueOrDefault<String>(
        widget!.text,
        '-',
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'involve',
            letterSpacing: 0.0,
            useGoogleFonts: false,
          ),
    );
  }
}
