import 'package:collection/collection.dart';
import 'package:t_o_p_y_c_h_mobile/components/networkImageView.dart';
import 'package:t_o_p_y_c_h_mobile/main/reviewsHeader.dart';

import '../../backend/schema/structs/item_variant_type_struct.dart';
import '/backend/backend.dart';
import '/components/common_text_widget.dart';
import '/components/review_cell_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/item_buy_bottom/item_buy_bottom_widget.dart';
import '/main/item_cell/item_cell_widget.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_page_model.dart';
export 'item_page_model.dart';

class ItemPageWidget extends StatefulWidget {
  const ItemPageWidget({
    super.key,
    required this.item,
  });

  final DocumentReference? item;

  @override
  State<ItemPageWidget> createState() => _ItemPageWidgetState();
}

class _ItemPageWidgetState extends State<ItemPageWidget> {
  late ItemPageModel _model;


  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuyVariantObject buyObject = BuyVariantObject();

  bool imageAdded = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemPageModel());
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
                child: const Navbar02TextWidget(
                  text: 'Товар',
                  showBack: true,
                ),
              ),
              Expanded(
                child: StreamBuilder<ItemRecord>(
                  stream: ItemRecord.getDocument(widget!.item!),
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

                    final containerItemRecord = snapshot.data!;

                    buyObject.item = containerItemRecord;

                    if (!imageAdded) {
                      _model.activeImage = containerItemRecord.images.first;
                      imageAdded = true;
                    }

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 573.0,
                                    decoration: const BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        if (_model.activeImage != null)
                                          // ClipRRect(
                                          //   borderRadius: BorderRadius.circular(8.0),
                                          //   child: Image.network(
                                          //     _model.activeImage!,
                                          //     width: double.infinity,
                                          //     height: double.infinity,
                                          //     fit: BoxFit.cover,
                                          //   ),
                                          // ),
                                          NetworkImageView(
                                              image: _model.activeImage!,
                                              borderRadius: BorderRadius.circular(8.0),
                                              height: double.infinity,
                                              width: double.infinity),
                                        Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final images = containerItemRecord.images.toList();

                                                  return SingleChildScrollView(
                                                    scrollDirection: Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: List.generate(images.length, (imagesIndex) {
                                                        final imagesItem = images[imagesIndex];
                                                        return InkWell(
                                                          splashColor: Colors.transparent,
                                                          focusColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          onTap: () async {
                                                            _model.activeImage = imagesItem;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 60.0,
                                                            decoration: BoxDecoration(
                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                              borderRadius: BorderRadius.circular(4.0),
                                                              border: Border.all(
                                                                color: _model.activeImage == imagesItem
                                                                    ? const Color(0xFF212121)
                                                                    : const Color(0xFFE0E0E0),
                                                              ),
                                                            ),
                                                            // child: ClipRRect(
                                                            //   borderRadius: BorderRadius.circular(4.0),
                                                            //   child: Image.network(
                                                            //     imagesItem,
                                                            //     width: double.infinity,
                                                            //     height: double.infinity,
                                                            //     fit: BoxFit.cover,
                                                            //   ),
                                                            // ),
                                                            child: NetworkImageView(
                                                                image: imagesItem,
                                                                borderRadius: BorderRadius.circular(4.0),
                                                                height: double.infinity,
                                                                width: double.infinity),
                                                          ),
                                                        );
                                                      })
                                                          .divide(SizedBox(width: 16.0))
                                                          .addToStart(SizedBox(width: 31.0))
                                                          .addToEnd(SizedBox(width: 31.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                                    child: Text(
                                      containerItemRecord.name,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'involve',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        if ((containerItemRecord.price != null) && (containerItemRecord.price > 0.0))
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              functions.formatPrice(containerItemRecord.price),
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'involve',
                                                    color: Color(0xFF9E9E9E),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration.lineThrough,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                          child: Text(
                                            functions.formatPrice(containerItemRecord.priceDiscounted),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'involve',
                                                  color: Color(0xFFFF981F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/Star.svg',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                functions.getRate(containerItemRecord.rates.toList()),
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontFamily: 'involve',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 24.0, 0.0),
                                  child: StreamBuilder<StoreRecord>(
                                    stream: StoreRecord.getDocument(containerItemRecord.store!),
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

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'StorePage',
                                            queryParameters: {
                                              'store': serializeParam(
                                                containerStoreRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: containerStoreRecord.color ?? const Color(0xFFFAFAFA),
                                            borderRadius: BorderRadius.circular(6.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
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
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 17.0,
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
                                      );
                                    },
                                  ),
                                ),
                                Builder(builder: (BuildContext context) {
                                  if (containerItemRecord.variants.isEmpty) {
                                    return const SizedBox.shrink();
                                  }

                                  List<ParamValueStruct> values = [];
                                  for (var i in containerItemRecord.variants) {
                                    values.addAll(i.paramValues);
                                  }

                                  final valuesGrouped = groupBy(values, (item) => item.param);

                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: valuesGrouped.length,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      var doc = valuesGrouped.keys.toList()[index];
                                      var items = valuesGrouped[valuesGrouped.keys.toList()[index]]!.toList();
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                            child: StreamBuilder<ParamRecord>(
                                              stream: ParamRecord.getDocument(doc!),
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

                                                return Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                      child: Text(
                                                        containerParamRecord.name,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'involve',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 52,
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                      child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: items.length,
                                                        scrollDirection: Axis.horizontal,
                                                        itemBuilder: (BuildContext context, int index1) {
                                                          return Container(
                                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                                            margin: const EdgeInsets.only(right: 12),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(100),
                                                              color: buyObject.paramValuesSelected.contains(
                                                                  ParamValueStruct(
                                                                      param: doc,
                                                                      value: items[index1].value
                                                                  )
                                                              )
                                                                  ? FlutterFlowTheme.of(context).primary
                                                                  :Colors.transparent
                                                            ),
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  buyObject.paramValuesSelected.removeWhere((e) => e.param == doc);
                                                                  buyObject.paramValuesSelected.add(
                                                                      ParamValueStruct(
                                                                          param: doc,
                                                                          value: items[index1].value
                                                                      )
                                                                  );
                                                                  buyObject.checkVariantExist(item: containerItemRecord);
                                                                });
                                                              },
                                                              child: Center(
                                                                child: Text(
                                                                  items[index1].value,
                                                                  style: TextStyle(
                                                                      fontSize: 20,
                                                                      fontWeight: FontWeight.w600,
                                                                    color: buyObject.paramValuesSelected.contains(
                                                                        ParamValueStruct(
                                                                            param: doc,
                                                                            value: items[index1].value
                                                                        )
                                                                    )
                                                                        ? Colors.white
                                                                        : FlutterFlowTheme.of(context).primaryText
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  );
                                }),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 24.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Описание товара',
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
                                          containerItemRecord.description,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 24.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  'Рейтинг и отзывы',
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
                                                  'ReviewsPage',
                                                  queryParameters: {
                                                    'item': serializeParam(
                                                      widget!.item,
                                                      ParamType.DocumentReference,
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
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: ReviewsHeaderWidget(item: containerItemRecord),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                            child: StreamBuilder<List<ReviewRecord>>(
                                              stream: queryReviewRecord(
                                                queryBuilder: (reviewRecord) => reviewRecord.where(
                                                  'review_for_item',
                                                  isEqualTo: widget!.item,
                                                ),
                                                limit: 3,
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
                                                List<ReviewRecord> containerReviewRecordList = snapshot.data!;

                                                if (containerReviewRecordList.isEmpty) {
                                                  return SizedBox.shrink();
                                                }

                                                return Container(
                                                  width: double.infinity,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final reviews = containerReviewRecordList.toList();

                                                          return ListView.separated(
                                                            padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 24.0),
                                                            shrinkWrap: true,
                                                            physics: const NeverScrollableScrollPhysics(),
                                                            scrollDirection: Axis.vertical,
                                                            itemCount: reviews.length,
                                                            separatorBuilder: (_, __) => SizedBox(height: 12.0),
                                                            itemBuilder: (context, reviewsIndex) {
                                                              final reviewsItem = reviews[reviewsIndex];
                                                              return ReviewCellWidget(
                                                                key: Key('Keyrtc_${reviewsIndex}_of_${reviews.length}'),
                                                                review: reviewsItem,
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
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
                                            'category',
                                            isEqualTo: containerItemRecord.category,
                                          ),
                                      limit: 10
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
                                      containerItemRecordList = containerItemRecordList.where((e) => e.reference != widget.item).toList();

                                      if (containerItemRecordList.isEmpty) {
                                        return const SizedBox.shrink();
                                      }

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
                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                          child: Text(
                                                            'Похожие товары',
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
                                                      if (false)
                                                        Row(
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
                                                                key: Key('Keyrb7_${popularItemsIndex}_of_${popularItems.length}'),
                                                                item: popularItemsItem,
                                                              ),
                                                            );
                                                          })
                                                              .divide(SizedBox(width: 16.0))
                                                              .addToStart(SizedBox(width: 16.0))
                                                              .addToEnd(SizedBox(width: 16.0)),
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
                              ].addToEnd(const SizedBox(height: 130.0)),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                child: ItemBuyBottomWidget(
                                  buyObject: buyObject,
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

class BuyVariantObject {
  List<ParamValueStruct> paramValuesSelected = [];
  ItemVariantTypeStruct? variantSelected;
  ItemRecord? item;

  BuyVariantObject();

  void checkVariantExist({required ItemRecord item}) {
    for (var i in item.variants) {
      int valuesFit = 0;
      for (var j in i.paramValues) {
        if (paramValuesSelected.contains(j)) {
          valuesFit++;
        }
      }
      if (valuesFit == i.paramValues.length) {
        variantSelected = i;
        break;
      }
    }
  }
}
