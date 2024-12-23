import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/grade_stars_view/grade_stars_view_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'review_cell_widget.dart' show ReviewCellWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ReviewCellModel extends FlutterFlowModel<ReviewCellWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for gradeStarsView component.
  late GradeStarsViewModel gradeStarsViewModel;

  @override
  void initState(BuildContext context) {
    gradeStarsViewModel = createModel(context, () => GradeStarsViewModel());
  }

  @override
  void dispose() {
    gradeStarsViewModel.dispose();
  }
}
