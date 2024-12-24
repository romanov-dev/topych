import 'package:t_o_p_y_c_h_mobile/main/items_search_page/items_search_page_widget.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/general_checkbox_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar02_text/navbar02_text_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_filters_param_page_model.dart';
export 'item_filters_param_page_model.dart';

class ItemFiltersParamPageWidget extends StatefulWidget {
  const ItemFiltersParamPageWidget({
    super.key,
    required this.param,
    required this.values,
    this.filterData,
  });

  final ParamRecord? param;
  final List<ParamValueRecord>? values;
  final FilterData? filterData;

  @override
  State<ItemFiltersParamPageWidget> createState() => _ItemFiltersParamPageWidgetState();
}

class _ItemFiltersParamPageWidgetState extends State<ItemFiltersParamPageWidget> {
  late ItemFiltersParamPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemFiltersParamPageModel());
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
                child: Navbar02TextWidget(
                  text: widget!.param!.name,
                  showBack: true,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Builder(
                    builder: (context) {
                      final valuesList = widget!.values!.toList();

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(valuesList.length, (valuesListIndex) {
                            final valuesListItem = valuesList[valuesListIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  var value = ParamValueStruct(
                                    param: widget!.param?.reference,
                                    value: valuesListItem.value,
                                  );

                                  if ((widget.filterData?.values ?? []).contains(value)) {
                                    widget.filterData?.values.removeWhere((e) => e == value);
                                  } else {
                                    widget.filterData?.values.add(value);
                                  }
                                });
                              },
                              child: Container(
                                height: 46.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 4.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      GeneralCheckboxWidget(
                                        key: Key('Keyf4g_${valuesListIndex}_of_${valuesList.length}'),
                                        checked: widget.filterData?.values?.contains(ParamValueStruct(
                                          param: widget!.param?.reference,
                                          value: valuesListItem.value,
                                        )),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valuesListItem.value,
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
                          }).addToEnd(SizedBox(height: 24.0)),
                        ),
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
