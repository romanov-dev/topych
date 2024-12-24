import '../../backend/schema/structs/item_variant_type_struct.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/admin_item_variant_param_cell_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'admin_item_variants_page_model.dart';
export 'admin_item_variants_page_model.dart';

class AdminItemVariantsPageWidget extends StatefulWidget {
  const AdminItemVariantsPageWidget({
    super.key,
    required this.item,
  });

  final ItemRecord? item;

  @override
  State<AdminItemVariantsPageWidget> createState() => _AdminItemVariantsPageWidgetState();
}

class _AdminItemVariantsPageWidgetState extends State<AdminItemVariantsPageWidget> {
  late AdminItemVariantsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminItemVariantsPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.navbar02TextModel,
                updateCallback: () => safeSetState(() {}),
                child: Navbar02TextWidget(
                  text: 'Variants',
                  showBack: true,
                ),
              ),
              Text(
                "${widget!.item?.name ?? "-"}___${widget!.item?.category?.id ?? ""}",
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'involve',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
              Container(
                width: 200.0,
                child: TextFormField(
                  controller: _model.textController1,
                  focusNode: _model.textFieldFocusNode1,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'involve',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    hintText: 'price',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'involve',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'involve',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.textController1Validator.asValidator(context),
                ),
              ),
              Container(
                width: 200.0,
                child: TextFormField(
                  controller: _model.textController2,
                  focusNode: _model.textFieldFocusNode2,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'involve',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    hintText: 'count',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'involve',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'involve',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.textController2Validator.asValidator(context),
                ),
              ),
              StreamBuilder<CategoryRecord>(
                stream: CategoryRecord.getDocument(widget!.item!.category!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }

                  final containerCategoryRecord = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final paramsList =
                        containerCategoryRecord.params.toList();

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(paramsList.length,
                                  (paramsListIndex) {
                                final paramsListItem = paramsList[paramsListIndex];
                                return StreamBuilder<ParamRecord>(
                                  stream: ParamRecord.getDocument(paramsListItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context).primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final containerParamRecord = snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: AdminItemVariantParamCellWidget(
                                        key: Key(
                                            'Key8xx_${paramsListIndex}_of_${paramsList.length}'),
                                        param: containerParamRecord,
                                        onValueSelected: (value) async {
                                          _model.addToParamValues(ParamValueStruct(
                                            param: paramsListItem,
                                            value: value,
                                          ));
                                          safeSetState(() {});
                                        },
                                      ),
                                    );
                                  },
                                );
                              }),
                        );
                      },
                    ),
                  );
                },
              ),
              FFButtonWidget(
                onPressed: () async {
                  await widget!.item!.reference.update({
                    ...mapToFirestore(
                      {
                        'variants': FieldValue.arrayUnion([
                          getItemVariantTypeFirestoreData(
                            createItemVariantTypeStruct(
                              priceDiscounted: double.tryParse(_model.textController1.text),
                              count: int.tryParse(_model.textController2.text),
                              fieldValues: {
                                'paramValues': getParamValueListFirestoreData(
                                  _model.paramValues,
                                ),
                              },
                              clearUnsetFields: false,
                            ),
                            true,
                          )
                        ]),
                      },
                    ),
                  });
                },
                text: 'add',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'involve',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Builder(
                    builder: (context) {
                      final variantsList = widget!.item?.variants?.toList() ?? [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: variantsList.length,
                        itemBuilder: (context, variantsListIndex) {
                          final variantsListItem = variantsList[variantsListIndex];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final values = variantsListItem.paramValues.toList();

                                          return Wrap(
                                            spacing: 5.0,
                                            runSpacing: 5.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment: WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection: VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(values.length, (valuesIndex) {
                                              final valuesItem = values[valuesIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  StreamBuilder<ParamRecord>(
                                                    stream: ParamRecord.getDocument(valuesItem.param!),
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
                                                        child: Text(
                                                          '${containerParamRecord.name}: ',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'involve',
                                                                letterSpacing: 0.0,
                                                                useGoogleFonts: false,
                                                              ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Text(
                                                    valuesItem.value,
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'involve',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ],
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                      Text(
                                        'count: ${variantsListItem.count.toString()}',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'involve',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        'price:${variantsListItem.price.toString()}',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'involve',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        'priceDiscounted:${variantsListItem.priceDiscounted.toString()}',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          fontFamily: 'involve',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var confirmDialogResponse = await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('Del?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                    child: Text('Confirm'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ) ??
                                        false;
                                    if (confirmDialogResponse) {
                                      await widget!.item!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'variants': FieldValue.arrayRemove([
                                              getItemVariantTypeFirestoreData(
                                                updateItemVariantTypeStruct(
                                                  variantsListItem,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                        ),
                                      });
                                    }
                                  },
                                  text: 'Delete',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                          fontFamily: 'involve',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
