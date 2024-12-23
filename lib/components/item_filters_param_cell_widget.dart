import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_filters_param_cell_model.dart';
export 'item_filters_param_cell_model.dart';

class ItemFiltersParamCellWidget extends StatefulWidget {
  const ItemFiltersParamCellWidget({
    super.key,
    required this.param,
    required this.filters,
  });

  final DocumentReference? param;
  final FilterTypeStruct? filters;

  @override
  State<ItemFiltersParamCellWidget> createState() =>
      _ItemFiltersParamCellWidgetState();
}

class _ItemFiltersParamCellWidgetState
    extends State<ItemFiltersParamCellWidget> {
  late ItemFiltersParamCellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemFiltersParamCellModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ParamRecord>(
      stream: ParamRecord.getDocument(widget!.param!),
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

        final containerParamRecord = snapshot.data!;

        return Container(
          decoration: BoxDecoration(),
          child: StreamBuilder<List<ParamValueRecord>>(
            stream: queryParamValueRecord(
              queryBuilder: (paramValueRecord) => paramValueRecord
                  .where(
                    'param',
                    isEqualTo: widget!.param,
                  )
                  .orderBy('index'),
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
              List<ParamValueRecord> containerParamValueRecordList =
                  snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              containerParamRecord.name,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'involve',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'itemFiltersParamPage',
                                queryParameters: {
                                  'param': serializeParam(
                                    containerParamRecord,
                                    ParamType.Document,
                                  ),
                                  'values': serializeParam(
                                    containerParamValueRecordList,
                                    ParamType.Document,
                                    isList: true,
                                  ),
                                  'filters': serializeParam(
                                    widget!.filters,
                                    ParamType.DataStruct,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'param': containerParamRecord,
                                  'values': containerParamValueRecordList,
                                },
                              );
                            },
                            child: Container(
                              height: 32.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 24.0, 0.0),
                                  child: Text(
                                    'Все',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'involve',
                                          color: Color(0xFFFF981F),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final valuesList =
                                  containerParamValueRecordList.toList();

                              return Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(valuesList.length,
                                    (valuesListIndex) {
                                  final valuesListItem =
                                      valuesList[valuesListIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (widget!.filters!.values
                                          .contains(ParamValueStruct(
                                        param: widget!.param,
                                        value: valuesListItem.value,
                                      ))) {
                                        context.safePop();
                                      } else {
                                        context.safePop();
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: widget!.filters!.values
                                                    .contains(ParamValueStruct(
                                              param: widget!.param,
                                              value: valuesListItem.value,
                                            ))
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color: widget!.filters!.values
                                                      .contains(
                                                          ParamValueStruct(
                                                param: widget!.param,
                                                value: valuesListItem.value,
                                              ))
                                                  ? Colors.transparent
                                                  : Color(0xFFE0E0E0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                valuesListItem.value,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'involve',
                                                      color: widget!
                                                              .filters!.values
                                                              .contains(
                                                                  ParamValueStruct(
                                                        param: widget!.param,
                                                        value: valuesListItem
                                                            .value,
                                                      ))
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
