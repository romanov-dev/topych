import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'general_text_field_model.dart';
export 'general_text_field_model.dart';

class GeneralTextFieldWidget extends StatefulWidget {
  const GeneralTextFieldWidget({
    super.key,
    this.placeholder,
    this.initialText,
  });

  final String? placeholder;
  final String? initialText;

  @override
  State<GeneralTextFieldWidget> createState() => _GeneralTextFieldWidgetState();
}

class _GeneralTextFieldWidgetState extends State<GeneralTextFieldWidget> {
  late GeneralTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneralTextFieldModel());

    _model.textController ??= TextEditingController(text: widget!.initialText);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
      ),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController',
            Duration(milliseconds: 100),
            () => safeSetState(() {}),
          ),
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'involve',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
            hintText: widget!.placeholder,
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'involve',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'involve',
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
          maxLength: 300,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          buildCounter: (context,
                  {required currentLength, required isFocused, maxLength}) =>
              null,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
