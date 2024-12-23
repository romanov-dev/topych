import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categories_horizontal_model.dart';
export 'categories_horizontal_model.dart';

class CategoriesHorizontalWidget extends StatefulWidget {
  const CategoriesHorizontalWidget({
    super.key,
    this.parameter1,
    required this.onCategorySelected,
  });

  final DocumentReference? parameter1;
  final Future Function(DocumentReference? category)? onCategorySelected;

  @override
  State<CategoriesHorizontalWidget> createState() =>
      _CategoriesHorizontalWidgetState();
}

class _CategoriesHorizontalWidgetState
    extends State<CategoriesHorizontalWidget> {
  late CategoriesHorizontalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesHorizontalModel());
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
      height: 42.0,
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.category = null;
                safeSetState(() {});
                await widget.onCategorySelected?.call(
                  null,
                );
              },
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: widget!.parameter1 == null
                        ? FlutterFlowTheme.of(context).primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: Color(0xFFE0E0E0),
                      width: 1.0,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        'Все',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'involve',
                              color: widget!.parameter1 == null
                                  ? Colors.white
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            StreamBuilder<List<CategoryRecord>>(
              stream: queryCategoryRecord(
                queryBuilder: (categoryRecord) =>
                    categoryRecord.orderBy('index'),
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
                List<CategoryRecord> rowCategoryRecordList = snapshot.data!;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(rowCategoryRecordList.length, (rowIndex) {
                    final rowCategoryRecord = rowCategoryRecordList[rowIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.category = rowCategoryRecord.reference;
                        safeSetState(() {});
                        await widget.onCategorySelected?.call(
                          rowCategoryRecord.reference,
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: widget!.parameter1 ==
                                    rowCategoryRecord.reference
                                ? FlutterFlowTheme.of(context).primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: Color(0xFFE0E0E0),
                              width: 1.0,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Text(
                                rowCategoryRecord.name,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'involve',
                                      color: widget!.parameter1 ==
                                              rowCategoryRecord.reference
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).divide(SizedBox(width: 12.0)),
                );
              },
            ),
          ]
              .divide(SizedBox(width: 12.0))
              .addToStart(SizedBox(width: 16.0))
              .addToEnd(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
