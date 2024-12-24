import 'package:collection/collection.dart';

import '../../backend/schema/structs/item_variant_type_struct.dart';
import '../item_page/item_page_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/item_buy_bottom/item_buy_bottom_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_buy_view_model.dart';
export 'item_buy_view_model.dart';

class ItemBuyViewWidget extends StatefulWidget {
  const ItemBuyViewWidget({
    super.key,
    required this.buyObject,
    int? buyType,
  }) : this.buyType = buyType ?? 0;

  final BuyVariantObject buyObject;

  final int buyType;

  @override
  State<ItemBuyViewWidget> createState() => _ItemBuyViewWidgetState();
}

class _ItemBuyViewWidgetState extends State<ItemBuyViewWidget> {
  late ItemBuyViewModel _model;


  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemBuyViewModel());

  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ItemVariantRecord>>(
      stream: queryItemVariantRecord(
        queryBuilder: (itemVariantRecord) => itemVariantRecord.where(
          'item',
          isEqualTo: widget.buyObject.item?.reference,
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
        List<ItemVariantRecord> containerItemVariantRecordList = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 31.0, 24.0, 31.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Добавить товар в корзину',
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: Color(0x06000000),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.buyObject.item!.images.firstOrNull!,
                          width: 120.0,
                          height: 180.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Жакет Городской комфорт',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'involve',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'В наличии: ${widget.buyObject.variantSelected?.count ?? 0}',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'involve',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((widget.buyObject.item?.price != null) && (widget.buyObject.item!.price > 0.0))
                                  Text(
                                    functions.formatPrice(widget.buyObject.item!.price),
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          fontFamily: 'involve',
                                          color: Color(0xFF9E9E9E),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.lineThrough,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                Text(
                                  functions.formatPrice(widget.buyObject.item!.priceDiscounted),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'involve',
                                        color: Color(0xFFFF981F),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.buyCount = _model.buyCount - 1;
                                            if (_model.buyCount < 1) {
                                              _model.buyCount = 1;
                                            }
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.minus,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30.0,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '${_model.buyCount}',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'involve',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.buyCount = _model.buyCount + 1;
                                            if (_model.buyCount > (widget.buyObject.variantSelected?.count ?? 0)) {
                                              _model.buyCount = (widget.buyObject.variantSelected?.count ?? 0);
                                            }
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.plus,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: FlutterFlowTheme.of(context).secondaryBackground,
                //     ),
                //   ),
                // ),
                Builder(builder: (BuildContext context) {
                  if (widget.buyObject.item!.variants.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  List<ParamValueStruct> values = [];
                  for (var i in widget.buyObject.item!.variants) {
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
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                color: widget.buyObject.paramValuesSelected.contains(
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
                                                  widget.buyObject.paramValuesSelected.removeWhere((e) => e.param == doc);
                                                  widget.buyObject.paramValuesSelected.add(
                                                      ParamValueStruct(
                                                          param: doc,
                                                          value: items[index1].value
                                                      )
                                                  );
                                                  widget.buyObject.checkVariantExist(item: widget.buyObject.item!);
                                                });
                                              },
                                              child: Center(
                                                child: Text(
                                                  items[index1].value,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                      color: widget.buyObject.paramValuesSelected.contains(
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
                wrapWithModel(
                  model: _model.itemBuyBottomModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ItemBuyBottomWidget(
                    buyObject: widget.buyObject,
                    fromBuyView: true,
                    onUpdate: () {

                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
