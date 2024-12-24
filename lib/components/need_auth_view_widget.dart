import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'need_auth_view_model.dart';
export 'need_auth_view_model.dart';

class NeedAuthViewWidget extends StatefulWidget {
  const NeedAuthViewWidget({super.key});

  @override
  State<NeedAuthViewWidget> createState() => _NeedAuthViewWidgetState();
}

class _NeedAuthViewWidgetState extends State<NeedAuthViewWidget> {
  late NeedAuthViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NeedAuthViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(45.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Illustration=Dot_Confetti,_Component=Successful_Illustrations.png',
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Text(
                    'Пройдите регистрацию или войдите!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'involve',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Чтобы выполнить следующее действие, пройдите регистрацию или войдите',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'involve',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.generalButtonModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: GeneralButtonWidget(
                      title: 'Регистрация/Вход',
                      isActive: true,
                      onTap: () async {
                        context.pushNamed('LoginPage');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.generalButtonModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: GeneralButtonWidget(
                      title: 'Может позже',
                      isActive: true,
                      bgColor: Color(0xFFEAEAEA),
                      textColor: FlutterFlowTheme.of(context).primaryText,
                      onTap: () async {
                        context.safePop();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
