import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/custom_functions.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'grade_stars_view/grade_stars_view_widget.dart';

class ReviewsHeaderWidget extends StatefulWidget {
  const ReviewsHeaderWidget({
    super.key,
    required this.item,
  });

  final ItemRecord item;

  @override
  State<ReviewsHeaderWidget> createState() => _ReviewsHeaderWidgetState();
}

class _ReviewsHeaderWidgetState extends State<ReviewsHeaderWidget> {
  late ItemRecord containerItemRecord;

  @override
  void initState() {
    super.initState();
    containerItemRecord = widget.item;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Container(
                // width: 100.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        itemRate(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 48.0,
                        ),
                      ),
                    ),
                    // RichText(
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: itemRate(),
                    //         style: const TextStyle(
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 48.0,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: "/5",
                    //         style: TextStyle(
                    //           color: FlutterFlowTheme.of(context).secondaryText,
                    //           fontSize: 12.0,
                    //           fontWeight: FontWeight.w300,
                    //         ),
                    //       )
                    //     ],
                    //     style: FlutterFlowTheme.of(context).bodyMedium,
                    //   ),
                    //   // textScaler: TextScaler.linear(MediaQuery.of(context).textScaleFactor),
                    // ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    //   child: Image.asset(
                    //     'assets/images/Frame_3000.png',
                    //     width: double.infinity,
                    //     height: 15.0,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      // child: SvgPicture.asset(
                      //   getRateImage(itemRatesList()),
                      //   width: double.infinity,
                      //   height: 16,
                      //   fit: BoxFit.cover,
                      // ),
                      child: GradeStarsViewWidget(
                        grade: int.parse(itemRate()),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            functions.getExperienceString(containerItemRecord.rates.length, "рейтинг", "рейтинга", "рейтингов", false),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          child: Text(
                            "•",
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            functions.getExperienceString(containerItemRecord.rates.length, "оценка", "оценки", "оценок", false),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
          ),
          // Container(
          //   width: 27.0,
          //   decoration: BoxDecoration(),
          //   child: Align(
          //     alignment: AlignmentDirectional(0.00, 0.00),
          //     child: Container(
          //       width: 1.0,
          //       height: 59.0,
          //       decoration: BoxDecoration(
          //         color: Color(0x192D2D2D),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // SvgPicture.asset(
                      //   'assets/images/rates_5.svg',
                      //   height: 12,
                      //   fit: BoxFit.cover,
                      // ),
                      Text(
                        // "${itemRatesList().where((p0) => p0 == 5).toList().length}",
                        "5",
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(13, 0, 13, 0),
                            child: LinearPercentIndicator(
                              percent: getRatePercentage(
                                  fullLength: itemRatesList().length, localLength: itemRatesList().where((p0) => p0 == 5).toList().length),
                              lineHeight: 1,
                              animation: true,
                              progressColor: Color(0xFF1D1D1D),
                              backgroundColor: Color(0xFF9A9A9A),
                              center: Text(
                                '50%',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                ),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 1),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // SvgPicture.asset(
                        //   'assets/images/rates_4.svg',
                        //   height: 12,
                        //   fit: BoxFit.cover,
                        // ),
                        Text(
                          // "${itemRatesList().where((p0) => p0 == 5).toList().length}",
                          "4",
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(13, 0, 13, 0),
                              child: LinearPercentIndicator(
                                percent: getRatePercentage(
                                    fullLength: itemRatesList().length, localLength: itemRatesList().where((p0) => p0 == 4).toList().length),
                                lineHeight: 1,
                                animation: true,
                                progressColor: Color(0xFF1D1D1D),
                                backgroundColor: Color(0xFF9A9A9A),
                                center: Text(
                                  '50%',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                        // Text(
                        //   "${itemRatesList().where((p0) => p0 == 4).toList().length}",
                        //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //     fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                        //     color: FlutterFlowTheme.of(context).secondaryText,
                        //     fontSize: 10,
                        //     fontWeight: FontWeight.w500,
                        //     useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 1),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // SvgPicture.asset(
                        //   'assets/images/rates_3.svg',
                        //   height: 12,
                        //   fit: BoxFit.cover,
                        // ),
                        Text(
                          // "${itemRatesList().where((p0) => p0 == 5).toList().length}",
                          "3",
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(13, 0, 13, 0),
                              child: LinearPercentIndicator(
                                percent: getRatePercentage(
                                    fullLength: itemRatesList().length, localLength: itemRatesList().where((p0) => p0 == 3).toList().length),
                                lineHeight: 1,
                                animation: true,
                                progressColor: Color(0xFF1D1D1D),
                                backgroundColor: Color(0xFF9A9A9A),
                                center: Text(
                                  '50%',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                        // Text(
                        //   "${itemRatesList().where((p0) => p0 == 3).toList().length}",
                        //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //     fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                        //     color: FlutterFlowTheme.of(context).secondaryText,
                        //     fontSize: 10,
                        //     fontWeight: FontWeight.w500,
                        //     useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 1),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // SvgPicture.asset(
                        //   'assets/images/rates_2.svg',
                        //   height: 12,
                        //   fit: BoxFit.cover,
                        // ),
                        Text(
                          // "${itemRatesList().where((p0) => p0 == 5).toList().length}",
                          "2",
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(13, 0, 13, 0),
                              child: LinearPercentIndicator(
                                percent: getRatePercentage(
                                    fullLength: itemRatesList().length, localLength: itemRatesList().where((p0) => p0 == 2).toList().length),
                                lineHeight: 1,
                                animation: true,
                                progressColor: Color(0xFF1D1D1D),
                                backgroundColor: Color(0xFF9A9A9A),
                                center: Text(
                                  '50%',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                        // Text(
                        //   "${itemRatesList().where((p0) => p0 == 2).toList().length}",
                        //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //     fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                        //     color: FlutterFlowTheme.of(context).secondaryText,
                        //     fontSize: 10,
                        //     fontWeight: FontWeight.w500,
                        //     useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 1),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // SvgPicture.asset(
                        //   'assets/images/rates_1.svg',
                        //   height: 12,
                        //   fit: BoxFit.cover,
                        // ),
                        Text(
                          // "${itemRatesList().where((p0) => p0 == 5).toList().length}",
                          "1",
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(13, 0, 13, 0),
                              child: LinearPercentIndicator(
                                percent: getRatePercentage(
                                    fullLength: itemRatesList().length, localLength: itemRatesList().where((p0) => p0 == 1).toList().length),
                                lineHeight: 1,
                                animation: true,
                                progressColor: Color(0xFF1D1D1D),
                                backgroundColor: Color(0xFF9A9A9A),
                                center: Text(
                                  '50%',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                        // Text(
                        //   "${itemRatesList().where((p0) => p0 == 1).toList().length}",
                        //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //     fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                        //     color: FlutterFlowTheme.of(context).secondaryText,
                        //     fontSize: 10,
                        //     fontWeight: FontWeight.w500,
                        //     useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    
  }

  String itemRate() {
    double rate = 0;
    List<int> rates = [];
    for (var i in containerItemRecord.rates) {
      rates.add(i);
    }
    for (var i in rates) {
      rate += i;
    }

    return "${rate ~/ (rates.isNotEmpty ? rates.length : 1)}";
  }

  // List<int> itemRatesList(List<ReviewRecord> reviews) {
  //   List<int> rates = [];
  //   for (var i in reviews) {
  //     rates.add(i.grade);
  //   }
  //   return rates;
  // }
  List<int> itemRatesList() {
    List<int> rates = [];
    for (var i in containerItemRecord.rates) {
      rates.add(i);
    }
    return rates;
  }
}
