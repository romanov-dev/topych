import 'package:t_o_p_y_c_h_mobile/components/networkImageView.dart';

import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/categories_horizontal_widget.dart';
import '/components/common_text_widget.dart';
import '/components/need_auth_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/item_cell/item_cell_widget.dart';
import '/menu/bottom_menu/bottom_menu_widget.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 72.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'TOPYCH',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'involve',
                                            fontSize: 40.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (loggedIn) {
                                              context.pushNamed('FavoritesPage');
                                            } else {
                                              await showDialog(
                                                barrierColor: Color(0xA8000000),
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding: EdgeInsets.zero,
                                                    backgroundColor: Colors.transparent,
                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                    child: WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(dialogContext).unfocus();
                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                        },
                                                        child: NeedAuthViewWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 48.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/Heart.svg',
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
                                      ),
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (loggedIn) {
                                              context.pushNamed('NotificationsPage');
                                            } else {
                                              await showDialog(
                                                barrierColor: Color(0xA8000000),
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding: EdgeInsets.zero,
                                                    backgroundColor: Colors.transparent,
                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                    child: WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(dialogContext).unfocus();
                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                        },
                                                        child: NeedAuthViewWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 48.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/Notification.svg',
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
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                readOnly: true,
                                // enabled: false,
                                onTap: () {
                                  context.pushNamed('ItemsSearchPage');
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
                                    // prefixIcon: Icon(
                                    //   Icons.search,
                                    // ),
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
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                            child: StreamBuilder<List<BannerRecord>>(
                              stream: queryBannerRecord(),
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
                                List<BannerRecord> containerBannerRecordList = snapshot.data!;

                                return Container(
                                  width: double.infinity,
                                  height: 218.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                  child: Visibility(
                                    visible: containerBannerRecordList.length > 0,
                                    child: Builder(
                                      builder: (context) {
                                        final banners = containerBannerRecordList.toList();

                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                child: PageView.builder(
                                                  controller: _model.pageViewController ??=
                                                      PageController(initialPage: max(0, min(0, banners.length - 1))),
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: banners.length,
                                                  itemBuilder: (context, bannersIndex) {
                                                    final bannersItem = banners[bannersIndex];
                                                    return Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(8.0),
                                                            child: NetworkImageView(image: bannersItem.image, height: 200.0, width: double.infinity),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(-1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 0.0),
                                                  child: smooth_page_indicator.SmoothPageIndicator(
                                                    controller: _model.pageViewController ??=
                                                        PageController(initialPage: max(0, min(0, banners.length - 1))),
                                                    count: banners.length,
                                                    axisDirection: Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model.pageViewController!.animateToPage(
                                                        i,
                                                        duration: Duration(milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    effect: smooth_page_indicator.ExpandingDotsEffect(
                                                      expansionFactor: 4.0,
                                                      spacing: 8.0,
                                                      radius: 8.0,
                                                      dotWidth: 8.0,
                                                      dotHeight: 8.0,
                                                      dotColor: const Color(0xffEEEEEE),
                                                      activeDotColor: FlutterFlowTheme.of(context).primary,
                                                      paintStyle: PaintingStyle.fill,
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
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.categoriesHorizontalModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CategoriesHorizontalWidget(
                                parameter1: _model.categorySelected,
                                onCategorySelected: (category) async {
                                  _model.categorySelected = category;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 268.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: StreamBuilder<List<ItemRecord>>(
                                stream: queryItemRecord(
                                  queryBuilder: (itemRecord) => itemRecord.where(
                                    'category',
                                    isEqualTo: _model.categorySelected,
                                  ),
                                  limit: 20,
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
                                  List<ItemRecord> rowItemRecordList = snapshot.data!;
                                  if (rowItemRecordList.isEmpty) {
                                    return Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.1)
                                        ),
                                        child: const Center(
                                          child: CommonTextWidget(
                                            text: 'Товаров нет',
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(rowItemRecordList.length, (rowIndex) {
                                        final rowItemRecord = rowItemRecordList[rowIndex];
                                        return Container(
                                          width: 183.0,
                                          height: 337.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                          ),
                                          child: ItemCellWidget(
                                            key: Key('Keysdj_${rowIndex}_of_${rowItemRecordList.length}'),
                                            item: rowItemRecord,
                                          ),
                                        );
                                      }).divide(SizedBox(width: 16.0)).addToStart(SizedBox(width: 16.0)).addToEnd(SizedBox(width: 16.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                                    List<CategoryRecord> gridViewCategoryRecordList = snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16.0,
                                        mainAxisSpacing: 16.0,
                                        childAspectRatio: 2.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: gridViewCategoryRecordList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewCategoryRecord = gridViewCategoryRecordList[gridViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'ItemsAllPage',
                                              queryParameters: {
                                                'category': serializeParam(
                                                  gridViewCategoryRecord,
                                                  ParamType.Document,
                                                ),
                                                'title': serializeParam(
                                                  gridViewCategoryRecord.name,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'category': gridViewCategoryRecord,
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF6F6F6),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF6F6F6),
                                                    borderRadius: BorderRadius.circular(4.0),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 0.0, 0.0),
                                                    child: Text(
                                                      gridViewCategoryRecord.name,
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
                                                Align(
                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(0.0),
                                                      bottomRight: Radius.circular(4.0),
                                                      topLeft: Radius.circular(0.0),
                                                      topRight: Radius.circular(4.0),
                                                    ),
                                                    child: Image.network(
                                                      gridViewCategoryRecord.image,
                                                      width: 100.0,
                                                      height: double.infinity,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                            child: StreamBuilder<List<ItemRecord>>(
                              stream: queryItemRecord(
                                queryBuilder: (itemRecord) => itemRecord
                                    .where(
                                      'buyTimes',
                                      isGreaterThan: 0,
                                    )
                                    .orderBy('buyTimes', descending: true),
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
                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                    child: Text(
                                                      'Популярное',
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
                                                        'type': serializeParam(
                                                          0,
                                                          ParamType.int,
                                                        ),
                                                        'title': serializeParam(
                                                          'Популярное',
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
                                                          key: Key('Key93y_${popularItemsIndex}_of_${popularItems.length}'),
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
                          AuthUserStreamWidget(
                            builder: (context) => StreamBuilder<List<ItemRecord>>(
                              stream: queryItemRecord(
                                queryBuilder: (itemRecord) =>
                                    itemRecord.whereIn('category', (currentUserDocument?.categories?.toList() ?? [])),
                                limit: 20,
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

                                if (containerItemRecordList.isEmpty) {
                                  return const SizedBox.shrink();
                                }

                                return Container(
                                  margin: EdgeInsets.only(top: 28),
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
                                                      'Для вас',
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
                                                        'type': serializeParam(
                                                          1,
                                                          ParamType.int,
                                                        ),
                                                        'title': serializeParam('Для вас', ParamType.String)
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
                                                          key: Key('Keyf86_${popularItemsIndex}_of_${popularItems.length}'),
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
                        ].addToEnd(SizedBox(height: 30.0)),
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.bottomMenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomMenuWidget(),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('AdminPage');
                  },
                  text: 'Admin',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'involve',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
