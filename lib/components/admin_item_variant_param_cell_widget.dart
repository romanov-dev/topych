import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_item_variant_param_cell_model.dart';
export 'admin_item_variant_param_cell_model.dart';

class AdminItemVariantParamCellWidget extends StatefulWidget {
  const AdminItemVariantParamCellWidget({
    super.key,
    this.param,
    required this.onValueSelected,
  });

  final ParamRecord? param;
  final Future Function(String? value)? onValueSelected;

  @override
  State<AdminItemVariantParamCellWidget> createState() =>
      _AdminItemVariantParamCellWidgetState();
}

class _AdminItemVariantParamCellWidgetState
    extends State<AdminItemVariantParamCellWidget> {
  late AdminItemVariantParamCellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminItemVariantParamCellModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            valueOrDefault<String>(
              widget!.param?.name,
              '-',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'involve',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          StreamBuilder<List<ParamValueRecord>>(
            stream: queryParamValueRecord(
              queryBuilder: (paramValueRecord) => paramValueRecord.where(
                'param',
                isEqualTo: widget!.param?.reference,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<ParamValueRecord> rowParamValueRecordList = snapshot.data!;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(rowParamValueRecordList.length, (rowIndex) {
                    final rowParamValueRecord =
                        rowParamValueRecordList[rowIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.valueSelected = rowParamValueRecord.value;
                        safeSetState(() {});
                        await widget.onValueSelected?.call(
                          _model.valueSelected,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Text(
                          rowParamValueRecord.value,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'involve',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                color: _model.valueSelected == rowParamValueRecord.value ?Colors.red:Colors.black
                                  ),
                        ),
                      ),
                    );
                  }).divide(SizedBox(width: 10.0)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
