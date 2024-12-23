import '/admin/admin_category_cell/admin_category_cell_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar01_clear/navbar01_clear_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_categories_page_model.dart';
export 'admin_categories_page_model.dart';

class AdminCategoriesPageWidget extends StatefulWidget {
  const AdminCategoriesPageWidget({super.key});

  @override
  State<AdminCategoriesPageWidget> createState() =>
      _AdminCategoriesPageWidgetState();
}

class _AdminCategoriesPageWidgetState extends State<AdminCategoriesPageWidget> {
  late AdminCategoriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminCategoriesPageModel());
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
                model: _model.navbar01ClearModel,
                updateCallback: () => safeSetState(() {}),
                child: Navbar01ClearWidget(),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<CategoryRecord>>(
                    stream: queryCategoryRecord(
                      queryBuilder: (categoryRecord) =>
                          categoryRecord.orderBy('index'),
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
                      List<CategoryRecord> listViewCategoryRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCategoryRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCategoryRecord =
                              listViewCategoryRecordList[listViewIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.editRef = listViewCategoryRecord.reference;
                              safeSetState(() {});
                            },
                            child: AdminCategoryCellWidget(
                              key: Key(
                                  'Key1bc_${listViewIndex}_of_${listViewCategoryRecordList.length}'),
                              category: listViewCategoryRecord,
                              ref: _model.editRef,
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
