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
                  text: widget!.category != null
                      ? widget!.category!.name
                      : (widget!.type != null
                          ? widget!.type!.toString()
                          : widget!.title),
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
                      }.withoutNulls,
                    );
                  },
                ),
              ),
              Expanded(
                child: StreamBuilder<List<ItemRecord>>(
                  stream: queryItemRecord(
                    queryBuilder: (itemRecord) => itemRecord.where(
                      'category',
                      isEqualTo: widget!.category?.reference,
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
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.itemsGridModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ItemsGridWidget(),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(height: 8.0))
                                  .addToEnd(SizedBox(height: 30.0)),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 30.0),
                              child: wrapWithModel(
                                model: _model.itemsSortFilterViewModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ItemsSortFilterViewWidget(),
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
