import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/categories_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/items_grid/items_grid_widget.dart';
import '/main/items_sort_filter_view/items_sort_filter_view_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'items_search_page_model.dart';
export 'items_search_page_model.dart';

class ItemsSearchPageWidget extends StatefulWidget {
  const ItemsSearchPageWidget({
    super.key,
    this.category,
    this.store,
    this.filterData,
    this.type,
  });

  final DocumentReference? category;
  final DocumentReference? store;
  final FilterData? filterData;
  final int? type;

  @override
  State<ItemsSearchPageWidget> createState() => _ItemsSearchPageWidgetState();
}

class _ItemsSearchPageWidgetState extends State<ItemsSearchPageWidget> {
  late ItemsSearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FilterData filterData;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsSearchPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.category != null) {
        _model.categorySearch = widget!.category;
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    if (widget.filterData != null) {
      filterData = widget.filterData!;
    }
    else {
      filterData = FilterData();
    }
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
              Container(
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
                          context.safePop();
                        },
                        child: Container(
                          width: 60.0,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                        child: Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              const Duration(milliseconds: 1000),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
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
                              ),
                              suffixIcon: _model.textController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textController?.clear();
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
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
                    ),
                  ],
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
                        isEqualTo: _model.categorySearch,
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

                    containerItemRecordList = containerItemRecordList.where((e) {
                      if (_model.textController.text.length < 2) {
                        return true;
                      }
                      return e.name.toLowerCase().contains(_model.textController.text.toLowerCase());
                    }).toList();


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
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.showHistory)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Недавние поиски',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'involve',
                                                  fontSize: 16.0,
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
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'searchHistory': FieldValue.delete(),
                                                },
                                              ),
                                            });
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 5.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Builder(
                                        builder: (context) {
                                          final searchHistoryList = (currentUserDocument?.searchHistory?.toList() ?? []).toList().take(5).toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(searchHistoryList.length, (searchHistoryListIndex) {
                                              final searchHistoryListItem = searchHistoryList[searchHistoryListIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          searchHistoryListItem,
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'involve',
                                                                color: Color(0xFF757575),
                                                                letterSpacing: 0.0,
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
                                                          await currentUserReference!.update({
                                                            ...mapToFirestore(
                                                              {
                                                                'searchHistory': FieldValue.arrayRemove([searchHistoryListItem]),
                                                              },
                                                            ),
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          Expanded(
                            child: Stack(
                              children: [
                                // if (containerItemRecordList.isNotEmpty)
                                  SingleChildScrollView(
                                    padding: EdgeInsets.only(bottom: 70),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 20.0),
                                            child: Text(
                                              '${containerItemRecordList.length.toString()} найдено',
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
                                        if (![0, 1].contains(widget.type) && widget.category == null)
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                            child: wrapWithModel(
                                              model: _model.categoriesHorizontalModel,
                                              updateCallback: () => safeSetState(() {}),
                                              child: CategoriesHorizontalWidget(
                                                parameter1: _model.categorySearch,
                                                onCategorySelected: (category) async {
                                                  _model.categorySearch = category;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        if (containerItemRecordList.isEmpty)
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
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
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Не  найдено',
                                                      textAlign: TextAlign.center,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'involve',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                                                      child: Text(
                                                        'Не найдены товары? Попробуйте повторить изменить фильтры',
                                                        textAlign: TextAlign.center,
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
                                              ],
                                            ),
                                          ),
                                        if (containerItemRecordList.isNotEmpty)
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
                                      ].addToEnd(const SizedBox(height: 60.0)),
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
                                        category: widget.category,
                                        filterData: filterData,
                                        onUpdate: () {
                                          setState(() {

                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
}

class FilterData {
    DocumentReference? category;
    double? priceFrom;
    double? priceTo;
    double? priceMin;
    double? priceMax;
    FilterPriceRangeStruct? priceRange;
    List<ParamValueStruct> values = [];

    FilterData();

    void clearData() {
      category = null;
      priceFrom = null;
      priceTo = null;
      priceRange = null;
      values = [];
    }
}
