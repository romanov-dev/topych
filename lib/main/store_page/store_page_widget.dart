import 'package:flutter_svg/svg.dart';
import 'package:t_o_p_y_c_h_mobile/components/networkImageView.dart';

import '/backend/backend.dart';
import '/components/common_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/item_cell/item_cell_widget.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'store_page_model.dart';
export 'store_page_model.dart';

class StorePageWidget extends StatefulWidget {
  const StorePageWidget({
    super.key,
    required this.store,
  });

  final DocumentReference? store;

  @override
  State<StorePageWidget> createState() => _StorePageWidgetState();
}

class _StorePageWidgetState extends State<StorePageWidget> {
  late StorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StorePageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                  text: 'Магазин',
                  showBack: true,
                ),
              ),
              Expanded(
                child: StreamBuilder<StoreRecord>(
                  stream: StoreRecord.getDocument(widget!.store!),
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

                    final containerStoreRecord = snapshot.data!;

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  readOnly: true,
                                  onTap: () {
                                    context.pushNamed(
                                      'ItemsSearchPage',
                                      queryParameters: {
                                        'store': serializeParam(
                                          widget!.store,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                        fontFamily: 'involve',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                      hintText: 'Поиск',
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
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFFAFAFA),
                                      prefixIcon: Container(
                                        width: 25,
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/Search.svg',
                                            width: 25.0,
                                            height: 25.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'involve',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator.asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: NetworkImageView(
                                    image: containerStoreRecord.cover,
                                    borderRadius: BorderRadius.circular(8.0),
                                    height: double.infinity,
                                    width: double.infinity
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: containerStoreRecord.color,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Магазин',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'involve',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                          child: Text(
                                            containerStoreRecord.name,
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'involve',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Описание',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'involve',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      containerStoreRecord.description,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'involve',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                              child: StreamBuilder<List<ItemRecord>>(
                                stream: queryItemRecord(
                                  queryBuilder: (itemRecord) => itemRecord
                                      .where(
                                    'store',
                                    isEqualTo: widget!.store,
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
                                  List<ItemRecord> containerItemRecordList = snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: containerItemRecordList.length > 0,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                      child: Text(
                                                        'Товары магазина',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'involve',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
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
                                                        'ItemsAllPage',
                                                        queryParameters: {
                                                          'store': serializeParam(
                                                            containerStoreRecord.reference,
                                                            ParamType.DocumentReference,
                                                          ),
                                                          'title': serializeParam(
                                                            "Товары магазина",
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Все',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'involve',
                                                            color: Color(0xFFFF981F),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.bold,
                                                            useGoogleFonts: false,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_forward_rounded,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ].divide(SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 268.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final popularItems = containerItemRecordList.toList();
                                                  if (popularItems.isEmpty) {
                                                    return Center(
                                                      child: CommonTextWidget(
                                                        text: 'Товаров нет',
                                                      ),
                                                    );
                                                  }

                                                  return SingleChildScrollView(
                                                    scrollDirection: Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: List.generate(popularItems.length, (popularItemsIndex) {
                                                        final popularItemsItem = popularItems[popularItemsIndex];
                                                        return Container(
                                                          width: 183.0,
                                                          height: 337.0,
                                                          decoration: BoxDecoration(
                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                          ),
                                                          child: ItemCellWidget(
                                                            key: Key('Keyrrp_${popularItemsIndex}_of_${popularItems.length}'),
                                                            item: popularItemsItem,
                                                          ),
                                                        );
                                                      })
                                                          .divide(SizedBox(width: 16.0))
                                                          .addToStart(SizedBox(width: 24.0))
                                                          .addToEnd(SizedBox(width: 24.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
