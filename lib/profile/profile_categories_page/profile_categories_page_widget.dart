import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general_button_widget.dart';
import '/components/general_checkbox_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar01_clear/navbar01_clear_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_categories_page_model.dart';
export 'profile_categories_page_model.dart';

class ProfileCategoriesPageWidget extends StatefulWidget {
  const ProfileCategoriesPageWidget({super.key});

  @override
  State<ProfileCategoriesPageWidget> createState() =>
      _ProfileCategoriesPageWidgetState();
}

class _ProfileCategoriesPageWidgetState
    extends State<ProfileCategoriesPageWidget> {
  late ProfileCategoriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCategoriesPageModel());
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
        backgroundColor: Colors.white,
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
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 8.0, 24.0, 0.0),
                          child: Text(
                            'Категории товаров',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'involve',
                                  fontSize: 26.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 8.0, 24.0, 0.0),
                          child: Text(
                            'Выберите категорию товаров, которая Вас интересует',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'involve',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        StreamBuilder<List<CategoryRecord>>(
                          stream: queryCategoryRecord(),
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

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                56.0,
                                0,
                                24.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewCategoryRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 24.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewCategoryRecord =
                                    listViewCategoryRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.categoriesSelected.contains(
                                          listViewCategoryRecord.reference)) {
                                        _model.removeFromCategoriesSelected(
                                            listViewCategoryRecord.reference);
                                        safeSetState(() {});
                                      } else {
                                        _model.addToCategoriesSelected(
                                            listViewCategoryRecord.reference);
                                        safeSetState(() {});
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 62.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            GeneralCheckboxWidget(
                                              key: Key(
                                                  'Key192_${listViewIndex}_of_${listViewCategoryRecordList.length}'),
                                              checked: _model.categoriesSelected
                                                  .contains(
                                                      listViewCategoryRecord
                                                          .reference),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  listViewCategoryRecord.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'involve',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.generalButtonModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: GeneralButtonWidget(
                          title: 'Применить',
                          isActive: _model.categoriesSelected.length > 0,
                          onTap: () async {
                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'categories': _model.categoriesSelected,
                                },
                              ),
                            });
                            context.safePop();
                            context.safePop();
                            context.safePop();
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.generalButtonModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: GeneralButtonWidget(
                          title: 'Пропустить',
                          isActive: true,
                          bgColor: Color(0xFFEAEAEA),
                          textColor: FlutterFlowTheme.of(context).primaryText,
                          onTap: () async {
                            context.safePop();
                            context.safePop();
                            context.safePop();
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
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
