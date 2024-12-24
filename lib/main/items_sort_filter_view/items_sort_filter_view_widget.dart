import 'package:flutter/cupertino.dart';
import 'package:t_o_p_y_c_h_mobile/index.dart';
import 'package:t_o_p_y_c_h_mobile/main/items_search_page/items_search_page_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/items_sort_view/items_sort_view_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'items_sort_filter_view_model.dart';
export 'items_sort_filter_view_model.dart';

class ItemsSortFilterViewWidget extends StatefulWidget {
  const ItemsSortFilterViewWidget({super.key, this.onUpdate, required this.filterData, this.category});

  final Function()? onUpdate;
  final DocumentReference? category;

  final FilterData filterData;

  @override
  State<ItemsSortFilterViewWidget> createState() => _ItemsSortFilterViewWidgetState();
}

class _ItemsSortFilterViewWidgetState extends State<ItemsSortFilterViewWidget> {
  late ItemsSortFilterViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsSortFilterViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            height: 53.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Color(0x61000000),
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: ItemsSortViewWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                      if (widget.onUpdate != null) {
                        widget.onUpdate!();
                      }
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/Swap.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Сортировать',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'involve',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // await context.pushNamed('ItemsFilterPage');
                        await Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ItemsFilterPageWidget(
                                filterData: widget.filterData,
                                category: widget.category,
                              ),
                              fullscreenDialog: true
                          ),
                        );

                        if (widget.onUpdate != null) {
                          widget.onUpdate!();
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/Filter.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Фильтр',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'involve',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 32.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
