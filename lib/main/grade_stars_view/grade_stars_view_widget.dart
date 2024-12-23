import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grade_stars_view_model.dart';
export 'grade_stars_view_model.dart';

class GradeStarsViewWidget extends StatefulWidget {
  const GradeStarsViewWidget({
    super.key,
    required this.grade,
  });

  final int? grade;

  @override
  State<GradeStarsViewWidget> createState() => _GradeStarsViewWidgetState();
}

class _GradeStarsViewWidgetState extends State<GradeStarsViewWidget> {
  late GradeStarsViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GradeStarsViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget!.grade == 1)
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/grade1.svg',
                fit: BoxFit.cover,
              ),
            ),
          if (widget!.grade == 2)
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/grade2.svg',
                fit: BoxFit.cover,
              ),
            ),
          if (widget!.grade == 3)
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/grade3.svg',
                fit: BoxFit.cover,
              ),
            ),
          if (widget!.grade == 4)
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/grade4.svg',
                fit: BoxFit.cover,
              ),
            ),
          if (widget!.grade == 5)
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/grade5.svg',
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
