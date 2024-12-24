import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar03_text_search_model.dart';
export 'navbar03_text_search_model.dart';

class Navbar03TextSearchWidget extends StatefulWidget {
  const Navbar03TextSearchWidget({
    super.key,
    required this.text,
    bool? showBack,
    required this.searchOnTap,
  }) : this.showBack = showBack ?? true;

  final String? text;
  final bool showBack;
  final Future Function()? searchOnTap;

  @override
  State<Navbar03TextSearchWidget> createState() =>
      _Navbar03TextSearchWidgetState();
}

class _Navbar03TextSearchWidgetState extends State<Navbar03TextSearchWidget> {
  late Navbar03TextSearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Navbar03TextSearchModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget!.showBack) {
                  context.safePop();
                }
              },
              child: Container(
                width: 60.0,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Visibility(
                  visible: widget!.showBack,
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: SvgPicture.asset(
                          'assets/images/back_icon.svg',
                          width: 28.0,
                          height: 28.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              valueOrDefault<String>(
                widget!.text,
                '-',
              ),
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
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Container(
              width: 60.0,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: InkWell(
                onTap: () {
                  if (widget.searchOnTap != null) {
                    widget.searchOnTap!();
                  }

                },
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FaIcon(
                    FontAwesomeIcons.search,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
