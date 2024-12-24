import 'package:t_o_p_y_c_h_mobile/main/items_search_page/items_search_page_widget.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/items_grid/items_grid_widget.dart';
import '/main/items_sort_filter_view/items_sort_filter_view_widget.dart';
import '/navbar/navbar03_text_search/navbar03_text_search_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'items_all_page_model.dart';
export 'items_all_page_model.dart';

class ItemsAllPageWidget extends StatefulWidget {
  const ItemsAllPageWidget({
    super.key,
    this.category,
    this.type,
    String? title,
    this.store,
  }) : this.title = title ?? '-';

  final CategoryRecord? category;
  final int? type;
  final String title;
  final DocumentReference? store;

  @override
  State<ItemsAllPageWidget> createState() => _ItemsAllPageWidgetState();
}

class _ItemsAllPageWidgetState extends State<ItemsAllPageWidget> {
  late ItemsAllPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  FilterData filterData = FilterData();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsAllPageModel());
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
                model: _model.navbar03TextSearchModel,
                updateCallback: () => safeSetState(() {}),
                child: Navbar03TextSearchWidget(
                  text: getTitle(),
                  showBack: true,
                  searchOnTap: () async {
                    context.pushNamed(
                      'ItemsSearchPage',
                      queryParameters: {
                        'category': serializeParam(
                          widget!.category?.reference,
                          ParamType.DocumentReference,
                        ),
                        'store': serializeParam(
                          widget!.store,
                          ParamType.DocumentReference,
                        ),
                        'type': serializeParam(
                          widget!.type,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
              ),
              Expanded(
                child: StreamBuilder<List<ItemRecord>>(
                  stream: queryItemRecord(
                    queryBuilder: (itemRecord) {

                      if (widget.type == 1) {

                        return itemRecord.whereIn('category', (currentUserDocument?.categories?.toList() ?? []));
                      }
                      if (widget.type == 0) {
                        return itemRecord
                            .where(
                          'buyTimes',
                          isGreaterThan: 0,
                        )
                            .orderBy('buyTimes', descending: true);
                      }

                      if (widget.store != null) {
                        return itemRecord.where(
                          'store',
                          isEqualTo: widget!.store!,
                        );
                      }
                      return itemRecord.where(
                        'category',
                        isEqualTo: widget!.category?.reference,
                      );
                    },
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

                    if (filterData != null) {

                      if (filterData!.priceFrom != null && filterData!.priceTo != null) {
                        containerItemRecordList = containerItemRecordList.where((e) {
                          return e.priceDiscounted >= filterData!.priceFrom! && e.priceDiscounted <= filterData!.priceTo!;
                        }).toList();
                      }
                      if (filterData!.category != null) {
                        containerItemRecordList = containerItemRecordList.where((e) {
                          return e.category == filterData!.category;
                        }).toList();
                      }
                      if (filterData!.values.isNotEmpty) {
                        containerItemRecordList = containerItemRecordList.where((e) {
                          bool allowShow = false;

                          if (e.variants != null) {
                            for (var i in e.variants) {

                              if (i.paramValues != null) {
                                for (var j in i.paramValues) {

                                  if (filterData!.values!.contains(j)) {
                                    allowShow = true;
                                  }
                                }
                              }
                            }
                          }

                          return allowShow;
                        }).toList();
                      }
                    }


                    containerItemRecordList.sort((a, b) {
                      if (FFAppState().priceSort == 0) {
                        return a.priceDiscounted.compareTo(b.priceDiscounted);
                      }
                      else {
                        return b.priceDiscounted.compareTo(a.priceDiscounted);
                      }
                    });

                    if (containerItemRecordList.isNotEmpty) {
                      if (FFAppState().priceSort == 0) {
                        filterData.priceMin = containerItemRecordList.first.priceDiscounted;
                        filterData.priceMax = containerItemRecordList.last.priceDiscounted;
                      }
                      else {
                        filterData.priceMax = containerItemRecordList.first.priceDiscounted;
                        filterData.priceMin = containerItemRecordList.last.priceDiscounted;
                      }
                    }



                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          if (containerItemRecordList.isEmpty)
                            Container(
                              width: double.infinity,
                              // height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/strict-shopping-bag-2_2.png',
                                        width: 187.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Товаров не  найдено',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          fontFamily: 'involve',
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (containerItemRecordList.isNotEmpty)
                            SingleChildScrollView(
                              padding: EdgeInsets.only(bottom: 70),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.itemsGridModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ItemsGridWidget(
                                        items: containerItemRecordList,
                                      ),
                                    ),
                                  ),
                                ].addToStart(const SizedBox(height: 8.0)).addToEnd(const SizedBox(height: 30.0)),
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                              child: wrapWithModel(
                                model: _model.itemsSortFilterViewModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ItemsSortFilterViewWidget(
                                  category: widget.category?.reference,
                                  onUpdate: () {
                                    setState(() {

                                    });
                                  }, filterData: filterData,
                                ),
                              ),
                            ),
                          ),
                        ],
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

  String getTitle() {
    String title = "-";

    if (widget!.title != null) {
      title = widget!.title;
    }

    return title;
  }
}
