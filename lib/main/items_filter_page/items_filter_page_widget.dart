import 'package:flutter/cupertino.dart';
import 'package:t_o_p_y_c_h_mobile/index.dart';
import 'package:t_o_p_y_c_h_mobile/main/items_search_page/items_search_page_widget.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/general_button_widget.dart';
import '/components/item_filters_param_cell_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'items_filter_page_model.dart';
export 'items_filter_page_model.dart';

class ItemsFilterPageWidget extends StatefulWidget {
  const ItemsFilterPageWidget({super.key, this.filterData, this.category});

  final FilterData? filterData;
  final DocumentReference? category;

  @override
  State<ItemsFilterPageWidget> createState() => _ItemsFilterPageWidgetState();
}

class _ItemsFilterPageWidgetState extends State<ItemsFilterPageWidget> {
  late ItemsFilterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  RangeValues _currentRangeValues = const RangeValues(1, 100000);

  FilterData? filterDataBuffer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsFilterPageModel());

    filterDataBuffer = FilterData();
    filterDataBuffer?.category = widget.filterData?.category;
    filterDataBuffer?.priceRange = widget.filterData?.priceRange;
    filterDataBuffer?.priceTo = widget.filterData?.priceTo;
    filterDataBuffer?.priceFrom = widget.filterData?.priceFrom;
    filterDataBuffer?.priceMin = widget.filterData?.priceMin;
    filterDataBuffer?.priceMax = widget.filterData?.priceMax;
    filterDataBuffer?.values = [...(widget.filterData?.values ?? [])];


    // _currentRangeValues = RangeValues(filterDataBuffer?.priceMin ?? 0, filterDataBuffer?.priceMax ?? 100000);
    _currentRangeValues = RangeValues(filterDataBuffer?.priceFrom ?? 0, filterDataBuffer?.priceTo ?? 100000);


    SchedulerBinding.instance.addPostFrameCallback((_) async {


      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                child: Stack(
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
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Фильтр',
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
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.category == null)
                          StreamBuilder<List<CategoryRecord>>(
                            stream: queryCategoryRecord(
                              queryBuilder: (categoryRecord) => categoryRecord.orderBy('index'),
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
                              List<CategoryRecord> containerCategoryRecordList = snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [

                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Категории',
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                // await context.pushNamed(
                                                //   'ItemFiltersCategoriesPage',
                                                //   queryParameters: {
                                                //     'categories': serializeParam(
                                                //       containerCategoryRecordList,
                                                //       ParamType.Document,
                                                //       isList: true,
                                                //     ),
                                                //     // 'filters': serializeParam(
                                                //     //   _model.filters,
                                                //     //   ParamType.DataStruct,
                                                //     // ),
                                                //   }.withoutNulls,
                                                //   extra: <String, dynamic>{
                                                //     'categories': containerCategoryRecordList,
                                                //   },
                                                // );
                                                await Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) => ItemFiltersCategoriesPageWidget(
                                                            filterData: filterDataBuffer,
                                                            categories: containerCategoryRecordList,
                                                          ),
                                                      fullscreenDialog: false),
                                                );
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                ),
                                                child: Align(
                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                    child: Text(
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
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final categoriesList = containerCategoryRecordList.toList();

                                              return Wrap(
                                                spacing: 8.0,
                                                runSpacing: 8.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment: WrapAlignment.start,
                                                verticalDirection: VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(categoriesList.length, (categoriesListIndex) {
                                                  final categoriesListItem = categoriesList[categoriesListIndex];
                                                  return InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      if (filterDataBuffer?.category == categoriesListItem.reference) {
                                                        filterDataBuffer?.category = null;
                                                      } else {
                                                        filterDataBuffer?.category = categoriesListItem.reference;
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          height: 42.0,
                                                          decoration: BoxDecoration(
                                                            color: filterDataBuffer?.category == categoriesListItem.reference
                                                                ? FlutterFlowTheme.of(context).primary
                                                                : Colors.transparent,
                                                            borderRadius: BorderRadius.circular(100.0),
                                                            border: Border.all(
                                                              color: filterDataBuffer?.category == categoriesListItem.reference
                                                                  ? Colors.transparent
                                                                  : Color(0xFFE0E0E0),
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                              child: Text(
                                                                categoriesListItem.name,
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      fontFamily: 'involve',
                                                                      color: filterDataBuffer?.category == categoriesListItem.reference
                                                                          ? Colors.white
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      fontSize: 16.0,
                                                                      letterSpacing: 0.0,
                                                                      fontWeight: FontWeight.w600,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                          child: StreamBuilder<List<CategoryRecord>>(
                            stream: queryCategoryRecord(
                              queryBuilder: (categoryRecord) => categoryRecord.orderBy('index'),
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
                              List<CategoryRecord> containerCategoryRecordList = snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Цена',
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        // child: Slider(
                                        //   activeColor: FlutterFlowTheme.of(context).primary,
                                        //   inactiveColor: FlutterFlowTheme.of(context).alternate,
                                        //   min: 0.0,
                                        //   max: 10.0,
                                        //   value: _model.sliderValue ??= 5.0,
                                        //   onChanged: (newValue) async {
                                        //     newValue = double.parse(newValue.toStringAsFixed(2));
                                        //     safeSetState(() => _model.sliderValue = newValue);
                                        //     _model.updateFiltersStruct(
                                        //       (e) => e..priceFrom = _model.sliderValue,
                                        //     );
                                        //     safeSetState(() {});
                                        //   },
                                        // ),
                                        child: Column(
                                          children: [
                                            SliderTheme(
                                              data: SliderTheme.of(context).copyWith(
                                                activeTrackColor: Colors.black,
                                                // Цвет трека между бегунками
                                                inactiveTrackColor: Colors.grey,
                                                // Цвет трека вне бегунков
                                                thumbColor: Colors.black,
                                                // Цвет бегунков
                                                rangeThumbShape: const RoundRangeSliderThumbShape(
                                                  enabledThumbRadius: 16.0, // Размер бегунков
                                                ),
                                                trackHeight: 8.0,
                                                // Толщина трека
                                                overlayColor: Colors.black.withOpacity(0.2), // Цвет эффекта вокруг бегунка
                                              ),
                                              child: RangeSlider(
                                                values: _currentRangeValues,
                                                // min: filterDataBuffer?.priceMin ?? 0,
                                                // max: filterDataBuffer?.priceMax ?? 100000,
                                                min: 0,
                                                max: 100000,
                                                // divisions: ((filterDataBuffer?.priceMax ?? 100000) - (filterDataBuffer?.priceMin ?? 0)).toInt(),
                                                divisions: 100,
                                                labels: RangeLabels(
                                                  _currentRangeValues.start.round().toString(),
                                                  _currentRangeValues.end.round().toString(),
                                                ),
                                                onChanged: (RangeValues values) {
                                                  setState(() {
                                                    _currentRangeValues = values;
                                                    filterDataBuffer?.priceFrom = values.start;
                                                    filterDataBuffer?.priceTo = values.end;
                                                    filterDataBuffer?.priceRange = null;
                                                  });
                                                },
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(left: 24, right: 24),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  // Text(functions.formatPrice(filterDataBuffer?.priceMin ?? 0)),
                                                  // Text(functions.formatPrice(filterDataBuffer?.priceMax ?? 0)),
                                                  Text(functions.formatPrice(0)),
                                                  Text(functions.formatPrice(100000)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final priceRangesList = FFAppState().priceRanges.toList();

                                            return Wrap(
                                              spacing: 8.0,
                                              runSpacing: 8.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment: WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection: VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: List.generate(priceRangesList.length, (priceRangesListIndex) {
                                                final priceRangesListItem = priceRangesList[priceRangesListIndex];
                                                return InkWell(
                                                  splashColor: Colors.transparent,
                                                  focusColor: Colors.transparent,
                                                  hoverColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  onTap: () async {
                                                    if (filterDataBuffer?.priceRange == priceRangesListItem) {
                                                      filterDataBuffer?.priceRange = null;
                                                      // filterDataBuffer?.priceFrom = filterDataBuffer?.priceMin;
                                                      // filterDataBuffer?.priceTo = filterDataBuffer?.priceMax;
                                                      filterDataBuffer?.priceFrom = 0;
                                                      filterDataBuffer?.priceTo = 100000;
                                                    } else {
                                                      filterDataBuffer?.priceRange = priceRangesListItem;
                                                      // //Проверка левого бегунка
                                                      // if ((filterDataBuffer?.priceRange?.from ?? 0) < (filterDataBuffer?.priceMin ?? 0)) {
                                                      //   filterDataBuffer?.priceFrom = filterDataBuffer?.priceMin ?? 0;
                                                      // } else {
                                                      //   filterDataBuffer?.priceFrom = filterDataBuffer?.priceRange?.from;
                                                      // }
                                                      //
                                                      // //Проверка правого бегунка
                                                      // if ((filterDataBuffer?.priceRange?.to ?? 0) > (filterDataBuffer?.priceMax ?? 0)) {
                                                      //   filterDataBuffer?.priceTo = filterDataBuffer?.priceMax ?? 0;
                                                      // } else {
                                                      //   if ((filterDataBuffer?.priceRange?.to ?? 0) < (filterDataBuffer?.priceMin ?? 0)) {
                                                      //     filterDataBuffer?.priceTo = filterDataBuffer?.priceMin ?? 0;
                                                      //   } else {
                                                      //     filterDataBuffer?.priceTo = filterDataBuffer?.priceRange?.to;
                                                      //   }
                                                      // }
                                                      //Проверка левого бегунка
                                                      if ((filterDataBuffer?.priceRange?.from ?? 0) < 0) {
                                                        filterDataBuffer?.priceFrom = 0;
                                                      } else {
                                                        filterDataBuffer?.priceFrom = filterDataBuffer?.priceRange?.from;
                                                      }

                                                      //Проверка правого бегунка
                                                      if ((filterDataBuffer?.priceRange?.to ?? 0) > 100000) {
                                                        filterDataBuffer?.priceTo = 100000;
                                                      } else {
                                                        if ((filterDataBuffer?.priceRange?.to ?? 0) < (filterDataBuffer?.priceMin ?? 0)) {
                                                          filterDataBuffer?.priceTo = filterDataBuffer?.priceMin ?? 0;
                                                        } else {
                                                          filterDataBuffer?.priceTo = filterDataBuffer?.priceRange?.to;
                                                        }
                                                      }
                                                    }
                                                    _currentRangeValues =
                                                        RangeValues(filterDataBuffer?.priceFrom ?? 0, filterDataBuffer?.priceTo ?? 0);
                                                    safeSetState(() {});
                                                  },
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        height: 42.0,
                                                        decoration: BoxDecoration(
                                                          color: filterDataBuffer?.priceRange == priceRangesListItem
                                                              ? FlutterFlowTheme.of(context).primary
                                                              : Colors.transparent,
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: filterDataBuffer?.priceRange == priceRangesListItem
                                                                ? Colors.transparent
                                                                : const Color(0xFFE0E0E0),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                            child: Text(
                                                              priceRangesListItem.to == 1000000000
                                                                  ? '${functions.formatPrice(priceRangesListItem.from)} и выше'
                                                                  : '${functions.formatPrice(priceRangesListItem.from)} - ${functions.formatPrice(priceRangesListItem.to)}',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: 'involve',
                                                                    color: filterDataBuffer?.priceRange == priceRangesListItem
                                                                        ? Colors.white
                                                                        : FlutterFlowTheme.of(context).primaryText,
                                                                    fontSize: 16.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w600,
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
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        if (filterDataBuffer?.category != null)
                          StreamBuilder<CategoryRecord>(
                            stream: CategoryRecord.getDocument(filterDataBuffer!.category!),
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
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final paramsList = containerCategoryRecord.params.toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(paramsList.length, (paramsListIndex) {
                                                final paramsListItem = paramsList[paramsListIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                                                  child: ItemFiltersParamCellWidget(
                                                    key: Key('Key3c0_${paramsListIndex}_of_${paramsList.length}'),
                                                    param: paramsListItem,
                                                    filterDataBuffer: filterDataBuffer!,
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
                              );
                            },
                          ),
                      ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 30.0)),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: wrapWithModel(
                          model: _model.generalButtonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: GeneralButtonWidget(
                            title: 'Сбросить',
                            isActive: true,
                            bgColor: Color(0xFFEAEAEA),
                            textColor: FlutterFlowTheme.of(context).primaryText,
                            onTap: () async {
                              widget.filterData?.clearData();
                              safeSetState(() {});
                              context.safePop();
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: GeneralButtonWidget(
                          title: 'Применить',
                          isActive: true,
                          onTap: () async {
                            widget.filterData?.category = filterDataBuffer?.category;
                            widget.filterData?.priceRange = filterDataBuffer?.priceRange;
                            widget.filterData?.priceTo = filterDataBuffer?.priceTo;
                            widget.filterData?.priceFrom = filterDataBuffer?.priceFrom;
                            widget.filterData?.priceMin = filterDataBuffer?.priceMin;
                            widget.filterData?.priceMax = filterDataBuffer?.priceMax;
                            widget.filterData?.values = [...(filterDataBuffer?.values ?? [])];
                            safeSetState(() {});
                            context.safePop();
                          },
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
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
